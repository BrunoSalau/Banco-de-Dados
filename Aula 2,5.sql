//=========================================================================
create table departamento (
	codigo serial primary key,
	nome varchar(255) not null
);
create table professor(
	codigo serial primary key,
	nome varchar(255) not null,
	codigo_dep integer not null,
	foreign key (codigo_dep) references departamento(codigo)
);
create table disciplina(
	codigo serial primary key,
	nome varchar(255) not null,
	ementa varchar(255) not null,
	num_creditos integer not null,
	codigo_dep integer not null,
	codigo_pro integer not null,
	foreign key (codigo_dep) references departamento(codigo),
	foreign key (codigo_pro) references professor(codigo)
);
create table pre_requisito(
	codigo serial primary key,
	codigo_dis integer not null,
	foreign key (codigo_dis) references disciplina(codigo)
);
create table aluno(
	codigo serial primary key,
	nome varchar(255) not null,
	endereco varchar(255) not null
);
create table telefone_aluno(
	codigo serial primary key,
	numero varchar(255) not null,
	codigo_alu integer not null,
	foreign key (codigo_alu) references aluno(codigo)
);
create table aluno_graduacao(
	codigo serial primary key,
	ano_ingresso integer not null
);
create table aluno_pos_graduacao(
	codigo serial primary key,
	formacao varchar(255) not null,
	codigo_pro integer not null,
	foreign key (codigo_pro) references professor(codigo)
);
create table cursa(
	media float not null,
	ferequencia float not null,
	codigo_dis integer not null,
	codigo_alu integer not null,
	foreign key (codigo_dis) references disciplina(codigo),
	foreign key (codigo_alu) references aluno(codigo)
);

//=========================================================================

insert into departamento (nome)
values ('Computação');

select * from departamento;

//=========================================================================

insert into professor (nome, codigo_dep)
values('Alan dos Santos',1);

insert into professor (nome, codigo_dep)
values('Paula de Souza',1);

insert into professor (nome, codigo_dep)
values('Camila Ferreira',1);

insert into professor (nome, codigo_dep)
values('Sergio Lima',1);

select * from professor;

//=========================================================================

insert into disciplina (nome, ementa, codigo_dep, codigo_pro, num_creditos)
values ('Programação I','Variáveis, expressões, condicionais e laço de repetição',1,1,12);

insert into disciplina (nome, ementa, codigo_dep, codigo_pro, num_creditos)
values ('Programação II','Algoritimos de busca e ordenação',1,2,12);

insert into disciplina (nome, ementa, codigo_dep, codigo_pro, num_creditos)
values ('Introdução à Administração','Conceitos iniciais de ADM',1,3,12);

select * from disciplina;

//=========================================================================

insert into aluno (nome, endereco)
values ('Joao dos Santos','Rua da Lapa, 500');

insert into aluno (nome, endereco)
values ('Rosane Silva','Avenida JK, 1590');

insert into aluno (nome, endereco)
values ('Aline Camargo','Rua 2, 20');

select * from aluno;

//=========================================================================

insert into aluno_graduacao
values (1, 2021);

insert into aluno_graduacao
values(2, 2019);

select * from aluno_graduacao;

//=========================================================================

insert into aluno_pos_graduacao
values (3,'Ciência da Computação',1);

select * from aluno_pos_graduacao;

//=========================================================================

update aluno set endereco='Rua Sergipe, 150'
where nome = 'João dos Santos';

select * from aluno;
