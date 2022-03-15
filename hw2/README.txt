描述程式內容
6,7,8 line：r1=10,r2=20,r3=12
9 line:     r0=r1右移1bit（r1*2）
10:         r0=r0+r2*4
11:         r0=r0+r3*8
12:         ans:r0

如何編譯
arm-none-eabi-gcc -g hw2.s -o hw2.exe

執行環境
64-bit, Ubuntu20.04 Linux
arm tool 20.04

如何執行
arm-none-eabi-insight
