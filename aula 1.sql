create table departamento(
	codigo serial primary key,
	nome varchar(50) not null
);
create table professor(
	codigo serial primary key,
	nome varchar(50) not null,
	departamento_codigo integer not null,
	foreign key (departamento_codigo) references departamento (codigo)
);
create table disciplina(
	codigo serial primary key,
	nome varchar(50) not null,
	ementa varchar not null,
	credito int not null,
	departamento_codigo integer not null,
	professor_codigo integer not null,
	foreign key (departamento_codigo) references departamento (codigo),
	foreign key (professor_codigo) references professor (codigo)
);
create table pre_requisito(
	codigo serial primary key,
	disciplina_codigo int not null,
	foreign key (disciplina_codigo) references disciplina (codigo)
);




--drop table departamento,professor,disciplina,disciplina;
