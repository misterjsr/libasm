#include <stdio.h>

main(){
	int n=1, i=0;
	while (n<100 && i<64) {
		n=n*2;
		i++;
		printf("i = %d, n = %d\n", i, n);
	}
}

