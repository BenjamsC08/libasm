
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

int main(int ac, char **av)
{
	int n = ft_atoi_base("12", "0123456789");
	printf("%d\n", n);
	int n1 = ft_atoi_base("0011010001111", "01");
	printf("%d\n", n1);
	int n2 = ft_atoi_base("FF", "0123456789ABCDEF");
	printf("%d\n", n2);

	t_list *l;
	int nb = 42;
	int *nb_ptr = &nb;
	ft_list_push_front(&l, nb_ptr);

	int *ptr_nb = (int *)(l->data);
	int nb1 = *ptr_nb;
	printf("list data:%d\n", nb1);

	ft_list_push_front(&l, (void *)"machin");
	printf("list data:%s\n", (char *)l->data);

	printf("size list: %d\n", ft_list_size(l));
}
