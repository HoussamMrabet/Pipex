NAME = pipex

SRCS = pipex.c utils.c

OBJS = $(SRCS:.c=.o)

CC = cc -Wall -Wextra -Werror

INCLUDES = -Ilibft

FLAGS = -Llibft -lft

LIBFT = libft

all : $(LIBFT) $(NAME)

$(NAME) : $(OBJS)
	$(CC) $(OBJS) $(FLAGS) -o $(NAME)

%.o : %.c pipex.h libft/libft.a
	$(CC) $(INCLUDES) -c $< -o $@

$(LIBFT) :
	@make -C libft

clean :
	@make clean -C libft
	@rm -f $(OBJS)

fclean : clean
	@make fclean -C libft
	@rm -f $(NAME)

re : fclean all

.PHONY : clean $(LIBFT)