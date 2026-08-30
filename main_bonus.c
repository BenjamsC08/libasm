
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
}	t_list;


extern int			ft_atoi_base(char *str, char *base);
extern void			ft_list_push_front(t_list **begin_list, void *data);
extern unsigned int	ft_list_size(t_list *begin_list);
extern void			ft_list_sort(t_list **begin_list, int (*cmp)());
extern void			ft_list_remove_if(t_list **begin_list, void *data_ref,
										int (*cmp)(), void (*free_fct)(void *));
extern int			ft_strcmp(const char *s1, const char *s2);
extern char			*ft_strdup(const char *s);

int main(int ac, char **av)
{
	int n = ft_atoi_base("12", "0123456789");
	printf("%d\n", n);
	int n1 = ft_atoi_base("0011010001111", "01");
	printf("%d\n", n1);
	int n2 = ft_atoi_base("FF", "0123456789ABCDEF");
	printf("%d\n", n2);


	char *str0 = ft_strdup("abc");
	char *str1 = ft_strdup("Luigi");
	char *str2 = ft_strdup("Mario");

	t_list *l = NULL;
	ft_list_push_front(&l, str0);
	ft_list_push_front(&l, str1);
	ft_list_push_front(&l, str2);

	printf("size list: %d\n", ft_list_size(l));
	printf("SORT:\n");

	for (t_list *p = l; p; p = p->next)
		printf("%s\n", (char *)p->data);
	
	ft_list_sort(&l, ft_strcmp);

	for (t_list *p = l; p; p = p->next)
		printf("%s\n", (char *)p->data);

	printf("\nDEL:\n");
	
	ft_list_remove_if(&l, "abc", ft_strcmp, free);

	for (t_list *p = l; p; p = p->next)
		printf("%s\n", (char *)p->data);

	printf("size list: %d\n", ft_list_size(l));

}
