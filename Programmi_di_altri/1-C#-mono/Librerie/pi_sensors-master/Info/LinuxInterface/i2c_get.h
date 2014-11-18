#ifndef _rpi_i2c_c
#define _rpi_i2c_c

#define byte unsigned char

#ifdef __cplusplus
extern "C" {
#endif

extern int Get (char *i2cbusid, char *deviceaddress, char *dataaddress);

#ifdef __cplusplus
}
#endif

#endif