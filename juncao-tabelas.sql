select * from cli_clientes;

select * from cmp_compras;

insert into cmp_compras
(cmp_data_hora, cmp_valor_pago, cli_id)
values
(now(), 75.00, 2);

select cli.cli_nome, cli.cli_cpf, cmp.cmp_data_hora, cmp.cmp_vaLor_pago 
from cli_clientes cli, cmp_compras cmp
where cli.cli_id = cmp.cli_id;

select cli.cli_nome nome, cli.cli_cpf cpf, cmp.cmp_data_hora dia, cmp.cmp_vaLor_pago valor 
from cli_clientes cli
inner join cmp_compras cmp on cli.cli_id = cmp.cli_id
where cmp.cmp_vaLor_pago > 100;

select cli.cli_nome, cli.cli_cpf, cmp.cmp_data_hora,  coalesce(cmp.cmp_vaLor_pago, 0)
	from cli_clientes cli
left join cmp_compras cmp
	on cli.cli_id = cmp.cmp_id;
-- where cmp.cmp_data_hora is null;

select cli.cli_nome, cli.cli_cpf, cmp.cmp_data_hora,  coalesce(cmp.cmp_vaLor_pago, 0)
	from cmp_compras cmp
right join cli_clientes cli
	on cli.cli_id = cmp.cmp_id;



