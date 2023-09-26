#include <stdio.h>
#include <stdlib.h>
main() {
	int i, n, sum = 0;
	int *a; // Khai bao con tro a
	
	printf("Nhap vao gia tri n: ");
	scanf("%d", &n);
	// Cap phat n*sizeof(int) byte cho a
	a = (int*)malloc(n * sizeof(int));
	
	if(a == NULL) exit(1);
	
	for(i = 0; i < n; i++) {
		printf("\n a[%d] = ", i);
		scanf("%d", (a+i)); // Nhap a[i]
	}
	
	for (i = 0; i < n; i++) {
		sum = sum + *(a+i); // Tinh tong
	}
	
	printf("TBC: %f \n", (float)sum/n);
	free(a); // Giai phong vung nho
}
