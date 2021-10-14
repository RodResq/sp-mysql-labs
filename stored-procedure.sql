delimiter $$

create procedure sp_ola(in p_nome varchar(100))
begin
	select concat('Ola, ', p_nome);
end $$

delimiter ;

call sp_ola('TreinaWeb');