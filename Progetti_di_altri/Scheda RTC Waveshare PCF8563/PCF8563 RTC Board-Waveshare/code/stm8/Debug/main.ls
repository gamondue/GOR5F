   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.9.2 - 29 Jun 2010
   3                     ; Generator V4.3.5 - 02 Jul 2010
2878                     ; 52 void delay_ms(u16 ms)
2878                     ; 53 {
2880                     	switch	.text
2881  0000               _delay_ms:
2883  0000 89            	pushw	x
2884  0001 88            	push	a
2885       00000001      OFST:	set	1
2888  0002 201b          	jra	L5302
2889  0004               L3302:
2890                     ; 57 				for(i=0;i<250;i++)
2892  0004 0f01          	clr	(OFST+0,sp)
2893  0006               L1402:
2896  0006 0c01          	inc	(OFST+0,sp)
2899  0008 7b01          	ld	a,(OFST+0,sp)
2900  000a a1fa          	cp	a,#250
2901  000c 25f8          	jrult	L1402
2902                     ; 59 				for(i=0;i<75;i++)
2904  000e 0f01          	clr	(OFST+0,sp)
2905  0010               L7402:
2908  0010 0c01          	inc	(OFST+0,sp)
2911  0012 7b01          	ld	a,(OFST+0,sp)
2912  0014 a14b          	cp	a,#75
2913  0016 25f8          	jrult	L7402
2914                     ; 61 				ms--;
2916  0018 1e02          	ldw	x,(OFST+1,sp)
2917  001a 1d0001        	subw	x,#1
2918  001d 1f02          	ldw	(OFST+1,sp),x
2919  001f               L5302:
2920                     ; 55 			while(ms!=0)
2922  001f 1e02          	ldw	x,(OFST+1,sp)
2923  0021 26e1          	jrne	L3302
2924                     ; 63 }
2927  0023 5b03          	addw	sp,#3
2928  0025 81            	ret
2971                     ; 65 void delay_us(u16 us)
2971                     ; 66 {
2972                     	switch	.text
2973  0026               _delay_us:
2975  0026 89            	pushw	x
2976  0027 88            	push	a
2977       00000001      OFST:	set	1
2980  0028 201b          	jra	L1012
2981  002a               L7702:
2982                     ; 70 				for(i=0;i<25;i++)
2984  002a 0f01          	clr	(OFST+0,sp)
2985  002c               L5012:
2988  002c 0c01          	inc	(OFST+0,sp)
2991  002e 7b01          	ld	a,(OFST+0,sp)
2992  0030 a119          	cp	a,#25
2993  0032 25f8          	jrult	L5012
2994                     ; 72 				for(i=0;i<7;i++)
2996  0034 0f01          	clr	(OFST+0,sp)
2997  0036               L3112:
3000  0036 0c01          	inc	(OFST+0,sp)
3003  0038 7b01          	ld	a,(OFST+0,sp)
3004  003a a107          	cp	a,#7
3005  003c 25f8          	jrult	L3112
3006                     ; 74 				us--;
3008  003e 1e02          	ldw	x,(OFST+1,sp)
3009  0040 1d0001        	subw	x,#1
3010  0043 1f02          	ldw	(OFST+1,sp),x
3011  0045               L1012:
3012                     ; 68 			while(us!=0)
3014  0045 1e02          	ldw	x,(OFST+1,sp)
3015  0047 26e1          	jrne	L7702
3016                     ; 76 }
3019  0049 5b03          	addw	sp,#3
3020  004b 81            	ret
3066                     ; 18 void I2C_Init(void)
3066                     ; 19 {
3067                     	switch	.text
3068  004c               _I2C_Init:
3072                     ; 20 		I2C_FREQR=0x0f;    //设置频率寄存器
3074  004c 350f5212      	mov	_I2C_FREQR,#15
3075                     ; 21 		I2C_CCRH=0x00;     //设置始终寄存器高位
3077  0050 725f521c      	clr	_I2C_CCRH
3078                     ; 22 		I2C_CCRL=0x50;     //设置始终寄存器低位
3080  0054 3550521b      	mov	_I2C_CCRL,#80
3081                     ; 23 		I2C_TRISER=0x11;   //设置最大SCL上升时间
3083  0058 3511521d      	mov	_I2C_TRISER,#17
3084                     ; 24 		I2C_CR1|=0x01;     //使能I2C模块
3086  005c 72105210      	bset	_I2C_CR1,#0
3087                     ; 25 		I2C_Ack();         //设置匹配应答
3089  0060 72145211      	bset	_I2C_CR2,#2
3090                     ; 26 		I2C_CR2|=0x08;     //设置接收应答
3093  0064 72165211      	bset	_I2C_CR2,#3
3094                     ; 27 }
3097  0068 81            	ret
3123                     ; 30 void I2C_Start(void)
3123                     ; 31 {
3124                     	switch	.text
3125  0069               _I2C_Start:
3129  0069               L1512:
3130                     ; 32 	I2C_busy();
3132  0069 c65219        	ld	a,_I2C_SR3
3133  006c a402          	and	a,#2
3134  006e a101          	cp	a,#1
3135  0070 27f7          	jreq	L1512
3136                     ; 33 	I2C_start();
3139  0072 72105211      	bset	_I2C_CR2,#0
3142  0076               L7512:
3143                     ; 34 	while(I2C_SBask==0);
3145  0076 c65217        	ld	a,_I2C_SR1
3146  0079 a501          	bcp	a,#1
3147  007b 27f9          	jreq	L7512
3148                     ; 35 }
3151  007d 81            	ret
3188                     ; 37 void I2C_SendDAdr(u8 Add)
3188                     ; 38 {
3189                     	switch	.text
3190  007e               _I2C_SendDAdr:
3194                     ; 39 	I2C_writebyte(Add);	
3196  007e c75216        	ld	_I2C_DR,a
3199  0081               L3022:
3200                     ; 40 	while(I2C_addrask==0);
3202  0081 c65217        	ld	a,_I2C_SR1
3203  0084 a502          	bcp	a,#2
3204  0086 27f9          	jreq	L3022
3206  0088               L1122:
3207                     ; 41 	I2C_busy();
3209  0088 c65219        	ld	a,_I2C_SR3
3210  008b a402          	and	a,#2
3211  008d a101          	cp	a,#1
3212  008f 27f7          	jreq	L1122
3213                     ; 42 }
3217  0091 81            	ret
3254                     ; 45 void I2C_SendDat(u8 data)
3254                     ; 46 {
3255                     	switch	.text
3256  0092               _I2C_SendDat:
3260                     ; 47 	I2C_writebyte(data);
3262  0092 c75216        	ld	_I2C_DR,a
3265  0095               L5322:
3266                     ; 48 	I2C_busy();
3268  0095 c65219        	ld	a,_I2C_SR3
3269  0098 a402          	and	a,#2
3270  009a a101          	cp	a,#1
3271  009c 27f7          	jreq	L5322
3274  009e               L3422:
3275                     ; 49 	while(I2C_TxEask==0);
3277  009e c65217        	ld	a,_I2C_SR1
3278  00a1 a580          	bcp	a,#128
3279  00a3 27f9          	jreq	L3422
3280                     ; 50 }
3283  00a5 81            	ret
3319                     ; 52 u8 I2C_RcvDat(void)
3319                     ; 53 {
3320                     	switch	.text
3321  00a6               _I2C_RcvDat:
3323  00a6 88            	push	a
3324       00000001      OFST:	set	1
3327  00a7               L1722:
3328                     ; 55 	while(I2C_RxNeask==0);
3330  00a7 c65217        	ld	a,_I2C_SR1
3331  00aa a540          	bcp	a,#64
3332  00ac 27f9          	jreq	L1722
3333  00ae               L7422:
3334                     ; 56 	abc:
3334                     ; 57 	if(I2C_BTF==0x04)
3336  00ae c65217        	ld	a,_I2C_SR1
3337  00b1 a404          	and	a,#4
3338  00b3 a104          	cp	a,#4
3339  00b5 26f7          	jrne	L7422
3340                     ; 58 	{i=I2C_DR;}
3342  00b7 c65216        	ld	a,_I2C_DR
3343  00ba 6b01          	ld	(OFST+0,sp),a
3345                     ; 60 	if(I2C_BTF==0){}
3347  00bc c65217        	ld	a,_I2C_SR1
3348  00bf a504          	bcp	a,#4
3349  00c1 26eb          	jrne	L7422
3351                     ; 62 	return i;
3353  00c3 7b01          	ld	a,(OFST+0,sp)
3356  00c5 5b01          	addw	sp,#1
3357  00c7 81            	ret
3421                     ; 57 void WriteAByte(u8 wordAdr,u8 dat)
3421                     ; 58 {
3422                     	switch	.text
3423  00c8               _WriteAByte:
3425  00c8 89            	pushw	x
3426       00000000      OFST:	set	0
3429                     ; 59 	I2C_Start();
3431  00c9 ad9e          	call	_I2C_Start
3433                     ; 60 	I2C_SendDAdr(WD_DADR);
3435  00cb a6a2          	ld	a,#162
3436  00cd adaf          	call	_I2C_SendDAdr
3438                     ; 61 	I2C_SendDat(wordAdr);
3440  00cf 7b01          	ld	a,(OFST+1,sp)
3441  00d1 adbf          	call	_I2C_SendDat
3443                     ; 62 	I2C_SendDat(dat);
3445  00d3 7b02          	ld	a,(OFST+2,sp)
3446  00d5 adbb          	call	_I2C_SendDat
3448                     ; 63 	I2C_stop();
3450  00d7 72125211      	bset	_I2C_CR2,#1
3451                     ; 64 }
3455  00db 85            	popw	x
3456  00dc 81            	ret
3505                     ; 66 void PCF8563_getTime(u8 *buf)
3505                     ; 67 {  
3506                     	switch	.text
3507  00dd               _PCF8563_getTime:
3509  00dd 89            	pushw	x
3510  00de 89            	pushw	x
3511       00000002      OFST:	set	2
3514                     ; 69 	I2C_Start();
3516  00df ad88          	call	_I2C_Start
3518                     ; 70 	I2C_SendDAdr(WD_DADR);
3520  00e1 a6a2          	ld	a,#162
3521  00e3 ad99          	call	_I2C_SendDAdr
3523                     ; 71 	I2C_SendDat(SECOND_DATA_BUF);
3525  00e5 a602          	ld	a,#2
3526  00e7 ada9          	call	_I2C_SendDat
3528                     ; 72 	I2C_Start();
3530  00e9 cd0069        	call	_I2C_Start
3532                     ; 73 	I2C_SendDAdr(RD_DADR);
3534  00ec a6a3          	ld	a,#163
3535  00ee ad8e          	call	_I2C_SendDAdr
3537                     ; 74 	for(i=0;i<2;i++)
3539  00f0 0f02          	clr	(OFST+0,sp)
3540  00f2               L7532:
3541                     ; 76 		buf[i]=I2C_RcvDat();
3543  00f2 7b03          	ld	a,(OFST+1,sp)
3544  00f4 97            	ld	xl,a
3545  00f5 7b04          	ld	a,(OFST+2,sp)
3546  00f7 1b02          	add	a,(OFST+0,sp)
3547  00f9 2401          	jrnc	L62
3548  00fb 5c            	incw	x
3549  00fc               L62:
3550  00fc 02            	rlwa	x,a
3551  00fd 89            	pushw	x
3552  00fe ada6          	call	_I2C_RcvDat
3554  0100 85            	popw	x
3555  0101 f7            	ld	(x),a
3556                     ; 74 	for(i=0;i<2;i++)
3558  0102 0c02          	inc	(OFST+0,sp)
3561  0104 7b02          	ld	a,(OFST+0,sp)
3562  0106 a102          	cp	a,#2
3563  0108 25e8          	jrult	L7532
3564                     ; 78 	I2C_NAck();
3566  010a 72155211      	bres	_I2C_CR2,#2
3567                     ; 79 	buf[i]=I2C_RcvDat();
3570  010e 7b03          	ld	a,(OFST+1,sp)
3571  0110 97            	ld	xl,a
3572  0111 7b04          	ld	a,(OFST+2,sp)
3573  0113 1b02          	add	a,(OFST+0,sp)
3574  0115 2401          	jrnc	L03
3575  0117 5c            	incw	x
3576  0118               L03:
3577  0118 02            	rlwa	x,a
3578  0119 89            	pushw	x
3579  011a ad8a          	call	_I2C_RcvDat
3581  011c 85            	popw	x
3582  011d f7            	ld	(x),a
3583                     ; 80 	I2C_stop();
3585  011e 72125211      	bset	_I2C_CR2,#1
3586                     ; 81 	I2C_Ack();
3589  0122 72145211      	bset	_I2C_CR2,#2
3590                     ; 83 	buf[0]=buf[0]&0x7f;		//get second data
3593  0126 1e03          	ldw	x,(OFST+1,sp)
3594  0128 f6            	ld	a,(x)
3595  0129 a47f          	and	a,#127
3596  012b f7            	ld	(x),a
3597                     ; 84 	buf[1]=buf[1]&0x7f;		//get minute data
3599  012c 1e03          	ldw	x,(OFST+1,sp)
3600  012e e601          	ld	a,(1,x)
3601  0130 a47f          	and	a,#127
3602  0132 e701          	ld	(1,x),a
3603                     ; 85 	buf[2]=buf[2]&0x3f;		//get hour data
3605  0134 1e03          	ldw	x,(OFST+1,sp)
3606  0136 e602          	ld	a,(2,x)
3607  0138 a43f          	and	a,#63
3608  013a e702          	ld	(2,x),a
3609                     ; 87 	buf[0]=changeHexToInt(buf[0]);
3611  013c 1e03          	ldw	x,(OFST+1,sp)
3612  013e f6            	ld	a,(x)
3613  013f a40f          	and	a,#15
3614  0141 6b01          	ld	(OFST-1,sp),a
3615  0143 1e03          	ldw	x,(OFST+1,sp)
3616  0145 f6            	ld	a,(x)
3617  0146 4e            	swap	a
3618  0147 a40f          	and	a,#15
3619  0149 97            	ld	xl,a
3620  014a a60a          	ld	a,#10
3621  014c 42            	mul	x,a
3622  014d 9f            	ld	a,xl
3623  014e 1b01          	add	a,(OFST-1,sp)
3624  0150 1e03          	ldw	x,(OFST+1,sp)
3625  0152 f7            	ld	(x),a
3626                     ; 88 	buf[1]=changeHexToInt(buf[1]);
3628  0153 1e03          	ldw	x,(OFST+1,sp)
3629  0155 e601          	ld	a,(1,x)
3630  0157 a40f          	and	a,#15
3631  0159 6b01          	ld	(OFST-1,sp),a
3632  015b 1e03          	ldw	x,(OFST+1,sp)
3633  015d e601          	ld	a,(1,x)
3634  015f 4e            	swap	a
3635  0160 a40f          	and	a,#15
3636  0162 97            	ld	xl,a
3637  0163 a60a          	ld	a,#10
3638  0165 42            	mul	x,a
3639  0166 9f            	ld	a,xl
3640  0167 1b01          	add	a,(OFST-1,sp)
3641  0169 1e03          	ldw	x,(OFST+1,sp)
3642  016b e701          	ld	(1,x),a
3643                     ; 89 	buf[2]=changeHexToInt(buf[2]);
3645  016d 1e03          	ldw	x,(OFST+1,sp)
3646  016f e602          	ld	a,(2,x)
3647  0171 a40f          	and	a,#15
3648  0173 6b01          	ld	(OFST-1,sp),a
3649  0175 1e03          	ldw	x,(OFST+1,sp)
3650  0177 e602          	ld	a,(2,x)
3651  0179 4e            	swap	a
3652  017a a40f          	and	a,#15
3653  017c 97            	ld	xl,a
3654  017d a60a          	ld	a,#10
3655  017f 42            	mul	x,a
3656  0180 9f            	ld	a,xl
3657  0181 1b01          	add	a,(OFST-1,sp)
3658  0183 1e03          	ldw	x,(OFST+1,sp)
3659  0185 e702          	ld	(2,x),a
3660                     ; 90 }
3663  0187 5b04          	addw	sp,#4
3664  0189 81            	ret
3717                     ; 92 void PCF8563_setTime(u8 hour,u8 minute,u8 second)
3717                     ; 93 {
3718                     	switch	.text
3719  018a               _PCF8563_setTime:
3721  018a 89            	pushw	x
3722  018b 89            	pushw	x
3723       00000002      OFST:	set	2
3726                     ; 94 	hour=changeIntToHex(hour);		//将数据的Dex格式转换为Hex格式
3728  018c 7b03          	ld	a,(OFST+1,sp)
3729  018e 5f            	clrw	x
3730  018f 97            	ld	xl,a
3731  0190 a60a          	ld	a,#10
3732  0192 cd0000        	call	c_smodx
3734  0195 1f01          	ldw	(OFST-1,sp),x
3735  0197 7b03          	ld	a,(OFST+1,sp)
3736  0199 5f            	clrw	x
3737  019a 97            	ld	xl,a
3738  019b a60a          	ld	a,#10
3739  019d cd0000        	call	c_sdivx
3741  01a0 58            	sllw	x
3742  01a1 58            	sllw	x
3743  01a2 58            	sllw	x
3744  01a3 58            	sllw	x
3745  01a4 72fb01        	addw	x,(OFST-1,sp)
3746  01a7 01            	rrwa	x,a
3747  01a8 6b03          	ld	(OFST+1,sp),a
3748  01aa 02            	rlwa	x,a
3749                     ; 95 	minute=changeIntToHex(minute);
3751  01ab 7b04          	ld	a,(OFST+2,sp)
3752  01ad 5f            	clrw	x
3753  01ae 97            	ld	xl,a
3754  01af a60a          	ld	a,#10
3755  01b1 cd0000        	call	c_smodx
3757  01b4 1f01          	ldw	(OFST-1,sp),x
3758  01b6 7b04          	ld	a,(OFST+2,sp)
3759  01b8 5f            	clrw	x
3760  01b9 97            	ld	xl,a
3761  01ba a60a          	ld	a,#10
3762  01bc cd0000        	call	c_sdivx
3764  01bf 58            	sllw	x
3765  01c0 58            	sllw	x
3766  01c1 58            	sllw	x
3767  01c2 58            	sllw	x
3768  01c3 72fb01        	addw	x,(OFST-1,sp)
3769  01c6 01            	rrwa	x,a
3770  01c7 6b04          	ld	(OFST+2,sp),a
3771  01c9 02            	rlwa	x,a
3772                     ; 96 	second=changeIntToHex(second);
3774  01ca 7b07          	ld	a,(OFST+5,sp)
3775  01cc 5f            	clrw	x
3776  01cd 97            	ld	xl,a
3777  01ce a60a          	ld	a,#10
3778  01d0 cd0000        	call	c_smodx
3780  01d3 1f01          	ldw	(OFST-1,sp),x
3781  01d5 7b07          	ld	a,(OFST+5,sp)
3782  01d7 5f            	clrw	x
3783  01d8 97            	ld	xl,a
3784  01d9 a60a          	ld	a,#10
3785  01db cd0000        	call	c_sdivx
3787  01de 58            	sllw	x
3788  01df 58            	sllw	x
3789  01e0 58            	sllw	x
3790  01e1 58            	sllw	x
3791  01e2 72fb01        	addw	x,(OFST-1,sp)
3792  01e5 01            	rrwa	x,a
3793  01e6 6b07          	ld	(OFST+5,sp),a
3794  01e8 02            	rlwa	x,a
3795                     ; 98 	WriteAByte(HOUR_DATA_BUF,hour);
3797  01e9 7b03          	ld	a,(OFST+1,sp)
3798  01eb 97            	ld	xl,a
3799  01ec a604          	ld	a,#4
3800  01ee 95            	ld	xh,a
3801  01ef cd00c8        	call	_WriteAByte
3803                     ; 99 	WriteAByte(MINUTE_DATA_BUF,minute);
3805  01f2 7b04          	ld	a,(OFST+2,sp)
3806  01f4 97            	ld	xl,a
3807  01f5 a603          	ld	a,#3
3808  01f7 95            	ld	xh,a
3809  01f8 cd00c8        	call	_WriteAByte
3811                     ; 100 	WriteAByte(SECOND_DATA_BUF,second);
3813  01fb 7b07          	ld	a,(OFST+5,sp)
3814  01fd 97            	ld	xl,a
3815  01fe a602          	ld	a,#2
3816  0200 95            	ld	xh,a
3817  0201 cd00c8        	call	_WriteAByte
3819                     ; 101 }
3822  0204 5b04          	addw	sp,#4
3823  0206 81            	ret
3878                     ; 103 void PCF8563_init(u8 hour,u8 mintue,u8 second)
3878                     ; 104 {
3879                     	switch	.text
3880  0207               _PCF8563_init:
3882  0207 89            	pushw	x
3883       00000000      OFST:	set	0
3886                     ; 105 	I2C_Init();
3888  0208 cd004c        	call	_I2C_Init
3890                     ; 106 	WriteAByte(CTRL_BUF1,0x00);			//basic setting
3892  020b 5f            	clrw	x
3893  020c cd00c8        	call	_WriteAByte
3895                     ; 107 	WriteAByte(CTRL_BUF2,0x00);
3897  020f ae0100        	ldw	x,#256
3898  0212 cd00c8        	call	_WriteAByte
3900                     ; 108 	PCF8563_setTime(hour,mintue,second);
3902  0215 7b05          	ld	a,(OFST+5,sp)
3903  0217 88            	push	a
3904  0218 7b03          	ld	a,(OFST+3,sp)
3905  021a 97            	ld	xl,a
3906  021b 7b02          	ld	a,(OFST+2,sp)
3907  021d 95            	ld	xh,a
3908  021e cd018a        	call	_PCF8563_setTime
3910  0221 84            	pop	a
3911                     ; 112 }
3914  0222 85            	popw	x
3915  0223 81            	ret
3957                     ; 17 void SPI_Init(void)
3957                     ; 18 {
3958                     	switch	.text
3959  0224               _SPI_Init:
3963                     ; 19 	SPI_CR1|=0x38;   //波特率
3965  0224 c65200        	ld	a,_SPI_CR1
3966  0227 aa38          	or	a,#56
3967  0229 c75200        	ld	_SPI_CR1,a
3968                     ; 24 	SPI_CR2|=0x03;   //配置NSS脚为1
3970  022c c65201        	ld	a,_SPI_CR2
3971  022f aa03          	or	a,#3
3972  0231 c75201        	ld	_SPI_CR2,a
3973                     ; 25 	SPI_CR1|=0x04;   //配置为主设备
3975  0234 72145200      	bset	_SPI_CR1,#2
3976                     ; 26 	SPI_CR1|=0x40;   //开启SPI
3978  0238 721c5200      	bset	_SPI_CR1,#6
3979                     ; 27 }
3982  023c 81            	ret
4018                     ; 29 void SPI_sendchar(u8 data)
4018                     ; 30 {	
4019                     	switch	.text
4020  023d               _SPI_sendchar:
4024                     ; 31 	SPI_DR=data;
4026  023d c75204        	ld	_SPI_DR,a
4028  0240               L1052:
4029                     ; 32 	while(!(SPI_SR & 0x02));
4031  0240 c65203        	ld	a,_SPI_SR
4032  0243 a502          	bcp	a,#2
4033  0245 27f9          	jreq	L1052
4034                     ; 33 }
4037  0247 81            	ret
4073                     ; 35 u8 SPI_rechar(void)
4073                     ; 36 {	
4074                     	switch	.text
4075  0248               _SPI_rechar:
4077  0248 88            	push	a
4078       00000001      OFST:	set	1
4081                     ; 38 	data=SPI_DR;
4083  0249 c65204        	ld	a,_SPI_DR
4084  024c 6b01          	ld	(OFST+0,sp),a
4086  024e               L7252:
4087                     ; 39 	while(!(SPI_SR & 0x01));
4089  024e c65203        	ld	a,_SPI_SR
4090  0251 a501          	bcp	a,#1
4091  0253 27f9          	jreq	L7252
4092                     ; 40 	return data;
4094  0255 7b01          	ld	a,(OFST+0,sp)
4097  0257 5b01          	addw	sp,#1
4098  0259 81            	ret
4157                     ; 21 void st7920LcdInit(void)
4157                     ; 22 {
4158                     	switch	.text
4159  025a               _st7920LcdInit:
4161  025a 88            	push	a
4162       00000001      OFST:	set	1
4165                     ; 24 	SPI_Init();
4167  025b adc7          	call	_SPI_Init
4169                     ; 25 	delay_ms(100);
4171  025d ae0064        	ldw	x,#100
4172  0260 cd0000        	call	_delay_ms
4174                     ; 26 	PE_DDR|=0x20;
4176  0263 721a5016      	bset	_PE_DDR,#5
4177                     ; 27 	PE_CR1|=0x20;
4179  0267 721a5017      	bset	_PE_CR1,#5
4180                     ; 28 	PE_CR2|=0x20;
4182  026b 721a5018      	bset	_PE_CR2,#5
4183                     ; 29 	sendCodeST7920(0x0c);//整体显示
4185  026f a60c          	ld	a,#12
4186  0271 ad1c          	call	_sendCodeST7920
4188                     ; 30 	sendCodeST7920(0x01);//清屏
4190  0273 a601          	ld	a,#1
4191  0275 ad18          	call	_sendCodeST7920
4193                     ; 31 	sendCodeST7920(0x02);
4195  0277 a602          	ld	a,#2
4196  0279 ad14          	call	_sendCodeST7920
4198                     ; 32 	for(i=0;i<64;i++)
4200  027b 0f01          	clr	(OFST+0,sp)
4201  027d               L7552:
4202                     ; 33 		lcd_buffer[i]=' ';
4204  027d 7b01          	ld	a,(OFST+0,sp)
4205  027f 5f            	clrw	x
4206  0280 97            	ld	xl,a
4207  0281 a620          	ld	a,#32
4208  0283 e700          	ld	(_lcd_buffer,x),a
4209                     ; 32 	for(i=0;i<64;i++)
4211  0285 0c01          	inc	(OFST+0,sp)
4214  0287 7b01          	ld	a,(OFST+0,sp)
4215  0289 a140          	cp	a,#64
4216  028b 25f0          	jrult	L7552
4217                     ; 35 }
4220  028d 84            	pop	a
4221  028e 81            	ret
4258                     ; 37 void sendCodeST7920(u8 Lcd_cmd)
4258                     ; 38 {
4259                     	switch	.text
4260  028f               _sendCodeST7920:
4262  028f 88            	push	a
4263       00000000      OFST:	set	0
4266                     ; 39 	E_CLK
4268  0290 721b5014      	bres	_PE_ODR,#5
4269                     ; 40 	LCD_DELAY()
4272  0294 9d            nop
4277  0295 9d            nop
4282  0296 9d            nop
4287  0297 9d            nop
4292  0298 9d            nop
4294                     ; 41 	E_SET
4296  0299 721a5014      	bset	_PE_ODR,#5
4297                     ; 42 	SPI_sendchar(0xF8);
4299  029d a6f8          	ld	a,#248
4300  029f ad9c          	call	_SPI_sendchar
4302                     ; 43 	SPI_sendchar(Lcd_cmd & 0xF0);
4304  02a1 7b01          	ld	a,(OFST+1,sp)
4305  02a3 a4f0          	and	a,#240
4306  02a5 ad96          	call	_SPI_sendchar
4308                     ; 44 	SPI_sendchar(Lcd_cmd << 4);
4310  02a7 7b01          	ld	a,(OFST+1,sp)
4311  02a9 97            	ld	xl,a
4312  02aa a610          	ld	a,#16
4313  02ac 42            	mul	x,a
4314  02ad 9f            	ld	a,xl
4315  02ae ad8d          	call	_SPI_sendchar
4317                     ; 45 	LCD_DELAY()
4320  02b0 9d            nop
4325  02b1 9d            nop
4330  02b2 9d            nop
4335  02b3 9d            nop
4340  02b4 9d            nop
4342                     ; 46 	E_CLK
4344  02b5 721b5014      	bres	_PE_ODR,#5
4345                     ; 47 	LCD_DELAY()
4348  02b9 9d            nop
4353  02ba 9d            nop
4358  02bb 9d            nop
4363  02bc 9d            nop
4368  02bd 9d            nop
4370                     ; 48 }
4373  02be 84            	pop	a
4374  02bf 81            	ret
4411                     ; 50 void sendDataST7920(u8 Lcd_data)
4411                     ; 51 {
4412                     	switch	.text
4413  02c0               _sendDataST7920:
4415  02c0 88            	push	a
4416       00000000      OFST:	set	0
4419                     ; 52 	E_CLK
4421  02c1 721b5014      	bres	_PE_ODR,#5
4422                     ; 53 	LCD_DELAY()
4425  02c5 9d            nop
4430  02c6 9d            nop
4435  02c7 9d            nop
4440  02c8 9d            nop
4445  02c9 9d            nop
4447                     ; 54 	E_SET
4449  02ca 721a5014      	bset	_PE_ODR,#5
4450                     ; 55 	SPI_sendchar(0xFA);
4452  02ce a6fa          	ld	a,#250
4453  02d0 cd023d        	call	_SPI_sendchar
4455                     ; 56 	SPI_sendchar(Lcd_data & 0xF0);
4457  02d3 7b01          	ld	a,(OFST+1,sp)
4458  02d5 a4f0          	and	a,#240
4459  02d7 cd023d        	call	_SPI_sendchar
4461                     ; 57 	SPI_sendchar(Lcd_data << 4);
4463  02da 7b01          	ld	a,(OFST+1,sp)
4464  02dc 97            	ld	xl,a
4465  02dd a610          	ld	a,#16
4466  02df 42            	mul	x,a
4467  02e0 9f            	ld	a,xl
4468  02e1 cd023d        	call	_SPI_sendchar
4470                     ; 58 	LCD_DELAY()
4473  02e4 9d            nop
4478  02e5 9d            nop
4483  02e6 9d            nop
4488  02e7 9d            nop
4493  02e8 9d            nop
4495                     ; 59 	E_CLK
4497  02e9 721b5014      	bres	_PE_ODR,#5
4498                     ; 60 	LCD_DELAY()
4501  02ed 9d            nop
4506  02ee 9d            nop
4511  02ef 9d            nop
4516  02f0 9d            nop
4521  02f1 9d            nop
4523                     ; 61 }
4526  02f2 84            	pop	a
4527  02f3 81            	ret
4573                     ; 63 void refreshLCD(const u8 *lcd_stack)
4573                     ; 64 {
4574                     	switch	.text
4575  02f4               _refreshLCD:
4577  02f4 89            	pushw	x
4578  02f5 88            	push	a
4579       00000001      OFST:	set	1
4582                     ; 66 	sendCodeST7920(0x02);	//地址归位
4584  02f6 a602          	ld	a,#2
4585  02f8 ad95          	call	_sendCodeST7920
4587                     ; 67 	for(addr=0;addr<16;addr++)
4589  02fa 0f01          	clr	(OFST+0,sp)
4590  02fc               L3462:
4591                     ; 69 		sendDataST7920(*(lcd_stack + addr));
4593  02fc 7b02          	ld	a,(OFST+1,sp)
4594  02fe 97            	ld	xl,a
4595  02ff 7b03          	ld	a,(OFST+2,sp)
4596  0301 1b01          	add	a,(OFST+0,sp)
4597  0303 2401          	jrnc	L45
4598  0305 5c            	incw	x
4599  0306               L45:
4600  0306 02            	rlwa	x,a
4601  0307 f6            	ld	a,(x)
4602  0308 adb6          	call	_sendDataST7920
4604                     ; 67 	for(addr=0;addr<16;addr++)
4606  030a 0c01          	inc	(OFST+0,sp)
4609  030c 7b01          	ld	a,(OFST+0,sp)
4610  030e a110          	cp	a,#16
4611  0310 25ea          	jrult	L3462
4612                     ; 71 	for(addr=32;addr<48;addr++)
4614  0312 a620          	ld	a,#32
4615  0314 6b01          	ld	(OFST+0,sp),a
4616  0316               L1562:
4617                     ; 73 		sendDataST7920(*(lcd_stack + addr));
4619  0316 7b02          	ld	a,(OFST+1,sp)
4620  0318 97            	ld	xl,a
4621  0319 7b03          	ld	a,(OFST+2,sp)
4622  031b 1b01          	add	a,(OFST+0,sp)
4623  031d 2401          	jrnc	L65
4624  031f 5c            	incw	x
4625  0320               L65:
4626  0320 02            	rlwa	x,a
4627  0321 f6            	ld	a,(x)
4628  0322 ad9c          	call	_sendDataST7920
4630                     ; 71 	for(addr=32;addr<48;addr++)
4632  0324 0c01          	inc	(OFST+0,sp)
4635  0326 7b01          	ld	a,(OFST+0,sp)
4636  0328 a130          	cp	a,#48
4637  032a 25ea          	jrult	L1562
4638                     ; 75 	for(addr=16;addr<32;addr++)
4640  032c a610          	ld	a,#16
4641  032e 6b01          	ld	(OFST+0,sp),a
4642  0330               L7562:
4643                     ; 77 		sendDataST7920(*(lcd_stack + addr));
4645  0330 7b02          	ld	a,(OFST+1,sp)
4646  0332 97            	ld	xl,a
4647  0333 7b03          	ld	a,(OFST+2,sp)
4648  0335 1b01          	add	a,(OFST+0,sp)
4649  0337 2401          	jrnc	L06
4650  0339 5c            	incw	x
4651  033a               L06:
4652  033a 02            	rlwa	x,a
4653  033b f6            	ld	a,(x)
4654  033c ad82          	call	_sendDataST7920
4656                     ; 75 	for(addr=16;addr<32;addr++)
4658  033e 0c01          	inc	(OFST+0,sp)
4661  0340 7b01          	ld	a,(OFST+0,sp)
4662  0342 a120          	cp	a,#32
4663  0344 25ea          	jrult	L7562
4664                     ; 80 	for(addr=48;addr<64;addr++)
4666  0346 a630          	ld	a,#48
4667  0348 6b01          	ld	(OFST+0,sp),a
4668  034a               L5662:
4669                     ; 82 		sendDataST7920(*(lcd_stack + addr));
4671  034a 7b02          	ld	a,(OFST+1,sp)
4672  034c 97            	ld	xl,a
4673  034d 7b03          	ld	a,(OFST+2,sp)
4674  034f 1b01          	add	a,(OFST+0,sp)
4675  0351 2401          	jrnc	L26
4676  0353 5c            	incw	x
4677  0354               L26:
4678  0354 02            	rlwa	x,a
4679  0355 f6            	ld	a,(x)
4680  0356 cd02c0        	call	_sendDataST7920
4682                     ; 80 	for(addr=48;addr<64;addr++)
4684  0359 0c01          	inc	(OFST+0,sp)
4687  035b 7b01          	ld	a,(OFST+0,sp)
4688  035d a140          	cp	a,#64
4689  035f 25e9          	jrult	L5662
4690                     ; 84 }
4693  0361 5b03          	addw	sp,#3
4694  0363 81            	ret
4747                     ; 86 void decToAscii(u8* str,u16 dec,u8 width)
4747                     ; 87 {
4748                     	switch	.text
4749  0364               _decToAscii:
4751  0364 89            	pushw	x
4752       00000000      OFST:	set	0
4755  0365 ac040404      	jpf	L7372
4756  0369               L5372:
4757                     ; 90 		switch(width)
4759  0369 7b07          	ld	a,(OFST+7,sp)
4761                     ; 121 			default: *str = '0';
4762  036b 4a            	dec	a
4763  036c 2603cc03f4    	jreq	L3072
4764  0371 4a            	dec	a
4765  0372 2764          	jreq	L1072
4766  0374 4a            	dec	a
4767  0375 2745          	jreq	L7762
4768  0377 4a            	dec	a
4769  0378 2726          	jreq	L5762
4770  037a 4a            	dec	a
4771  037b 2707          	jreq	L3762
4772  037d               L5072:
4775  037d 1e01          	ldw	x,(OFST+1,sp)
4776  037f a630          	ld	a,#48
4777  0381 f7            	ld	(x),a
4778  0382 2077          	jra	L5472
4779  0384               L3762:
4780                     ; 94 				*str = (dec / 10000 + '0');
4782  0384 1e05          	ldw	x,(OFST+5,sp)
4783  0386 90ae2710      	ldw	y,#10000
4784  038a 65            	divw	x,y
4785  038b 1c0030        	addw	x,#48
4786  038e 1601          	ldw	y,(OFST+1,sp)
4787  0390 01            	rrwa	x,a
4788  0391 90f7          	ld	(y),a
4789  0393 02            	rlwa	x,a
4790                     ; 95 				dec %= 10000;
4792  0394 1e05          	ldw	x,(OFST+5,sp)
4793  0396 90ae2710      	ldw	y,#10000
4794  039a 65            	divw	x,y
4795  039b 51            	exgw	x,y
4796  039c 1f05          	ldw	(OFST+5,sp),x
4797                     ; 96 				break;
4799  039e 205b          	jra	L5472
4800  03a0               L5762:
4801                     ; 100 				*str = (dec / 1000 + '0');
4803  03a0 1e05          	ldw	x,(OFST+5,sp)
4804  03a2 90ae03e8      	ldw	y,#1000
4805  03a6 65            	divw	x,y
4806  03a7 1c0030        	addw	x,#48
4807  03aa 1601          	ldw	y,(OFST+1,sp)
4808  03ac 01            	rrwa	x,a
4809  03ad 90f7          	ld	(y),a
4810  03af 02            	rlwa	x,a
4811                     ; 101 				dec %= 1000;
4813  03b0 1e05          	ldw	x,(OFST+5,sp)
4814  03b2 90ae03e8      	ldw	y,#1000
4815  03b6 65            	divw	x,y
4816  03b7 51            	exgw	x,y
4817  03b8 1f05          	ldw	(OFST+5,sp),x
4818                     ; 102 				break;
4820  03ba 203f          	jra	L5472
4821  03bc               L7762:
4822                     ; 106 				*str = (dec/100+'0');
4824  03bc 1e05          	ldw	x,(OFST+5,sp)
4825  03be 90ae0064      	ldw	y,#100
4826  03c2 65            	divw	x,y
4827  03c3 1c0030        	addw	x,#48
4828  03c6 1601          	ldw	y,(OFST+1,sp)
4829  03c8 01            	rrwa	x,a
4830  03c9 90f7          	ld	(y),a
4831  03cb 02            	rlwa	x,a
4832                     ; 107 				dec %= 100;
4834  03cc 1e05          	ldw	x,(OFST+5,sp)
4835  03ce 90ae0064      	ldw	y,#100
4836  03d2 65            	divw	x,y
4837  03d3 51            	exgw	x,y
4838  03d4 1f05          	ldw	(OFST+5,sp),x
4839                     ; 108 				break;
4841  03d6 2023          	jra	L5472
4842  03d8               L1072:
4843                     ; 112 				*str = (dec/10+'0');
4845  03d8 1e05          	ldw	x,(OFST+5,sp)
4846  03da 90ae000a      	ldw	y,#10
4847  03de 65            	divw	x,y
4848  03df 1c0030        	addw	x,#48
4849  03e2 1601          	ldw	y,(OFST+1,sp)
4850  03e4 01            	rrwa	x,a
4851  03e5 90f7          	ld	(y),a
4852  03e7 02            	rlwa	x,a
4853                     ; 113 				dec %= 10;
4855  03e8 1e05          	ldw	x,(OFST+5,sp)
4856  03ea 90ae000a      	ldw	y,#10
4857  03ee 65            	divw	x,y
4858  03ef 51            	exgw	x,y
4859  03f0 1f05          	ldw	(OFST+5,sp),x
4860                     ; 114 				break;
4862  03f2 2007          	jra	L5472
4863  03f4               L3072:
4864                     ; 118 				*str = (dec+'0');
4866  03f4 7b06          	ld	a,(OFST+6,sp)
4867  03f6 ab30          	add	a,#48
4868  03f8 1e01          	ldw	x,(OFST+1,sp)
4869  03fa f7            	ld	(x),a
4870                     ; 119 				break;
4872  03fb               L5472:
4873                     ; 123 		width--;
4875  03fb 0a07          	dec	(OFST+7,sp)
4876                     ; 124 		str++;
4878  03fd 1e01          	ldw	x,(OFST+1,sp)
4879  03ff 1c0001        	addw	x,#1
4880  0402 1f01          	ldw	(OFST+1,sp),x
4881  0404               L7372:
4882                     ; 88 	while(width)
4884  0404 0d07          	tnz	(OFST+7,sp)
4885  0406 2703          	jreq	L07
4886  0408 cc0369        	jp	L5372
4887  040b               L07:
4888                     ; 126 }
4891  040b 85            	popw	x
4892  040c 81            	ret
4954                     ; 128 void hexToAscii(u8* str,u16 hex,u8 width)
4954                     ; 129 {
4955                     	switch	.text
4956  040d               _hexToAscii:
4958  040d 89            	pushw	x
4959  040e 89            	pushw	x
4960       00000002      OFST:	set	2
4963  040f acc904c9      	jpf	L5103
4964  0413               L3103:
4965                     ; 133 		switch(width)
4967  0413 7b09          	ld	a,(OFST+7,sp)
4969                     ; 163 			default: *str = '0';
4970  0415 4a            	dec	a
4971  0416 2603          	jrne	L67
4972  0418 cc049d        	jp	L5572
4973  041b               L67:
4974  041b 4a            	dec	a
4975  041c 2758          	jreq	L3572
4976  041e 4a            	dec	a
4977  041f 2730          	jreq	L1572
4978  0421 4a            	dec	a
4979  0422 2709          	jreq	L7472
4980  0424               L7572:
4983  0424 1e03          	ldw	x,(OFST+1,sp)
4984  0426 a630          	ld	a,#48
4985  0428 f7            	ld	(x),a
4986  0429 acc004c0      	jpf	L3203
4987  042d               L7472:
4988                     ; 137 				tmp = (hex >> 12);
4990  042d 1e07          	ldw	x,(OFST+5,sp)
4991  042f 01            	rrwa	x,a
4992  0430 4f            	clr	a
4993  0431 41            	exg	a,xl
4994  0432 4e            	swap	a
4995  0433 a40f          	and	a,#15
4996  0435 02            	rlwa	x,a
4997  0436 1f01          	ldw	(OFST-1,sp),x
4998                     ; 138 				if(tmp > 9) *str = tmp + ('A' - 10);
5000  0438 1e01          	ldw	x,(OFST-1,sp)
5001  043a a3000a        	cpw	x,#10
5002  043d 2509          	jrult	L5203
5005  043f 7b02          	ld	a,(OFST+0,sp)
5006  0441 ab37          	add	a,#55
5007  0443 1e03          	ldw	x,(OFST+1,sp)
5008  0445 f7            	ld	(x),a
5010  0446 2078          	jra	L3203
5011  0448               L5203:
5012                     ; 139 				else *str = tmp + '0';
5014  0448 7b02          	ld	a,(OFST+0,sp)
5015  044a ab30          	add	a,#48
5016  044c 1e03          	ldw	x,(OFST+1,sp)
5017  044e f7            	ld	(x),a
5018  044f 206f          	jra	L3203
5019  0451               L1572:
5020                     ; 144 				tmp = (hex >> 8) & 0x000F;
5022  0451 1e07          	ldw	x,(OFST+5,sp)
5023  0453 4f            	clr	a
5024  0454 01            	rrwa	x,a
5025  0455 01            	rrwa	x,a
5026  0456 a40f          	and	a,#15
5027  0458 5f            	clrw	x
5028  0459 02            	rlwa	x,a
5029  045a 1f01          	ldw	(OFST-1,sp),x
5030  045c 01            	rrwa	x,a
5031                     ; 145 				if(tmp > 9) *str = tmp + ('A' - 10);
5033  045d 1e01          	ldw	x,(OFST-1,sp)
5034  045f a3000a        	cpw	x,#10
5035  0462 2509          	jrult	L1303
5038  0464 7b02          	ld	a,(OFST+0,sp)
5039  0466 ab37          	add	a,#55
5040  0468 1e03          	ldw	x,(OFST+1,sp)
5041  046a f7            	ld	(x),a
5043  046b 2053          	jra	L3203
5044  046d               L1303:
5045                     ; 146 				else *str = tmp + '0';
5047  046d 7b02          	ld	a,(OFST+0,sp)
5048  046f ab30          	add	a,#48
5049  0471 1e03          	ldw	x,(OFST+1,sp)
5050  0473 f7            	ld	(x),a
5051  0474 204a          	jra	L3203
5052  0476               L3572:
5053                     ; 151 				tmp = (hex >> 4) & 0x000F;
5055  0476 1e07          	ldw	x,(OFST+5,sp)
5056  0478 54            	srlw	x
5057  0479 54            	srlw	x
5058  047a 54            	srlw	x
5059  047b 54            	srlw	x
5060  047c 01            	rrwa	x,a
5061  047d a40f          	and	a,#15
5062  047f 5f            	clrw	x
5063  0480 5f            	clrw	x
5064  0481 97            	ld	xl,a
5065  0482 1f01          	ldw	(OFST-1,sp),x
5066                     ; 152 				if(tmp > 9) *str = tmp + ('A' - 10);
5068  0484 1e01          	ldw	x,(OFST-1,sp)
5069  0486 a3000a        	cpw	x,#10
5070  0489 2509          	jrult	L5303
5073  048b 7b02          	ld	a,(OFST+0,sp)
5074  048d ab37          	add	a,#55
5075  048f 1e03          	ldw	x,(OFST+1,sp)
5076  0491 f7            	ld	(x),a
5078  0492 202c          	jra	L3203
5079  0494               L5303:
5080                     ; 153 				else *str = tmp + '0';
5082  0494 7b02          	ld	a,(OFST+0,sp)
5083  0496 ab30          	add	a,#48
5084  0498 1e03          	ldw	x,(OFST+1,sp)
5085  049a f7            	ld	(x),a
5086  049b 2023          	jra	L3203
5087  049d               L5572:
5088                     ; 158 				tmp = hex & 0x000F;
5090  049d 7b07          	ld	a,(OFST+5,sp)
5091  049f 97            	ld	xl,a
5092  04a0 7b08          	ld	a,(OFST+6,sp)
5093  04a2 a40f          	and	a,#15
5094  04a4 5f            	clrw	x
5095  04a5 02            	rlwa	x,a
5096  04a6 1f01          	ldw	(OFST-1,sp),x
5097  04a8 01            	rrwa	x,a
5098                     ; 159 				if(tmp > 9) *str = tmp + ('A' - 10);
5100  04a9 1e01          	ldw	x,(OFST-1,sp)
5101  04ab a3000a        	cpw	x,#10
5102  04ae 2509          	jrult	L1403
5105  04b0 7b02          	ld	a,(OFST+0,sp)
5106  04b2 ab37          	add	a,#55
5107  04b4 1e03          	ldw	x,(OFST+1,sp)
5108  04b6 f7            	ld	(x),a
5110  04b7 2007          	jra	L3203
5111  04b9               L1403:
5112                     ; 160 				else *str = tmp + '0';
5114  04b9 7b02          	ld	a,(OFST+0,sp)
5115  04bb ab30          	add	a,#48
5116  04bd 1e03          	ldw	x,(OFST+1,sp)
5117  04bf f7            	ld	(x),a
5118  04c0               L3203:
5119                     ; 165 		width--;
5121  04c0 0a09          	dec	(OFST+7,sp)
5122                     ; 166 		str++;
5124  04c2 1e03          	ldw	x,(OFST+1,sp)
5125  04c4 1c0001        	addw	x,#1
5126  04c7 1f03          	ldw	(OFST+1,sp),x
5127  04c9               L5103:
5128                     ; 131 	while(width)
5130  04c9 0d09          	tnz	(OFST+7,sp)
5131  04cb 2703          	jreq	L001
5132  04cd cc0413        	jp	L3103
5133  04d0               L001:
5134                     ; 168 }
5137  04d0 5b04          	addw	sp,#4
5138  04d2 81            	ret
5231                     ; 170 void showLine(const u8 x,const u8 y,u8* lcd_stack,char * str,...)
5231                     ; 171 {
5232                     	switch	.text
5233  04d3               _showLine:
5235  04d3 89            	pushw	x
5236  04d4 5204          	subw	sp,#4
5237       00000004      OFST:	set	4
5240                     ; 172 	u8 coordinate = 16 * y + x;
5242  04d6 9f            	ld	a,xl
5243  04d7 97            	ld	xl,a
5244  04d8 a610          	ld	a,#16
5245  04da 42            	mul	x,a
5246  04db 9f            	ld	a,xl
5247  04dc 1b05          	add	a,(OFST+1,sp)
5248  04de 6b04          	ld	(OFST+0,sp),a
5249                     ; 175 	va_start(marker,str); // Initialize variable arguments.  
5251  04e0 96            	ldw	x,sp
5252  04e1 1c000d        	addw	x,#OFST+9
5253  04e4 1f02          	ldw	(OFST-2,sp),x
5254                     ; 176 	for(i=0;i<64;i++)
5256  04e6 0f01          	clr	(OFST-3,sp)
5257  04e8               L3113:
5260  04e8 0c01          	inc	(OFST-3,sp)
5263  04ea 7b01          	ld	a,(OFST-3,sp)
5264  04ec a140          	cp	a,#64
5265  04ee 25f8          	jrult	L3113
5267  04f0 acfe05fe      	jpf	L3213
5268  04f4               L1213:
5269                     ; 182 		if(coordinate > 64) break;	//防止堆栈溢出
5271  04f4 7b04          	ld	a,(OFST+0,sp)
5272  04f6 a141          	cp	a,#65
5273  04f8 2503          	jrult	L7213
5275  04fa               L5213:
5276                     ; 217 	va_end( marker ); // Reset variable arguments. 
5278                     ; 218 } 
5281  04fa 5b06          	addw	sp,#6
5282  04fc 81            	ret
5283  04fd               L7213:
5284                     ; 184 		if(*str == '\\')
5286  04fd 1e0b          	ldw	x,(OFST+7,sp)
5287  04ff f6            	ld	a,(x)
5288  0500 a15c          	cp	a,#92
5289  0502 261b          	jrne	L1313
5290                     ; 186 			str++;
5292  0504 1e0b          	ldw	x,(OFST+7,sp)
5293  0506 1c0001        	addw	x,#1
5294  0509 1f0b          	ldw	(OFST+7,sp),x
5295                     ; 187 			lcd_stack[coordinate] = *str;
5297  050b 7b09          	ld	a,(OFST+5,sp)
5298  050d 97            	ld	xl,a
5299  050e 7b0a          	ld	a,(OFST+6,sp)
5300  0510 1b04          	add	a,(OFST+0,sp)
5301  0512 2401          	jrnc	L401
5302  0514 5c            	incw	x
5303  0515               L401:
5304  0515 02            	rlwa	x,a
5305  0516 160b          	ldw	y,(OFST+7,sp)
5306  0518 90f6          	ld	a,(y)
5307  051a f7            	ld	(x),a
5309  051b acf505f5      	jpf	L3313
5310  051f               L1313:
5311                     ; 189 		else if(*str == '%')
5313  051f 1e0b          	ldw	x,(OFST+7,sp)
5314  0521 f6            	ld	a,(x)
5315  0522 a125          	cp	a,#37
5316  0524 2703          	jreq	L611
5317  0526 cc05e5        	jp	L5313
5318  0529               L611:
5319                     ; 191 			str++;
5321  0529 1e0b          	ldw	x,(OFST+7,sp)
5322  052b 1c0001        	addw	x,#1
5323  052e 1f0b          	ldw	(OFST+7,sp),x
5324                     ; 192 			if (*str == 'd' || *str == 'D')
5326  0530 1e0b          	ldw	x,(OFST+7,sp)
5327  0532 f6            	ld	a,(x)
5328  0533 a164          	cp	a,#100
5329  0535 2707          	jreq	L1413
5331  0537 1e0b          	ldw	x,(OFST+7,sp)
5332  0539 f6            	ld	a,(x)
5333  053a a144          	cp	a,#68
5334  053c 2637          	jrne	L7313
5335  053e               L1413:
5336                     ; 194 				str++;
5338  053e 1e0b          	ldw	x,(OFST+7,sp)
5339  0540 1c0001        	addw	x,#1
5340  0543 1f0b          	ldw	(OFST+7,sp),x
5341                     ; 195 				decToAscii(&lcd_stack[coordinate],va_arg(marker,u16),(*str-'0'));
5343  0545 1e0b          	ldw	x,(OFST+7,sp)
5344  0547 f6            	ld	a,(x)
5345  0548 a030          	sub	a,#48
5346  054a 88            	push	a
5347  054b 1e03          	ldw	x,(OFST-1,sp)
5348  054d 1c0002        	addw	x,#2
5349  0550 1f03          	ldw	(OFST-1,sp),x
5350  0552 1e03          	ldw	x,(OFST-1,sp)
5351  0554 5a            	decw	x
5352  0555 5a            	decw	x
5353  0556 fe            	ldw	x,(x)
5354  0557 89            	pushw	x
5355  0558 7b0c          	ld	a,(OFST+8,sp)
5356  055a 97            	ld	xl,a
5357  055b 7b0d          	ld	a,(OFST+9,sp)
5358  055d 1b07          	add	a,(OFST+3,sp)
5359  055f 2401          	jrnc	L601
5360  0561 5c            	incw	x
5361  0562               L601:
5362  0562 02            	rlwa	x,a
5363  0563 cd0364        	call	_decToAscii
5365  0566 5b03          	addw	sp,#3
5366                     ; 196 				coordinate += (*str-'0'-1);
5368  0568 1e0b          	ldw	x,(OFST+7,sp)
5369  056a f6            	ld	a,(x)
5370  056b a031          	sub	a,#49
5371  056d 1b04          	add	a,(OFST+0,sp)
5372  056f 6b04          	ld	(OFST+0,sp),a
5374  0571 acf505f5      	jpf	L3313
5375  0575               L7313:
5376                     ; 198 			else if(*str == 'c' || *str == 'C')
5378  0575 1e0b          	ldw	x,(OFST+7,sp)
5379  0577 f6            	ld	a,(x)
5380  0578 a163          	cp	a,#99
5381  057a 2707          	jreq	L7413
5383  057c 1e0b          	ldw	x,(OFST+7,sp)
5384  057e f6            	ld	a,(x)
5385  057f a143          	cp	a,#67
5386  0581 261f          	jrne	L5413
5387  0583               L7413:
5388                     ; 200 				lcd_stack[coordinate] = va_arg(marker,u16);
5390  0583 7b09          	ld	a,(OFST+5,sp)
5391  0585 97            	ld	xl,a
5392  0586 7b0a          	ld	a,(OFST+6,sp)
5393  0588 1b04          	add	a,(OFST+0,sp)
5394  058a 2401          	jrnc	L011
5395  058c 5c            	incw	x
5396  058d               L011:
5397  058d 02            	rlwa	x,a
5398  058e 1602          	ldw	y,(OFST-2,sp)
5399  0590 72a90002      	addw	y,#2
5400  0594 1702          	ldw	(OFST-2,sp),y
5401  0596 1602          	ldw	y,(OFST-2,sp)
5402  0598 905a          	decw	y
5403  059a 905a          	decw	y
5404  059c 90e601        	ld	a,(1,y)
5405  059f f7            	ld	(x),a
5407  05a0 2053          	jra	L3313
5408  05a2               L5413:
5409                     ; 202 			else if(*str == 'x' || *str == 'X')
5411  05a2 1e0b          	ldw	x,(OFST+7,sp)
5412  05a4 f6            	ld	a,(x)
5413  05a5 a178          	cp	a,#120
5414  05a7 2707          	jreq	L5513
5416  05a9 1e0b          	ldw	x,(OFST+7,sp)
5417  05ab f6            	ld	a,(x)
5418  05ac a158          	cp	a,#88
5419  05ae 2645          	jrne	L3313
5420  05b0               L5513:
5421                     ; 204 				str++;
5423  05b0 1e0b          	ldw	x,(OFST+7,sp)
5424  05b2 1c0001        	addw	x,#1
5425  05b5 1f0b          	ldw	(OFST+7,sp),x
5426                     ; 205 				hexToAscii(&lcd_stack[coordinate],va_arg(marker,u16),(*str - '0'));
5428  05b7 1e0b          	ldw	x,(OFST+7,sp)
5429  05b9 f6            	ld	a,(x)
5430  05ba a030          	sub	a,#48
5431  05bc 88            	push	a
5432  05bd 1e03          	ldw	x,(OFST-1,sp)
5433  05bf 1c0002        	addw	x,#2
5434  05c2 1f03          	ldw	(OFST-1,sp),x
5435  05c4 1e03          	ldw	x,(OFST-1,sp)
5436  05c6 5a            	decw	x
5437  05c7 5a            	decw	x
5438  05c8 fe            	ldw	x,(x)
5439  05c9 89            	pushw	x
5440  05ca 7b0c          	ld	a,(OFST+8,sp)
5441  05cc 97            	ld	xl,a
5442  05cd 7b0d          	ld	a,(OFST+9,sp)
5443  05cf 1b07          	add	a,(OFST+3,sp)
5444  05d1 2401          	jrnc	L211
5445  05d3 5c            	incw	x
5446  05d4               L211:
5447  05d4 02            	rlwa	x,a
5448  05d5 cd040d        	call	_hexToAscii
5450  05d8 5b03          	addw	sp,#3
5451                     ; 206 				coordinate += (*str - '0' - 1);
5453  05da 1e0b          	ldw	x,(OFST+7,sp)
5454  05dc f6            	ld	a,(x)
5455  05dd a031          	sub	a,#49
5456  05df 1b04          	add	a,(OFST+0,sp)
5457  05e1 6b04          	ld	(OFST+0,sp),a
5458  05e3 2010          	jra	L3313
5459  05e5               L5313:
5460                     ; 212 			lcd_stack[coordinate] = *str;
5462  05e5 7b09          	ld	a,(OFST+5,sp)
5463  05e7 97            	ld	xl,a
5464  05e8 7b0a          	ld	a,(OFST+6,sp)
5465  05ea 1b04          	add	a,(OFST+0,sp)
5466  05ec 2401          	jrnc	L411
5467  05ee 5c            	incw	x
5468  05ef               L411:
5469  05ef 02            	rlwa	x,a
5470  05f0 160b          	ldw	y,(OFST+7,sp)
5471  05f2 90f6          	ld	a,(y)
5472  05f4 f7            	ld	(x),a
5473  05f5               L3313:
5474                     ; 214 		str++;
5476  05f5 1e0b          	ldw	x,(OFST+7,sp)
5477  05f7 1c0001        	addw	x,#1
5478  05fa 1f0b          	ldw	(OFST+7,sp),x
5479                     ; 215 		coordinate++;
5481  05fc 0c04          	inc	(OFST+0,sp)
5482  05fe               L3213:
5483                     ; 180 	while(*str != '\0')
5485  05fe 1e0b          	ldw	x,(OFST+7,sp)
5486  0600 7d            	tnz	(x)
5487  0601 2703          	jreq	L021
5488  0603 cc04f4        	jp	L1213
5489  0606               L021:
5490  0606 acfa04fa      	jpf	L5213
5586                     ; 22 main()
5586                     ; 23 {
5587                     	switch	.text
5588  060a               _main:
5590  060a 5204          	subw	sp,#4
5591       00000004      OFST:	set	4
5594                     ; 24 	u8 time[3],tmp=0;
5596  060c 0f01          	clr	(OFST-3,sp)
5597                     ; 25 	PCF8563_init(10,54,00);   //初始化PCF8563
5599  060e 4b00          	push	#0
5600  0610 ae0a36        	ldw	x,#2614
5601  0613 cd0207        	call	_PCF8563_init
5603  0616 84            	pop	a
5604                     ; 26 	st7920LcdInit();
5606  0617 cd025a        	call	_st7920LcdInit
5608                     ; 27 	showLine(0,0,lcd_buffer,"PCF8563 Example");
5610  061a ae0024        	ldw	x,#L5223
5611  061d 89            	pushw	x
5612  061e ae0000        	ldw	x,#_lcd_buffer
5613  0621 89            	pushw	x
5614  0622 5f            	clrw	x
5615  0623 cd04d3        	call	_showLine
5617  0626 5b04          	addw	sp,#4
5618                     ; 28 	showLine(0,1,lcd_buffer,"Set Time: OK");
5620  0628 ae0017        	ldw	x,#L7223
5621  062b 89            	pushw	x
5622  062c ae0000        	ldw	x,#_lcd_buffer
5623  062f 89            	pushw	x
5624  0630 ae0001        	ldw	x,#1
5625  0633 cd04d3        	call	_showLine
5627  0636 5b04          	addw	sp,#4
5628                     ; 29 	showLine(0,2,lcd_buffer,"Read Time:");
5630  0638 ae000c        	ldw	x,#L1323
5631  063b 89            	pushw	x
5632  063c ae0000        	ldw	x,#_lcd_buffer
5633  063f 89            	pushw	x
5634  0640 ae0002        	ldw	x,#2
5635  0643 cd04d3        	call	_showLine
5637  0646 5b04          	addw	sp,#4
5638                     ; 30 	refreshLCD(lcd_buffer); //刷新LCD
5640  0648 ae0000        	ldw	x,#_lcd_buffer
5641  064b cd02f4        	call	_refreshLCD
5643  064e               L3323:
5644                     ; 33 		PCF8563_getTime(time);
5646  064e 96            	ldw	x,sp
5647  064f 1c0002        	addw	x,#OFST-2
5648  0652 cd00dd        	call	_PCF8563_getTime
5650                     ; 34 		if(time[0]!=tmp)
5652  0655 7b02          	ld	a,(OFST-2,sp)
5653  0657 1101          	cp	a,(OFST-3,sp)
5654  0659 2725          	jreq	L7323
5655                     ; 36 			showLine(8,3,lcd_buffer,"%d2:%d2:%d2",(u16)time[2],(u16)time[1],(u16)time[0]);
5657  065b 7b02          	ld	a,(OFST-2,sp)
5658  065d 5f            	clrw	x
5659  065e 97            	ld	xl,a
5660  065f 89            	pushw	x
5661  0660 7b05          	ld	a,(OFST+1,sp)
5662  0662 5f            	clrw	x
5663  0663 97            	ld	xl,a
5664  0664 89            	pushw	x
5665  0665 7b08          	ld	a,(OFST+4,sp)
5666  0667 5f            	clrw	x
5667  0668 97            	ld	xl,a
5668  0669 89            	pushw	x
5669  066a ae0000        	ldw	x,#L1423
5670  066d 89            	pushw	x
5671  066e ae0000        	ldw	x,#_lcd_buffer
5672  0671 89            	pushw	x
5673  0672 ae0803        	ldw	x,#2051
5674  0675 cd04d3        	call	_showLine
5676  0678 5b0a          	addw	sp,#10
5677                     ; 37 			refreshLCD(lcd_buffer); /*刷新LCD*/
5679  067a ae0000        	ldw	x,#_lcd_buffer
5680  067d cd02f4        	call	_refreshLCD
5682  0680               L7323:
5683                     ; 39 		tmp=time[0];
5685  0680 7b02          	ld	a,(OFST-2,sp)
5686  0682 6b01          	ld	(OFST-3,sp),a
5688  0684 20c8          	jra	L3323
5701                     	xdef	_main
5702                     	xdef	_SPI_rechar
5703                     	xdef	_SPI_sendchar
5704                     	xdef	_SPI_Init
5705                     	switch	.ubsct
5706  0000               _lcd_buffer:
5707  0000 000000000000  	ds.b	64
5708                     	xdef	_lcd_buffer
5709                     	xdef	_showLine
5710                     	xdef	_hexToAscii
5711                     	xdef	_decToAscii
5712                     	xdef	_refreshLCD
5713                     	xdef	_st7920LcdInit
5714                     	xdef	_sendDataST7920
5715                     	xdef	_sendCodeST7920
5716                     	xdef	_PCF8563_init
5717                     	xdef	_PCF8563_setTime
5718                     	xdef	_PCF8563_getTime
5719                     	xdef	_WriteAByte
5720                     	xdef	_I2C_RcvDat
5721                     	xdef	_I2C_SendDat
5722                     	xdef	_I2C_SendDAdr
5723                     	xdef	_I2C_Start
5724                     	xdef	_I2C_Init
5725                     	xdef	_delay_us
5726                     	xdef	_delay_ms
5727                     .const:	section	.text
5728  0000               L1423:
5729  0000 2564323a2564  	dc.b	"%d2:%d2:%d2",0
5730  000c               L1323:
5731  000c 526561642054  	dc.b	"Read Time:",0
5732  0017               L7223:
5733  0017 536574205469  	dc.b	"Set Time: OK",0
5734  0024               L5223:
5735  0024 504346383536  	dc.b	"PCF8563 Example",0
5736                     	xref.b	c_x
5756                     	xref	c_smodx
5757                     	xref	c_smody
5758                     	xref	c_sdivx
5759                     	end
