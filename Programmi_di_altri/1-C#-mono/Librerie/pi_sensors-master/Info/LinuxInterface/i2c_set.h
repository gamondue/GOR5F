#ifndef _rpi_i2c_c
#define _rpi_i2c_c

#define byte unsigned char

#ifdef __cplusplus
extern "C" {
#endif

extern int Set (char *i2cbusid, char *deviceaddress, char *dataaddress, char *datavalue, int bforce);

#ifdef __cplusplus
}
#endif

#endif