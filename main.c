
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern size_t	ft_strlen(const char *str);
extern int		ft_strcmp(const char *s1, const char *s2);
extern char		*ft_strcpy(char *dst, const char *src);
extern int		ft_write(int fd, const char *buff, size_t count);
ssize_t			ft_read(int fd, char *buf, size_t count);
char			*ft_strdup(const char *s);


int main(int ac, char **av)
{
	if (ac !=2)
		return (1);
	size_t len = ft_strlen(av[1]);
	printf("Length of '%s': %zu\n", av[1], len);

	int cmp = ft_strcmp(av[1], "Hello World");
	int cmp1 = strcmp(av[1], "Hello World");
	if (!cmp)
		printf("You correctly write Hello World\n");
	else
		printf("You did not correctly write Hello World [%d]\n", cmp);
	printf("Real strcmp return: [%d]\n", cmp1);

	char dst[50];
	char *src = "Hello World";
	char *ptr = ft_strcpy(dst, src);
	printf("src:'%s', dst:'%s'\n", src, dst);
	printf("same adress ? %s\n", ptr == dst ? "yes" : "no");

	ft_write(2, "test\n", 5);

	char buf_read[11];
	ssize_t nread = ft_read(0, buf_read, 10);
	buf_read[10] = 0;
	ft_write(1, buf_read, nread);

	char *dup = ft_strdup("biduletrucmachin\n");
	if (!dup)
		return (1);
	printf("%s", dup);
	free(dup);

	return (0);
}
