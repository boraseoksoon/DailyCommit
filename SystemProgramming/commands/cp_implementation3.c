#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#define MAX 100

struct stat st;

int main(int argc, char* argv[]) {
	int fd1, fd2;
	char buf[MAX];
	int r_size, w_size;

	if(argc != 3) {
		printf("ERROR : Wrong Command !\n");
		exit(1);
	}

	fd1 = open(argv[1], O_RDONLY);
	fd2 = open(argv[2], O_RDWR|O_CREAT|O_EXCL, 0664);

	if(fd1 < 0 || fd2 < 0) {
		printf("ERROR : Can't Open File !\n");
		exit(1);
	}

	r_size = read(fd1, buf, MAX);
	if(r_size < 0) {
		printf("ERROR : Can't Read File !\n");
		exit(1);
	}

	w_size = write(fd2, buf, r_size);
	if(w_size < 0) {
		printf("ERROR : Can't Write File !\n");
		exit(1);
	}

	while(r_size == MAX) {
		r_size = read(fd1, buf, MAX);
		w_size = write(fd2, buf, r_size);
	}

	if(stat(argv[1], &st) == -1) {
		printf("ERROR : %s!\n", argv[1]);
		exit(1);
	}

	chmod(argv[2], st.st_mode);

	return 0;
}
