#include <stdio.h>
#include <string.h>

int main(int argc,char* argv[]) {
  if(argc>1) {
    int i,len;
    len=strlen(argv[1]);
    for(i=0;i<len;i++) {
      printf("&#%i;",(int) argv[1][i]);
    }
    printf("\n");
  }
}
