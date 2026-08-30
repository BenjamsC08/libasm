
#include <stddef.h>
#include <stdio.h>

typedef struct s_list
{
	void *data;
	struct s_list *next;
}	t_list;


extern int			ft_atoi_base(char *str, char *base);
extern void			ft_list_push_front(t_list **begin_list, void *data);
extern unsigned int	ft_list_size(t_list *begin_list);
extern void			ft_list_sort(t_list **begin_list, int (*cmp)());
extern int			ft_strcmp(const char *s1, const char *s2);

int main(int ac, char **av)
{
	int n = ft_atoi_base("12", "0123456789");
	printf("%d\n", n);
	int n1 = ft_atoi_base("0011010001111", "01");
	printf("%d\n", n1);
	int n2 = ft_atoi_base("FF", "0123456789ABCDEF");
	printf("%d\n", n2);

	t_list *l = NULL;
	ft_list_push_front(&l, "abc");
	ft_list_push_front(&l, (void *)"kiwi");
	ft_list_push_front(&l, (void *)"zebra");

	printf("SORT:\n");

	for (t_list *p = l; p; p = p->next)
		printf("%s\n", (char *)p->data);
	
	printf("size list: %d\n", ft_list_size(l));
	ft_list_sort(&l, ft_strcmp);

	for (t_list *p = l; p; p = p->next)
		printf("%s\n", (char *)p->data);
}
