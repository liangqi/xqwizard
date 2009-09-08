#include <stdio.h>

#define BUFFER_SIZE 32768

int main(int argc, char **argv) {
  unsigned char ucBuffer[BUFFER_SIZE];
  FILE *fpSrc, *fpDst;
  int nBytesRead;

  if (argc < 3) {
    return 3;
  }
  fpSrc = fopen(argv[1], "rb");
  if (fpSrc == NULL) {
    return 2;
  }
  fpDst = fopen(argv[2], "wb");
  if (fpDst == NULL) {
    fclose(fpSrc);
    return 1;
  }

  while ((nBytesRead = fread(ucBuffer, 1, BUFFER_SIZE, fpSrc)) != 0) {
    fwrite(ucBuffer, 1, nBytesRead, fpDst);
  }
  fclose(fpSrc);
  fclose(fpDst);

  return 0;
}