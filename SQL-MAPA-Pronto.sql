CREATE SCHEMA Mapa_Faculdade;

use Mapa_Faculdade;

CREATE TABLE Campus (
    Cod_Campus int PRIMARY KEY auto_increment,
    CNPJ VARCHAR(30) not null,
    Rua VARCHAR(100),
    Bairro VARCHAR(45),
    Cidade VARCHAR(45),
    telefone VARCHAR(20) not null
);

CREATE TABLE Professor (
	Nome VARCHAR(70) not null,
    Rua VARCHAR(45),
    CPF VARCHAR(45) not null,
    Cidade VARCHAR(45),
    Cod_Professor INT PRIMARY KEY auto_increment,
    Bairro VARCHAR(45),
    telefone VARCHAR(20) not null,
    fk_Cod_Campus int not null
);

CREATE TABLE Turma (
    Nome VARCHAR(45) not null,
    Num_Alunos INT not null,
    Data_Fim Date not null,
    Data_Inicio Date not null,
    Cod_Turma int PRIMARY KEY auto_increment
);

CREATE TABLE Curso (
    Nome VARCHAR(45) not null,
    Cod_Curso int PRIMARY KEY auto_increment,
    Tipo_Formacao VARCHAR(45) not null,
    Periodo VARCHAR(45) not null,
    fk_Cod_Campus int not null
);

CREATE TABLE Disciplina (
    Carga_Horaria VARCHAR(20) not null,
    Cod_Disciplina INT PRIMARY KEY auto_increment,
    Descricao VARCHAR(200),
    Nome VARCHAR(45) not null,
    fk_Cod_Professor INT not null
);

CREATE TABLE Aluno (
    CPF VARCHAR(45) not null,
    Cidade VARCHAR(45),
    RA int PRIMARY KEY auto_increment,
    telefone VARCHAR(20) not null,
    Bairro VARCHAR(45),
    Rua VARCHAR(100),
    Nome VARCHAR(100) not null,
    Sexo char(1) not null,
    fk_Cod_Turma int not null,
    fk_Cod_Curso int not null
);

CREATE TABLE Hist_Escolar (
    Nota_atividade1 DECIMAL(2,1) not null,
    status varchar(30) not null,
    Nota_Atividade2 DECIMAL(2,1) not null,
    Cod_Hist int PRIMARY KEY auto_increment,
    faltas int not null,
    fk_Cod_Turma int NOT NULL,
    fk_Aluno_RA int NOT NULL,
    fk_Cod_Professor INT not null,
    fk_Cod_Disciplina INT not null,
    fk_Cod_Curso int not null
);

CREATE TABLE Controle_Chamada (
    Cod_Controle int PRIMARY KEY auto_increment,
    status_ativo boolean not null,
    fk_Cod_Turma int not null,
    fk_Aluno_RA int not null,
    fk_Cod_Curso int not null
);

CREATE TABLE Professor_Curso (
    fk_Cod_Professor INT not null,
    fk_Cod_Curso int not null
);

CREATE TABLE Professor_Turma (
    fk_Cod_Professor INT not null,
    fk_Cod_Turma int not null
);
 
ALTER TABLE Professor ADD CONSTRAINT FK_Professor_2
    FOREIGN KEY (fk_Cod_Campus)
    REFERENCES Campus (Cod_Campus)
    ON DELETE CASCADE;
 
ALTER TABLE Curso ADD CONSTRAINT FK_Curso_1
    FOREIGN KEY (fk_Cod_Campus)
    REFERENCES Campus (Cod_Campus)
    ON DELETE CASCADE;
 
ALTER TABLE Disciplina ADD CONSTRAINT FK_Disciplina_2
    FOREIGN KEY (fk_Cod_Professor)
    REFERENCES Professor (Cod_Professor)
    ON DELETE CASCADE;
 
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_2
    FOREIGN KEY (fk_Cod_Turma)
    REFERENCES Turma (Cod_Turma)
    ON DELETE CASCADE;

ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_3
    FOREIGN KEY (fk_Cod_Curso)
    REFERENCES Curso (Cod_Curso)
    ON DELETE CASCADE;
 
ALTER TABLE Hist_Escolar ADD CONSTRAINT FK_Hist_Escolar_2
    FOREIGN KEY (fk_Cod_Turma)
    REFERENCES Turma (Cod_Turma)
    ON DELETE RESTRICT;
 
ALTER TABLE Hist_Escolar ADD CONSTRAINT FK_Hist_Escolar_3
    FOREIGN KEY (fk_Aluno_RA)
    REFERENCES Aluno (RA)
    ON DELETE RESTRICT;
 
ALTER TABLE Hist_Escolar ADD CONSTRAINT FK_Hist_Escolar_4
    FOREIGN KEY (fk_Cod_Professor)
    REFERENCES Professor (Cod_Professor)
    ON DELETE RESTRICT;
 
ALTER TABLE Hist_Escolar ADD CONSTRAINT FK_Hist_Escolar_5
    FOREIGN KEY (fk_Cod_Disciplina)
    REFERENCES Disciplina (Cod_Disciplina)
    ON DELETE RESTRICT;
    
ALTER TABLE Hist_Escolar ADD CONSTRAINT FK_Hist_Escolar_6
    FOREIGN KEY (fk_Cod_Curso)
    REFERENCES Curso (Cod_Curso)
    ON DELETE RESTRICT;
 
ALTER TABLE Controle_Chamada ADD CONSTRAINT FK_Controle_Chamada_2
    FOREIGN KEY (fk_Cod_Turma)
    REFERENCES Turma (Cod_Turma)
    ON DELETE RESTRICT;
 
ALTER TABLE Controle_Chamada ADD CONSTRAINT FK_Controle_Chamada_3
    FOREIGN KEY (fk_Aluno_RA)
    REFERENCES Aluno (RA)
    ON DELETE RESTRICT;
    
ALTER TABLE Controle_Chamada ADD CONSTRAINT FK_Controle_Chamada_4
    FOREIGN KEY (fk_Cod_Curso)
    REFERENCES Curso (Cod_Curso)
    ON DELETE RESTRICT;
 
ALTER TABLE Professor_Curso ADD CONSTRAINT FK_Professor_Curso_1
    FOREIGN KEY (fk_Cod_Professor)
    REFERENCES Professor (Cod_Professor)
    ;
 
ALTER TABLE Professor_Curso ADD CONSTRAINT FK_Professor_Curso_2
    FOREIGN KEY (fk_Cod_Curso)
    REFERENCES Curso (Cod_curso)
    ;
 
ALTER TABLE Professor_Turma ADD CONSTRAINT FK_Professor_Turma_1
    FOREIGN KEY (fk_Cod_Professor)
    REFERENCES Professor (Cod_Professor)
    ;
 
ALTER TABLE Professor_Turma ADD CONSTRAINT FK_Professor_Turma_2
    FOREIGN KEY (fk_Cod_Turma)
    REFERENCES Turma (Cod_Turma)
    ;