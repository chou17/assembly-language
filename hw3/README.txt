1.describes the features in your program 
    將a第0 row存入暫存器（r1-r4）,b第0 column存入暫存器（r5-r8）
    將r1*r5存入r10,r2*r6存入r11,r10 r11相加後存入r10;
    將r3*r7存入r11,r10 r11相加後存入r10;
    r4*r8存入r11,r10 r11相加後存入r10,最後將r10值存回c[0][0]
    (接續替換r1-r4,r5-r8中值為a第0 1 row,b第0 1 column中的數,
    使符合陣列相乘之規則),
    最後答案存於c陣列,r1指向c陣列的first element.

2.how to compile 
    make

3.run program
    arm-none-eabi-insight
