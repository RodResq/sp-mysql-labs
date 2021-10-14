create table prd_produtos (
	prd_id serial primary key,
    prd_nome varchar(30) not null,
    prd_codigo varchar(50) default '-'
);

create table unm_unidades_medida(
	unm_id serial primary key,
    unm_nome varchar(30),
    unm_sigla varchar(5) not null
);

-- alter table prd_produtos
-- add column unm_id int not null;

alter table prd_produtos 
change column unm_id unm_id bigint unsigned not null;

alter table prd_produtos
add constraint fk_prd_produtos__unm_unidades_medida__unm_id
foreign key(unm_id) references unm_unidades_medida(unm_id);

commit;

describe unm_unidades_medida;

insert into unm_unidades_medida
(unm_nome, unm_sigla)
values
('Quilograma', 'Kg');

insert into prd_produtos
(prd_nome, prd_codigo, unm_id)
values
('Carne', '123', 1);

describe prd_produtos;

select * from unm_unidades_medida;

select * from prd_produtos;

insert into unm_unidades_medida
(unm_nome, unm_sigla)
values
('Pacote', 'Pct');

insert into prd_produtos
(prd_nome, prd_codigo, unm_id)
values
('Bolacha', '1234', 2);


describe cli_clientes;

create table cmp_compras(
	cmp_id serial primary key,
    cmp_data_hora datetime not null default now(),
    cmp_vaLor_pago decimal(8,2) not null,
    cli_id bigint unsigned not null,
    foreign key (cli_id) references cli_clientes(cli_id)
);

describe prd_produtos;

create table cmp_prd_compras_produtos(
	cmp_id bigint unsigned not null,
    prd_id bigint unsigned not null,
    cmp_prd_quantidade int not null,
    cmp_prd_preco decimal(8,2) not null,
    primary key(cmp_id, prd_id),
    foreign key(cmp_id) references cmp_compras(cmp_id),
    foreign key(prd_id) references prd_produtos(prd_id)
);


