#include <stdio.h>
#include <stdlib.h>
main() {
	int m, n, max, i, j, *b;
	
	printf("Nhap vao gia tri m, n: ");
	scanf("%d%d", &m, &n);
	// Cap phat bo nho cho mxn phan tu
	b = (int*)calloc(m * n, sizeof(int));
	
	if(b == NULL)  exit(1);
	
	for(i = 0; i < m; i++)
		for(j = 0; j < n; j++){
			printf("\na[%d, %d]= ", i, j);
			scanf("%d", (b+i*n+j));// Nhap b[i][j]
		}
	max = *b; // *b la gia tri cua b[0][0]
	for(i = 0; i < m; i++)
		for(j = 0; j < n; j++)
			if( *(b+i*n+j) > max)
				max = *(b+i*n+j);
			
	printf("Gia tri lon nhat la: %d\n", max);
	free(b); // Giai phong vung nho
}
