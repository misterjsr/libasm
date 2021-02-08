/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jeserran <jeserran@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/05 13:04:20 by jeserran          #+#    #+#             */
/*   Updated: 2021/02/08 12:58:19 by jeserran         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "include/libasm.h"

void	check_ft_strlen(char *s, int nb)
{
    int i = 0;
    int j = 0;

    printf("\n%d. %s\n", nb + 1, s);
    i = strlen(s);
    j = ft_strlen(s);
    (i == j ? printf(GREEN) : printf(RED));
    printf("   strlen : %d\n", i);
    printf("ft_strlen : %d\n", j);
}

void test_strcpy(char *src, int nb)
{
    char dest1[50];
    char dest2[50];  
    char *i = strcpy(dest1, src);
    char *j = ft_strcpy(dest2, src);
    printf("\n%d. copy |%s|\n", nb + 1, src);
    (strcmp(i, j) == 0 ? printf(GREEN) : printf(RED));
    printf("   strcpy : %s\n", i);
    printf("ft_strcpy : %s\n", j);
    printf(RESET);
}

void test_strcmp(char *s1, char *s2, int nb)
{
    int i = strcmp(s1, s2);
    int j = ft_strcmp(s1, s2);
    printf("\n%d. |%s| vs |%s|\n", nb + 1, s1, s2);
    ((i > 0 && j > 0) ? printf(GREEN) : (i < 0 && j < 0) ? printf(GREEN) : (i == 0 && j == 0) ? printf(GREEN) : printf(RED));
    printf("   strcmp : %d\n", i);
    printf("ft_strcmp : %d\n", j);
    printf(RESET);
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
    (i == j ? printf(GREEN) : printf(RED));
    printf("   write : %d\n", i);
    printf("ft_write : %d\n", j);
    printf(RESET);
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
    (i == j ? printf(GREEN) : printf(RED));
    printf("   read %d: %s\n", i, buff1);
    printf("ft_read %d: %s\n", j, buff2);
	printf("errno %d", errno);
    printf(RESET);
}

void test_strdup(char *src, int nb)
{
    char *i = strdup(src);
    char *j = ft_strdup(src);
    printf("\n%d. strdup |%s|\n", nb + 1, src);
    (strcmp(i, j) == 0 ? printf(GREEN) : printf(RED));
    printf("   strdup : %s\n", i);
    printf("ft_strdup : %s\n", j);
    if (i)
        free(i);
    if (j)
        free(j);
    printf(RESET);
}
int main(void){
    int i;
    char *str[5] = {
        "hello Madrid", 
        "", 
        "42", 
        "abcdefghijklmnopqrstuvwxyz", 
        "\xff\xfe"
    };
    char *str2[5] = {
        "hello Madrid", 
        "", 
        "42", 
        "abcdefghijklmnopqrstuvwxyz0", 
        "\xff"
    };
    int fd[4] = {
        STDOUT_FILENO,
        open("./test.txt", O_CREAT | O_WRONLY,
        S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP | S_IROTH),
        open("./not_exist", O_RDWR),
        open("./test", O_RDONLY),
    };
       char *file[5] = {
        "./README.md",
        "./sources/ft_strlen.s",
        "./sources/ft_write.s",
        "./sources/ft_read.s",
        "./not_exist"
    };
    printf("\n\n==================================\n");
	printf("======  STRLEN vs FT_STRLEN ======\n");
	printf("==================================\n");
    i = -1;
    while (++i < 5)
        check_ft_strlen(str[i], i);
    printf("\n");
    printf("\n\n==================================\n");
    printf("==   STRCPY vs FT_STRCPY   ==\n");
    printf("==================================\n");
    i = -1;
    while (++i < 5)
        test_strcpy(str[i], i);
    printf("\n");
    printf("\n\n==================================\n");
    printf("==   STRCMP vs FT_STRCMP   ==\n");
    printf("==================================\n");
    i = -1;
    while (++i < 5)
        test_strcmp(str[i], str2[i], i);
    printf("\n");
    printf("====================\n");
    printf("==    ft_write    ==\n");
    printf("====================\n");
    i = -1;
    while (++i < 4)
        test_write(fd[i], i);
    printf("\n");
    printf("====================\n");
    printf("==    ft_read    ==\n");
    printf("====================\n");
    i = -1;
    while (++i < 5)
        test_read(file[i], i);
	printf("%d", errno);
    printf("\n");
    printf("====================\n");
    printf("==    ft_strdup   ==\n");
    printf("====================\n" );
    i = -1;
    while (++i < 5)
        test_strdup(str[i], i);
    printf("\n");
    return (0);
}