##
## EPITECH PROJECT, 2018
## make file
## File description:
## make file
##

ASM	=	nasm

CC	=	gcc

RM	=	rm -f

ASFLAGS	=	-f elf64

NAME	=	libasm.so

SRCS	=	src/my_strlen.asm		\
			src/my_strchr.asm		\
			src/my_strcmp.asm		\
			src/my_strncmp.asm		\
			src/my_strcasecmp.asm	\
			src/my_rindex.asm		\
			src/my_memset.asm		\
			src/my_memcpy.asm		\
			src/my_memmove.asm		\
			src/my_strstr.asm		\
			src/my_strpbrk.asm		\
			src/my_strcspn.asm		\

OBJS	=	$(SRCS:.asm=.o)

TEST	=	tests/test_asm.c

TNAME	=	unit_test

all:		$(NAME)

$(NAME):	$(OBJS)
		$(CC) -shared -fPIC -nostdlib $(OBJS) -o $(NAME)

%.o : %.asm
		$(ASM) $(ASFLAGS) -o $@ $<

tests_run:	re
		gcc -o $(TNAME) $(SRC) $(TEST)
		LD_PRELOAD=./libasm.so ./unit_test

clean:
		$(RM) $(OBJS)

fclean:		clean
		$(RM) $(NAME) $(TNAME)

re:		fclean all

.PHONY:		all clean fclean re