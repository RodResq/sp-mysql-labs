-- funcoes deterministicas
create function fn_ola()
returns varchar(20)
	return 'Ola';

select fn_ola();

-- funcoes nao deterministica
select now();

drop function fn_ola;



