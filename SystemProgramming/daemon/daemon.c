#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int main(int argc, char* argv[], char* envp[])
{
    int pid;
    int i;

    i = 1000;
    pid = fork();

    if (pid == -1)
    {
        perror("fork error ");
        exit(0);
    }
    // 자식프로세스가 실행시키는 코드
    else if (pid == 0)
    {
        printf("자식 : 내 PID는 %d\n", getpid());

	// let's close stdin, stdout, stderr in order to prevent communication from users.  
        close(0);
        close(1);
        close(2);

        setsid();
        while(1)
        {
            printf("-->%d\n", i);
            i++;
            sleep(1);
        }
    }
    // 부모프로세스가 실행시키는 코드
    else
    {
        printf("부모 : 내가 낳은 자식의 PID는 %d\n", pid);
        sleep(1);
        printf("T.T 나죽네\n");
        exit(0);
    }
}
