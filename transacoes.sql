-- cria o delimitador da procedure, para nao gerar error com o delimitador padrao (;)
delimiter $$
-- cria uma stored procedure que recebe parametros de entrada (in)
create procedure sp_resgistrar_compra(
										in p_valor_pago decimal, 
                                        in p_cli_id bigint,
                                        in p_prd_id bigint,
                                        in p_quantidade int,
                                        in p_preco decimal)
-- inicio bloco excecuacao procedure
begin
	-- variavel pra guardar o ultimo id inserido, pega o id da sessao
	declare v_cmp_id bigint;
    -- declaracao de um handler caso algo errada ocorra com as operacoes da transacao
    -- se ocorre algo errado lanca um sqlException
	declare exit handler for sqlexception
    -- entra no begin caso ocorra algo errado e executa o codigo dentro do bloco;
    begin
		rollback;
        select 'Deu ruim';
    end;
    -- Se nao houve nada errado, inicia uma transacao
	start transaction;
    -- insere os valores recebidos como parametro na tabela
    insert into cmp_compras(cmp_data_hora, cmp_valor_pago, cli_id)
					values(now(), p_valor_pago, p_cli_id);
	-- seta a variavel com o ultimo id
	set v_cmp_id = last_insert_id();
    -- insere os valores na tabela
    insert into cmp_prd_compras_produtos values(p_prd_id, v_cmp_id, p_quantidade, p_preco);
    -- salva as operacoes em disco (persiste)
    commit;
    select 'Ok';
end $$

delimiter ;

select * from cmp_compras;
select * from cmp_prd_compras_produtos;
desc cmp_compras;
desc cmp_prd_compras_produtos;

call sp_resgistrar_compra(200, 33, 1, 1, 150);
call sp_relatorio_clientes(@total_linhas);
