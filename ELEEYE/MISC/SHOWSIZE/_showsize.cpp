#include <stdio.h>

int main(int argc, char **argv) {
  FILE *fp;
  if (argc < 3) {
    printf("=== File Size Printing Program ===\n");
    printf("Usage: SHOWSIZE File Format-with-\"%%d\"\n");
    return 0;
  }
  fp = fopen(argv[1], "rb");
  if (fp == NULL) {
    printf("Unable to Open File: %s\n", argv[1]);
    return 0;
  }
  fseek(fp, 0, SEEK_END);
  printf(argv[2], ftell(fp));
  printf("\n");
  fclose(fp);
  return 0;
}