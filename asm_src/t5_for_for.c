#include <stdio.h>
main(){
	int i,j,n=0;
	for (i=1;i<5;i++) {
		for (j=i;j<5;j++) {
			n++;
			printf("i=%d, j=%d, n=%d\n",i,j,n);
		}
	}
}

