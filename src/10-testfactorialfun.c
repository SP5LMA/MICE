#include <stdio.h>
extern unsigned long factorial(unsigned long);

int main(void){
    unsigned long k;
    for (k=0; k<= 22; k++)
        printf("%u! = %lu\n", k, (unsigned long) factorial(k));
    return 0;
}
