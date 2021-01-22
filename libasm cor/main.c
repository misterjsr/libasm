#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#define R "\x1b[31m"
#define G "\x1b[32m"
#define Y "\x1b[33m"
#define S "\x1b[0m"
size_t  ft_strlen(const char *s);
ssize_t ft_write(int fd, const void *buf, size_t nbyte);
ssize_t ft_read(int fd, void *buf, size_t nbyte);
int ft_strcmp(const char *s1, const char *s2);
char *ft_strcpy(char *dest, const char *src);
char *ft_strdup(const char *src);
void    test_strlen(char *s, int nb)
{
    int i = 0;
    int j = 0;
    printf("\n%d. %s\n", nb + 1, s);
    i = strlen(s);
    j = ft_strlen(s);
    (i == j ? printf(G) : printf(R));
    printf("   strlen : %d\n", i);
    printf("ft_strlen : %d\n", j);
    printf(S);
}
void test_write(int fd, int nb)
{
    int i = 0;
    int j = 0;
    char *file[4] = {
        "stdout text\n",
        "create file(ft_write_test) with rdwr\n",
        "Non exist file with rdwr\n",
        "exist file with rdonly\n"
    };
    printf("\n%d. %s", nb + 1, file[nb]);
    i = write(fd, file[nb], strlen(file[nb]));
    printf("\n");
    j = ft_write(fd, file[nb], strlen(file[nb]));
    printf("\n");
    (i == j ? printf(G) : printf(R));
    printf("   write : %d\n", i);
    printf("ft_write : %d\n", j);
    printf(S);
    if (fd != STDOUT_FILENO)
        close(fd);
}
void set_zero(char *s, int size)
{
    int i = 0;
    while (i < size)
        s[i++] = 0;
}
void test_read(char *file, int nb)
{
    char buff1[20];
    char buff2[20];
    int i = 0;
    int j = 0;
    int fd;
    set_zero(buff1, 20);
    set_zero(buff2, 20);
    fd = open(file, O_RDONLY);
    i = read(fd, buff1, 20);
    close(fd);
    if (i >= 0)
        buff1[i] = 0;
    fd = open(file, O_RDONLY);
    j = ft_read(fd, buff2, 20);
    close(fd);
    if (j >= 0)
        buff2[i] = 0;
    printf("\n%d. filename : %s\n", nb + 1, file);
    (i == j ? printf(G) : printf(R));
    printf("   read %d: %s\n", i, buff1);
    printf("ft_read %d: %s\n", j, buff2);
	printf("%d", errno);
    printf(S);
}
void test_strcmp(char *s1, char *s2, int nb)
{
    int i = strcmp(s1, s2);
    int j = ft_strcmp(s1, s2);
    printf("\n%d. |%s| vs |%s|\n", nb + 1, s1, s2);
    (i == j ? printf(G) : printf(R));
    printf("   strcmp : %d\n", i);
    printf("ft_strcmp : %d\n", j);
    printf(S);
}
void test_strcpy(char *src, int nb)
{
    char dest1[50];
    char dest2[50];  
    char *i = strcpy(dest1, src);
    char *j = ft_strcpy(dest2, src);
    printf("\n%d. copy |%s|\n", nb + 1, src);
    (strcmp(i, j) == 0 ? printf(G) : printf(R));
    printf("   strcpy : %s\n", i);
    printf("ft_strcpy : %s\n", j);
    printf(S);
}
void test_strdup(char *src, int nb)
{
    char *i = strdup(src);
    char *j = ft_strdup(src);
    printf("\n%d. strdup |%s|\n", nb + 1, src);
    (strcmp(i, j) == 0 ? printf(G) : printf(R));
    printf("   strdup : %s\n", i);
    printf("ft_strdup : %s\n", j);
    if (i)
        free(i);
    if (j)
        free(j);
    printf(S);
}
int main(void)
{
    int i;
    char *str[5] = {
        "hello", 
        "", 
        "42", 
        "my name is woolim", 
        "what is your name ?"
    };
    char *str2[5] = {
        "hello",
        "",
        "422",
        "my name is not woolim",
        "what is your name!"
    };
    char *file[5] = {
        "./README.md",
        "./ft_strlen.s",
        "./ft_write.s",
        "./ft_read.s",
        "./not_exist"
    };
    int fd[4] = {
        STDOUT_FILENO,
        open("./ft_write_test.txt", O_CREAT | O_WRONLY,
            S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP | S_IROTH),
        open("./not_exist", O_RDWR),
        open("./ft_write_test", O_RDONLY),
    };
    printf(Y "====================\n");
    printf("==    ft_strlen   ==\n");
    printf("====================\n"S);
    i = -1;
    while (++i < 5)
        test_strlen(str[i], i);
    printf("\n");
    printf(Y"====================\n");
    printf("==    ft_write    ==\n");
    printf("====================\n"S);
    i = -1;
    while (++i < 4)
        test_write(fd[i], i);
    printf("\n");
    printf(Y"====================\n");
    printf("==    ft_read    ==\n");
    printf("====================\n"S);
    i = -1;
    while (++i < 5)
        test_read(file[i], i);
	printf("%d", errno);
    printf("\n");
    printf(Y "====================\n");
    printf("==    ft_strcmp    ==\n");
    printf("====================\n" S);
    i = -1;
    while (++i < 5)
        test_strcmp(str[i], str2[i], i);
    printf("\n");
    printf(Y "====================\n");
    printf("==    ft_strcpy    ==\n");
    printf("====================\n" S);
    i = -1;
    while (++i < 5)
        test_strcpy(str[i], i);
    printf("\n");
    printf(Y"====================\n");
    printf("==    ft_strdup   ==\n");
    printf("====================\n" S);
    i = -1;
    while (++i < 5)
        test_strdup(str[i], i);
    printf("\n");
    return (0);
}