CREATE DATABASE alura;

CREATE TABLE academico.aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE academico.categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE academico.curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES academico.categoria(id)
);

CREATE TABLE academico.aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES academico.aluno(id),
	curso_id INTEGER NOT NULL REFERENCES academico.curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES ('Vinicius', 'Dias', '1990-03-04');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES ('Diego', 'Silva', '1995-08-08');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES ('Rodrigo', 'Santos', '1999-10-10');
INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES ('Ivan', 'Dias', '1989-05-09');

INSERT INTO categoria (nome) VALUES ('FRONT-END');
INSERT INTO categoria (nome) VALUES ('BACK-END');

INSERT INTO curso (nome, categoria_id) VALUES ('CSS', 1);
INSERT INTO curso (nome, categoria_id) VALUES ('HTML', 1);
INSERT INTO curso (nome, categoria_id) VALUES ('PHP', 2);
INSERT INTO curso (nome, categoria_id) VALUES ('Java', 2);

INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 1);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (1, 2);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (2, 3);
INSERT INTO aluno_curso (aluno_id, curso_id) VALUES (3, 4);
