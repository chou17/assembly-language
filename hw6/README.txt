描述你程式的內容:
hw5_test.s
1.put arr size in r0, put arr address into r1(follow APCS),call numsort
2.Trans:將數字陣列轉為string(將原本的數字+48,改為ascii的字元),並且在每個數字後面補上","
3.File:open file & write file, finally close file.

numsort.s
1.put arr size(r0) into r3, put arr address(r1) into r10, call malloc
2.put result address into r1, put result array[0] address into r6, array size into r3, arr val into r4, index into r5,copy the array val into result
3. bubble sort
bsort_next:r5=當前index r6=swap num
bsort_loop: r4=next index,若>=array大小則跳至bsort_check
r5=當前val,r7=next val,比較兩者若前者(r5)大於後者(r7),則交換,且r6=1
bsort_check:若r6>0(表示有swap),則r0=r0-1,再跳回bsort_next
4.最後將result address存入r0

呼叫了那些C function:
open(),write(),close(),malloc()

如何編譯程式:
make

如何執行你的程式:
arm-none-eabi-insight
