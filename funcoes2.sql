
delimiter $$

create function fn_calcular_valor_compra(p_id_compra bigint)
returns decimal(8,2)
begin
	declare v_valor_compra decimal(8,2);
	select sum(cmp_prd_quantidade * cmp_prd_preco) 
		into v_valor_compra
		from cmp_prd_compras_produtos
		where cmp_id = p_id_compra;
	return v_valor_compra;
end $$

delimiter ; -- sempre voltar o delimitador para ";"

select * from cmp_prd_compras_produtos;

select fn_calcular_valor_compra(2);

select distinct fn_calcular_valor_compra(cmp_id)
from cmp_prd_compras_produtos;