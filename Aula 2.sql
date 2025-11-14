/*drop table professor;
drop table departamento;*/

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

alter table Aluno
add registroAcademico integer not null;

alter table Aluno
drop column registroAcademico;

insert into departamento (nome)
values ('Medicina');

select * from departamento;

insert into professor (nome, codigo_dep)
values('Caxias do Sul',31);

insert into professor (nome, codigo_dep)
values('Maranhao',32);

insert into professor (nome, codigo_dep)
values('Rio de Janeiro',32);

insert into professor (nome, codigo_dep)
values('Sergio Lima',1);

delete from departamento where codigo between 2 and 30;

insert into disciplina (nome, ementa, codigo_dep, codigo_pro, num_creditos)
values ('Programação I','Variaveis, expressoes, codicionais e laço de repetição',1,1,1);

insert into disciplina (nome, ementa, codigo_dep, codigo_pro, num_creditos)
values ('Programação II','algoritimos de busca e ordenação',31,2,1);

insert into disciplina (nome, ementa, codigo_dep, codigo_pro, num_creditos)
values ('Programação III','conceitos iniciais de ADM',32,3,1);

insert into aluno (nome, endereco)
values ('Jao dos Santos','rua da lapa, 500');

insert into aluno (nome, endereco)
values ('rosane silva','avenida, 1500');

insert into aluno (nome, endereco)
values ('Aline Camargo','rua');

insert into aluno_graduacao values (1, 2021);
insert into aluno_graduacao values (2, 2019);

insert into aluno_pos_graduacao
values (3,'ciencia da computação',1);

update aluno set endereco='rua sergipe, 150'
where codigo = 1;

update aluno set nome = 'pessoa'

select * from aluno;

delete from aluno
where codigo = 1;

select nome from departamento;

select * from aluno
where endereco like '%a%';

select * from professor
order by codigo desc;

select distinct codigo_pro
from disciplina
order by codigo_pro;

select * from disciplina
join professor on (codigo_pro = professor.codigo);
