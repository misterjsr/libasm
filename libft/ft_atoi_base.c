/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jeserran <jeserran@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/09/19 06:32:43 by jeserran          #+#    #+#             */
/*   Updated: 2019/09/19 10:39:29 by jeserran         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>

int		rev_base(char *base)
{
	int	i;
	int	j;

	i = 0;
	while (base[i])
	{
		if (base[i] == '-' || base[i] == '+')
			return (0);
		j = 0;
		while (base[j])
		{
			if (j != i && base[j] == base[i])
				return (0);
			j++;
		}
		i++;
	}
	if (i < 2)
		return (0);
	return (1);
}

int		bas(char *str)
{
	int	counter;

	counter = 0;
	while (str[counter])
		counter++;
	return (counter);
}

int		ft_atoi_base(char *str, char *base)
{
	int	nb;
	int	i;
	int	j;
	int a;
	int neg;

	if (!rev_base(base))
		return ;
	a = bas(base);
	while (*str == ' ' || *str == '\t' || *str == '\n'
			|| *str == '\v' || *str == '\f' || *str == '\r')
		str++;
	neg = 0;
	while (*str == '-' || *str == '+')
	{
		if (*str == '-')
			neg = !neg;
		str++;
	}
	nb = 0;
	i = 0;
	while (str[i] >= '0' && str[i] <= '9')
		i++;
	j = 0;
}
