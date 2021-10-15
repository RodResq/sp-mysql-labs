-- criando um delimitar diferente de ponto-e-virgula para delimitar o bloco;
delimiter $$
-- criando uma stored procedure como do tipo de saida de dados (out - parametro)
create procedure sp_relatorio_clientes(out p_linhas_processadas int)
-- inicio do bloco de construcao da sp;
begin
	-- declaracao das variaveis
	declare v_nome_cliente varchar(100);
    declare v_valor_pago decimal(8,2);
    declare v_quantidade_compras int;
    declare v_media_preco_produto decimal;
    -- criacao variavel de controle do loop (flag)
    declare v_finalizado integer default 0;
    -- criacao do cursor (O cursor e um objeto sql que pode ser um result set)
    declare cr_relatorio_clientes cursor for
		select * from vw_relatorio_clientes;
	-- definicao de um handler quando o cursor atingir a ultima linhas de um result set
	declare continue handler for not found set v_finalizado = 1;
    -- seta um valor inicial para out
    set p_linhas_processadas = 0;
    -- deleta os dados da tabela para existir dados duplicados
    delete from dw_relatorio_clientes;
    -- abre (inicia o cursor)
    open cr_relatorio_clientes;
    -- inicia a repeticao de linha por linha do result-set
	loop_relatorio_cliente: loop
		-- recuperar o valor de cada linha (fetch) e seta nas variaveis
		fetch cr_relatorio_clientes into v_nome_cliente, v_valor_pago, v_quantidade_compras, v_media_preco_produto;
        -- checa se handle foi lancado
        if	v_finalizado = 1 then
			-- sai do laco 
			leave loop_relatorio_cliente;
        end if;
        -- insere os valores na nova tabela
        insert into dw_relatorio_clientes values(v_nome_cliente, v_valor_pago, v_quantidade_compras, v_media_preco_produto);
        -- seta o acumalador de linhas;
        set p_linhas_processadas = p_linhas_processadas + 1; -- acumulador
    -- fim do laco    
	end loop loop_relatorio_cliente;
    -- fecha o cursor
    close cr_relatorio_clientes;
-- fim do bloco de construcao da sp;
end $$

-- retornando o valor do delimitador para o valor padrao
delimiter ;

select * from vw_relatorio_clientes;

create table dw_relatorio_clientes(
	cli_nome varchar(100) not null,
    valor_pago decimal(8,2) not null,
    quantidade_compras int,
    media_preco_produto decimal not null
);

select * from dw_relatorio_clientes;

-- chamada da stored procedure recebento o valor de saida (out) como parametro
call sp_relatorio_clientes(@v_linhas_processadas);
select @v_linhas_processadas;