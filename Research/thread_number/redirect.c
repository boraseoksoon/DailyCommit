#include <stdio.h>

int main(int argc, char **argv)
{
    char buf[1024];
    while(fgets(buf, 1023, stdin) != NULL)
    {
        printf("%s", buf);
    }
}

