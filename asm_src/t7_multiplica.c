#include<stdio.h>
main() {
	printf("%d\n",
		multiplica(2,3) +
		multiplica(5,2));
}

int multiplica(int a, int b) {
	int m=0;
	while(b!=0) {
		m=m+a;
		b--;
	}
	return m;
}

