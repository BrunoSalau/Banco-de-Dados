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
