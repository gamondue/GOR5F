#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "i2cbusses.h"
#include "util.h"
#include "i2c-dev.h" //I2C_SMBUS* Enums
#include "i2c_set.h"
#include <fcntl.h>
#include <sys/ioctl.h>

static int check_funcs(int file, int size, int pec)
{
	unsigned long funcs;

	/* check adapter functionality */
	if (ioctl(file, I2C_FUNCS, &funcs) < 0) {
		fprintf(stderr, "Error: Could not get the adapter "
			"functionality matrix: %s\n", strerror(errno));
		return -1;
	}

	switch (size) {
	case I2C_SMBUS_BYTE:
		if (!(funcs & I2C_FUNC_SMBUS_WRITE_BYTE)) {
			fprintf(stderr, MISSING_FUNC_FMT, "SMBus send byte");
			return -1;
		}
		break;

	case I2C_SMBUS_BYTE_DATA:
		if (!(funcs & I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
			fprintf(stderr, MISSING_FUNC_FMT, "SMBus write byte");
			return -1;
		}
		break;

	case I2C_SMBUS_WORD_DATA:
		if (!(funcs & I2C_FUNC_SMBUS_WRITE_WORD_DATA)) {
			fprintf(stderr, MISSING_FUNC_FMT, "SMBus write word");
			return -1;
		}
		break;

	case I2C_SMBUS_BLOCK_DATA:
		if (!(funcs & I2C_FUNC_SMBUS_WRITE_BLOCK_DATA)) {
			fprintf(stderr, MISSING_FUNC_FMT, "SMBus block write");
			return -1;
		}
		break;
	case I2C_SMBUS_I2C_BLOCK_DATA:
		if (!(funcs & I2C_FUNC_SMBUS_WRITE_I2C_BLOCK)) {
			fprintf(stderr, MISSING_FUNC_FMT, "I2C block write");
			return -1;
		}
		break;
	}

	if (pec
	 && !(funcs & (I2C_FUNC_SMBUS_PEC | I2C_FUNC_I2C))) {
		fprintf(stderr, "Warning: Adapter does "
			"not seem to support PEC\n");
	}

	return 0;
}

int Set(char *i2cbusid, char *deviceaddress, char *dataaddress, char *datavalue, int bforce)
{
	char *end;
	int res, i2cbus, address, size, file;
	int value, daddress;
	char filename[20];
	int pec = 0;
	int force = 0;
	unsigned char block[I2C_SMBUS_BLOCK_MAX];
	int len;

	if(bforce == 1) { force = 1; }
		
	i2cbus = lookup_i2c_bus(i2cbusid);
	if (i2cbus < 0)
		return 1;

	address = parse_i2c_address(deviceaddress);
	if (address < 0)
		return 1;

	daddress = strtol(dataaddress, &end, 0);
	if (*end || daddress < 0 || daddress > 0xff) {
		fprintf(stderr, "Error: Data address invalid!\n");
		return 1;
	}

	if(datavalue != NULL)
	{
		size = I2C_SMBUS_BYTE_DATA;
	}
	else
	{
		size = I2C_SMBUS_BYTE;
	}

	len = 0; /* Must always initialize len since it is passed to confirm() */

	/* read values from command line */
	switch (size) {
	case I2C_SMBUS_BYTE_DATA:
	case I2C_SMBUS_WORD_DATA:
		value = strtol(datavalue, &end, 0);
		if (*end || value < 0) {
			fprintf(stderr, "Error: Data value invalid!\n");
			return 1;
		}
		if ((size == I2C_SMBUS_BYTE_DATA && value > 0xff)
		    || (size == I2C_SMBUS_WORD_DATA && value > 0xffff)) {
			fprintf(stderr, "Error: Data value out of range!\n");
			return 1;
		}
		break;
	default:
		value = -1;
		break;
	}

	file = open_i2c_dev(i2cbus, filename, sizeof(filename), 0);
	if (file < 0
	 || check_funcs(file, size, pec)
	 || set_slave_addr(file, address, force))
		return 1;

	switch (size) {
	case I2C_SMBUS_BYTE:
		res = i2c_smbus_write_byte(file, daddress);
		break;
	case I2C_SMBUS_WORD_DATA:
		res = i2c_smbus_write_word_data(file, daddress, value);
		break;
	case I2C_SMBUS_BLOCK_DATA:
		res = i2c_smbus_write_block_data(file, daddress, len, block);
		break;
	case I2C_SMBUS_I2C_BLOCK_DATA:
		res = i2c_smbus_write_i2c_block_data(file, daddress, len, block);
		break;
	default: /* I2C_SMBUS_BYTE_DATA */
		res = i2c_smbus_write_byte_data(file, daddress, value);
		break;
	}
	if (res < 0) {
		fprintf(stderr, "Error: Write failed\n");
		close(file);
		return 1;
	}

	close(file);
	return 0;
}

