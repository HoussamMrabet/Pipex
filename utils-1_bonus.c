/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils-1_bonus.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hmrabet <hmrabet@student.1337.ma>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/25 07:52:01 by hmrabet           #+#    #+#             */
/*   Updated: 2024/01/25 07:52:38 by hmrabet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex_bonus.h"

void	get_outfile(char *argv, t_ppxb *pipex)
{
	if (pipex->here_doc)
		pipex->outfile = open(argv, O_WRONLY | O_CREAT | O_APPEND, 0000644);
	else
		pipex->outfile = open(argv, O_CREAT | O_RDWR | O_TRUNC, 0000644);
	if (pipex->outfile < 0)
		msg_error(ERR_OUTFILE);
}

int	msg(char *err)
{
	write(2, err, ft_strlen(err));
	return (1);
}

void	msg_pipe(char *arg)
{
	write(2, ERR_CMD, ft_strlen(ERR_CMD));
	write(2, arg, ft_strlen(arg));
	write(2, "\n", 1);
}

void	msg_error(char *err)
{
	perror(err);
	exit (1);
}
