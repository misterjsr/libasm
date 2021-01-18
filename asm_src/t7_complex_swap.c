#include<stdio.h>

void swap(int *a, int *b) {
	int esi, edi;
	printf("swap: (@0x%X:%d) (@0x%X:%d)\n", a, *a, b, *b);
	esi = *a;
	edi = *b;
	*b = esi;
	*a = edi;
	printf("swap: (esi:%d) (edi:%d)\n", esi, edi);
	printf("swap: (@0x%X:%d) (@0x%X:%d)\n", a, *a, b, *b);
}

void func(int a) {
	int b = -7;
	printf("func: (%d) (%d)\n", a, b);
	swap(&a, &b);
	printf("func: (%d) (%d)\n", a, b);
}

main(){
	func(7);
}

