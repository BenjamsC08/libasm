NASM = nasm
NASMFLAGS = -f elf64
CC = gcc
CFLAGS = -g3

NAME = libasm.a

SRC_DIR = Mandatory
BONUS_DIR = Bonus
OBJ_DIR = Obj

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
BONUS_SRCS = ft_atoi_base_bonus.s ft_isspaces_bonus.s ft_strchr_bonus.s ft_list_push_front_bonus.s ft_list_size_bonus.s ft_list_sort_bonus.s ft_list_remove_if_bonus.s

OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:.s=.o))
BONUS_OBJS = $(addprefix $(OBJ_DIR)/, $(BONUS_SRCS:.s=.o))

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

bonus: $(OBJS) $(BONUS_OBJS)
	ar rcs $(NAME) $^

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s | $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

$(OBJ_DIR)/%.o: $(BONUS_DIR)/%.s | $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

test: $(NAME) main.c
	$(CC) $(CFLAGS) main.c $(NAME) -o test

test_bonus: bonus main_bonus.c
	$(CC) $(CFLAGS) main_bonus.c $(NAME) -o test_bonus

clean:
	rm -f $(OBJS) $(BONUS_OBJS)

fclean: clean
	rm -f $(NAME) test test_bonus main

re: fclean all

.PHONY: all bonus clean fclean re test test_bonus
