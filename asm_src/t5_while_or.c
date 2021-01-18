#include<stdio.h>
main(){
	int n=7, m=1;
	while (n<100 || m<100) {
		n=n*2;
		m=m*3;
		printf("n=%d\tm=%d\n",n,m);
	}
	printf("Retornar n=%d\n",n);
}
/*
n=14	m=3
n=28	m=9
n=56	m=27
n=112	m=81
n=224	m=243
Retornar n=224
*/

