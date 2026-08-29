NASM = nasm
NASMFLAGS = -f elf64

NAME = libasm.a
SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS = $(SRCS:.s=.o)

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

test: $(NAME) main.c
	gcc -g3 main.c $(NAME) -o test

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME) main

re: fclean all
