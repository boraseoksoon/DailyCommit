#include <stdio.h>

char* strchrm(char* first, char* last, char value)
{
    while (first != last && *first != value)
    {
        ++first;
    } 
 
    return first == last ? 0 : first;
}

int main()
{
    char s[] = "This is your task.\n";
    char ch = 'a';
    // find 'a' character in the string.
    char* cp = strchrm(s, s + 15, ch);
 
    if (cp == 0) 
    {
        printf("can't find your character : %c\n", ch);
    } 
        
    else
    {
        printf("found : %c\n", *cp);
    } 
}
