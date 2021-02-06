/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jeserran <jeserran@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/05 13:04:20 by jeserran          #+#    #+#             */
/*   Updated: 2021/02/06 03:13:49 by jeserran         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "include/libasm.h"

void	check_ft_strlen(char *s, int nb)
{
    int i = 0;
    int j = 0;

    printf(BLUE);
    printf("\n%d. %s\n", nb + 1, s);
    i = strlen(s);
    j = ft_strlen(s);
    (i == j ? printf(GREEN) : printf(RED));
    printf("   strlen : %d\n", i);
    printf("ft_strlen : %d\n", j);
    printf(RESET);
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

int main(void){
    int i;
    char *str[5] = {
        "hello Madrid", 
        "", 
        "42", 
        "abcdefghijklmnopqrstuvwxyz", 
        "what is your name ?"
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

}