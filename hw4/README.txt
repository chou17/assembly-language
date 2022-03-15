描述你程式的內容:
(一) hw_test.s
測試陣列大小為10，將array size存在r9,array address存在r10

(二) numsort.s
1. result陣列大小為100,array address(r10)存入r0,result address存入r1 r2為index
將array值複製到result中

2. 進行bubble sort
bsort_next:r3=當前index r4=swap num
bsort_loop: r0=next index,若>=array大小則跳至bsort_check
r2=當前val,r5=next val,比較兩者若前者(r2)大於後者(r5),則交換,且r4=1
bsort_check:若r4>0(表示有swap),則r9=r9-1,再跳回bsort_next

最後將result address存入r10

如何編譯程式:
make

如何執行你的程式:
arm-none-eabi-insight
