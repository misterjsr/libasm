/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jeserran <jeserran@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/11 17:00:38 by jeserran          #+#    #+#             */
/*   Updated: 2019/11/20 10:52:06 by jeserran         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strdup(const char *src)
{
	char	*dest;
	int		s;
	int		i;

	s = ft_strlen(src);
	if (!(dest = (char *)malloc(sizeof(char) * s + 1)))
		return (NULL);
	i = 0;
	while (src[i])
	{
		dest[i] = src[i];
		i += 1;
	}
	dest[i] = '\0';
	return (dest);
}
