delimiter $$
create trigger tr_registro_compra after insert on cmp_compras
for each row
begin
	insert into log_logs
    (log_mensagem)
    values
    (concat('Compra realizada em ', date_format(new.cmp_data_hora, '%d/%M/%Y %H:%m:%s')));
end $$

delimiter ;

-- drop trigger tr_registro_compra;

create table log_logs(
	log_id serial primary key,
    log_mensagem varchar(1000) not null
);

select * from cmp_compras;

insert into cmp_compras
(cmp_data_hora, cmp_valor_pago, cli_id)
values
(now(), 125.00, 1);

select * from log_logs;


