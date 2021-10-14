select cli.cli_nome,  coalesce(sum(distinct(cmp.cmp_vaLor_pago)), 0), 
	count(distinct(cmp.cmp_id)),
    avg(cmp_prd.cmp_prd_quantidade * cmp_prd.cmp_prd_preco)
	from cli_clientes cli
left join cmp_compras cmp
	on cli.cli_id = cmp.cli_id
inner join cmp_prd_compras_produtos cmp_prd
	on cmp.cmp_id = cmp_prd.cmp_id
inner join prd_produtos prd
	on cmp_prd.prd_id = prd.prd_id
group by cli.cli_id
having count(cmp_prd.cmp_id > 1);

select * from cmp_prd_compras_produtos;

select *
	from cli_clientes cli
left join cmp_compras cmp
	on cli.cli_id = cmp.cli_id;
    
desc cmp_prd_compras_produtos; 
   
insert into cmp_prd_compras_produtos
(prd_id, cmp_id, cmp_prd_quantidade, cmp_prd_preco)
values
(2, 1, 2, 50);

insert into cmp_prd_compras_produtos
(prd_id, cmp_id, cmp_prd_quantidade, cmp_prd_preco)
values
(2, 2, 2, 50);

insert into cmp_prd_compras_produtos
(prd_id, cmp_id, cmp_prd_quantidade, cmp_prd_preco)
values
(2, 2, 1, 50);

select * from prd_produtos;
select * from cmp_compras;

select * from cmp_prd_compras_produtos;