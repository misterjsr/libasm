NAME = libasm.a

NA = nasm -f macho64
CC = @gcc


SRCS = 	ft_strlen.s \
		ft_strcmp.s \
		ft_strdup.s \
		ft_write.s \
		ft_strcpy.s \
		ft_read.s 	

OBJ =  ${SRCS:.s=.o}

%.o :	%.s
		$(NA) $<

all:	$(NAME)

$(NAME):	$(OBJ)
			@echo START
			ar rc $(NAME) $(OBJ)
			ranlib $(NAME)
			

clean:		
			rm -rf $(OBJ)
			@echo Cleaned object files

fclean:	clean
			rm -rf $(NAME)
			@echo Cleaned $(NAME)

re:	fclean all

.PHONY: all re clean fclean 