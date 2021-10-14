-- cli_id bigint not null primary key auto_increment, (substituido por serial)
create table cli_clientes (
	cli_id serial primary key, -- bigint, not null auto_increment, unsigned, unique
    cli_nome varchar(50) not null,
    cli_data_nascimento date,
    cli_logradouro varchar(200)
);

drop table cli_clientes;

insert into cli_clientes
(cli_nome, cli_data_nascimento, cli_logradouro)
values
('TreinaWeb Tecnologia', '2006-01-01', 'Avenida Pulista, n 1000'); 

insert into cli_clientes
(cli_nome)
values
('TreinaWeb Tecnologia'); 

select * from cli_clientes;

select * from cli_clientes
where cli_id = 1;

select * from cli_clientes
where cli_data_nascimento is null;

alter table cli_clientes
add column cli_cpf char(14) not null default '-' after cli_nome;

alter table cli_clientes
drop column cli_cpf;

insert into cli_clientes
(cli_nome, cli_cpf, cli_data_nascimento, cli_logradouro)
values
('Joao da Silva', '123.456.678-91', '2010-01-01', 'Rua Teste');

insert into cli_clientes
(cli_nome, cli_data_nascimento, cli_logradouro)
values
('Joao da Silva', '2010-01-01', 'Rua Teste');

update cli_clientes
set cli_cpf = '234.456.784-02', 
	cli_nome = 'Maria da Silva',
    cli_logradouro = 'Avenida Teste'
where cli_id = 4;

alter table cli_clientes
add constraint un_cli_clientes__cli_cpf unique(cli_cpf);

-- remover uma constraint (index)
alter table cli_clientes
drop index un_cli_clientes__cli_cpf;

update cli_clientes
set cli_cpf = '986.647.254-04'
where cli_id = 1;

update cli_clientes
set cli_cpf = '986.647.254-04',
	cli_nome = 'Treina Web 2'
where cli_id = 2;

commit;

select * from cli_clientes
where cli_data_nascimento is not null and cli_logradouro is null;

update cli_clientes
set cli_logradouro = null
where cli_id = 4;

select * from cli_clientes
where cli_nome like 'Tr%';

select * from cli_clientes
where upper(cli_nome) like '%M%';

insert into cli_clientes
(cli_nome, cli_cpf, cli_data_nascimento, cli_logradouro)
values
('Marcos', '333.333.333-33', '2010-01-01', 'Rua Teste 1');

insert into cli_clientes
(cli_nome, cli_cpf, cli_data_nascimento, cli_logradouro)
values
('Marcus', '444.444.444-44', '2005-01-01', 'Rua Teste 2');

insert into cli_clientes
(cli_nome, cli_cpf, cli_data_nascimento, cli_logradouro)
values
('Markos', '555.555.555-55', '1999-01-01', 'Rua Teste 3');

select * from cli_clientes;

/* faz uma busca fonetica */
select * from cli_clientes
where soundex(cli_nome) = soundex('Marcos');

select cli_nome, cli_data_nascimento, timestampdiff(year, cli_data_nascimento, curdate()) as cli_idade
from cli_clientes;





