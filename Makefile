NAME = pipex
BONUS = pipex_bonus

SRCS = pipex.c utils.c
BSRCS = pipex_bonus.c utils-0_bonus.c utils-1_bonus.c child_bonus.c here_docs_bonus.c get_next_line.c get_next_line_utils.c

OBJS = $(SRCS:.c=.o)
BOBJS = $(BSRCS:.c=.o)

CC = cc -Wall -Wextra -Werror

INCLUDES = -Ilibft

FLAGS = -Llibft -lft

LIBFT = libft

all : $(LIBFT) $(NAME)
bonus : $(LIBFT) $(BONUS)

$(NAME) : $(OBJS)
	$(CC) $(OBJS) $(FLAGS) -o $(NAME)

$(BONUS) : $(BOBJS)
	$(CC) $(BOBJS) $(FLAGS) -o $(BONUS)

%.o : %.c pipex.h pipex_bonus.h get_next_line.h libft/libft.a
	$(CC) $(INCLUDES) -c $< -o $@

$(LIBFT) :
	@make -C libft

clean :
	@make clean -C libft
	@rm -f $(OBJS) $(BOBJS)

fclean : clean
	@make fclean -C libft
	@rm -f $(NAME) $(BONUS)

re : fclean all

.PHONY : clean $(LIBFT)