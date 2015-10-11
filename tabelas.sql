--Grupo 2 - 2015.2 CEASA

--elimina tabelas que foram previamente criadas

drop table pessoa cascade constraints;
drop table endereco cascade constraints;
drop table telefone cascade constraints;
drop table fisica cascade constraints;
drop table funcionario cascade constraints;
drop table cliente cascade constraints;
drop table comerciante cascade constraints;
drop table fornecedor cascade constraints;
drop table produto cascade constraints;
drop table xepa cascade constraints;
drop table lote cascade constraints;
drop table cliente_produto cascade constraints;
drop table fornece cascade constraints;
drop table compra cascade constraints;


--cria tabelas
CREATE TABLE pessoa (
	id integer,
	nome VARCHAR2 (60),
	constraint pessoa_key primary key (id)
);

CREATE TABLE endereco (
	logradouro VARCHAR2 (60),
	cep VARCHAR2 (9),
	uf VARCHAR2 (2),
	id_pessoa integer,
	constraint endereco_key primary key (id_pessoa),
	constraint endereco_fkey foreign key (id_pessoa) references pessoa(id)
);


CREATE TABLE telefone (
	id_pessoa integer,
	telefone VARCHAR2 (20),
	constraint telefone_key primary key (id_pessoa, telefone),
	constraint telefone_fkey foreign key (id_pessoa) references pessoa(id)
);

CREATE TABLE fisica (
	id integer,
	cpf VARCHAR2 (20),
	constraint fisica_key primary key (id),
	constraint fisica_fkey foreign key (id) references pessoa(id)
);

CREATE TABLE funcionario (
	id integer,
	cargo VARCHAR2 (60),
	salario NUMBER(8,2),
	id_supervisor integer,
	constraint funcionario_key primary key (id),
	constraint funcionario_fkey foreign key (id) references pessoa(id),
	constraint funcionario_fkey2 foreign key (id_supervisor) references pessoa(id)
);

CREATE TABLE cliente (
	id integer,
	PlacaCarro VARCHAR2 (60),
	id_funcionario integer,
	constraint cliente_key primary key (id),
	constraint cliente_fkey foreign key (id) references pessoa(id),
	constraint cliente_fkey2 foreign key (id_funcionario) references pessoa(id)
);

CREATE TABLE comerciante (
	id integer,
	credito NUMBER(8,2),
	constraint comerciante_key primary key (id),
	constraint comerciante_fkey foreign key (id) references pessoa(id)
);

CREATE TABLE fornecedor (
	id integer,
	cnpj VARCHAR2(20),
	constraint fornecedor_key primary key (id),
	constraint fornecedor_fkey foreign key (id) references pessoa(id)
);

CREATE TABLE produto (
	id integer,
	nome VARCHAR2(60),
	quantidade integer,
	valor NUMBER(8,2),
	validade date,
	constraint produto_key primary key (id)
);

CREATE TABLE cliente_produto (
	id_produto integer,
	id_cliente integer,
	constraint cliente_produto_key primary key (id_produto, id_cliente),
	constraint cliente_produto_fkey2 foreign key (id_produto) references produto(id),
	constraint cliente_produto_fkey3 foreign key (id_cliente) references cliente(id)
);

CREATE TABLE xepa (
	id integer,
	desconto NUMBER(8,2),
	periodo date,
	id_produto integer,
	id_cliente integer,
	constraint xepa_key primary key (id, id_cliente, id_produto),
	constraint xepa_fkey foreign key (id_produto, id_cliente) references cliente_produto(id_produto, id_cliente)
);

CREATE TABLE lote (
	id integer,
	tempo integer,
	id_comerciante integer,
	constraint lote_key primary key (id),
	constraint lote_fkey foreign key (id_comerciante) references comerciante(id)
);


CREATE TABLE fornece (
	id_fornecedor integer,
	id_comerciante integer,
	id_produto integer,
	constraint fornece_key primary key (id_fornecedor, id_comerciante, id_produto),
	constraint fornece_fkey foreign key (id_fornecedor) references fornecedor(id),
	constraint fornece_fkey2 foreign key (id_comerciante) references comerciante(id),
	constraint fornece_fkey3 foreign key (id_produto) references produto(id)
);

CREATE TABLE compra (
	id_cliente integer,
	id_produto integer,
	quantidade integer,
	horario date,
	constraint compra_key primary key (id_cliente, id_produto),
	constraint compra_fkey foreign key (id_cliente) references cliente(id),
	constraint compra_fkey2 foreign key (id_produto) references produto(id)
);
