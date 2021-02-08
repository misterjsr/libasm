# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jeserran <jeserran@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/06 02:24:04 by jeserran          #+#    #+#              #
#    Updated: 2021/02/08 09:16:19 by jeserran         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME =			libasm.a

LIBASM_H =		-I include/libasm.h

SRC_DIR =		sources/

NFLAGS =		nasm -f macho64
CFLAGS =		gcc -Wall -Werror -Wextra

ifeq ($(OS), Linux)
NFLAGS = nasm -felf64
endif

SRC =			ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_read.s \
				ft_write.s \
				ft_strdup.s

SRCS =			$(addprefix $(SRC_DIR), $(SRC))

OBJ =			$(SRCS:.s=.o)

$(NAME):		$(OBJ)
				ar rc $(NAME) $(OBJ)

$(OBJ):			%.o:%.s
				$(NFLAGS) $<

all:			$(NAME)

clean:
				rm -rf $(SRC_DIR)/*.o
				@echo Cleaned

fclean:			clean
				rm -rf $(NAME)
				rm -rf a.out
				@echo File Cleaned

re: 			fclean all

test:
				make re
				$(CFLAGS) main.c $(LIBASM_H) $(NAME) -o test
				./test	

.PHONY: 		all clean fclean re test