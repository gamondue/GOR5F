#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "i2c-dev.h" //I2C_SMBUS* Enums
#include "i2cbusses.h"
#include "util.h"
#include "i2c_get.h"
#include <fcntl.h>
#include <string.h>
#include <sys/ioctl.h>

int check_funcs(int file, int size, int daddress, int pec)
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
		if (!(funcs & I2C_FUNC_SMBUS_READ_BYTE)) {
			fprintf(stderr, MISSING_FUNC_FMT, "SMBus receive byte");
			return -1;
		}
		if (daddress >= 0
		 && !(funcs & I2C_FUNC_SMBUS_WRITE_BYTE)) {
			fprintf(stderr, MISSING_FUNC_FMT, "SMBus send byte");
			return -1;
		}
		break;

	case I2C_SMBUS_BYTE_DATA:
		if (!(funcs & I2C_FUNC_SMBUS_READ_BYTE_DATA)) {
			fprintf(stderr, MISSING_FUNC_FMT, "SMBus read byte");
			return -1;
		}
		break;

	case I2C_SMBUS_WORD_DATA:
		if (!(funcs & I2C_FUNC_SMBUS_READ_WORD_DATA)) {
			fprintf(stderr, MISSING_FUNC_FMT, "SMBus read word");
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

int Get(char *i2cbusid, char *deviceaddress, char *dataaddress)
{
	//i2get -y 1 0x13 0x81
	int res, i2cbus, address, size, file, force, pec;
	int daddress;
	char filename[20];
	char *end;

	force = 0, pec = 0;

	i2cbus = lookup_i2c_bus(i2cbusid);
	address = parse_i2c_address(deviceaddress);

	size = I2C_SMBUS_BYTE_DATA;
		daddress = strtol(dataaddress, &end, 0);
		if (*end || daddress < 0 || daddress > 0xff) {
			fprintf(stderr, "Error: Data address invalid!\n");
		}

	file = open_i2c_dev(i2cbus, filename, sizeof(filename), 0);
	if (file < 0
	 || check_funcs(file, size, daddress, pec)
	 || set_slave_addr(file, address, force))
		exit(1);

	switch (size) 
	{
		case I2C_SMBUS_BYTE:
			if (daddress >= 0) 
			{
				res = i2c_smbus_write_byte(file, daddress);
				if (res < 0)
					fprintf(stderr, "Warning - write failed\n");
			}
			res = i2c_smbus_read_byte(file);
			break;
		case I2C_SMBUS_WORD_DATA:
			res = i2c_smbus_read_word_data(file, daddress);
			break;
		default: /* I2C_SMBUS_BYTE_DATA */
			res = i2c_smbus_read_byte_data(file, daddress);
	}
	close(file);

	//printf("0x%0*x\n", size == I2C_SMBUS_WORD_DATA ? 4 : 2, res);
	return 	res;	

}