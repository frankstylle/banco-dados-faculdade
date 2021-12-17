/* os 4 campus */
INSERT INTO CAMPUS(cnpj, telefone)
VALUES('0000000001', '11 1111-1111');
INSERT INTO CAMPUS(cnpj, telefone)
VALUES('0000000002', '22 2222-2222');
INSERT INTO CAMPUS(cnpj, telefone)
VALUES('0000000003', '33 3333-3333');
INSERT INTO CAMPUS(cnpj, telefone)
VALUES('0000000004', '44 4444-4444');

/* adicionando cursos */
INSERT INTO Curso(Nome, tipo_Formacao, periodo, FK_cOD_cAMPUS)
VALUES('Analise e Desenvolvimento de softwares', 'Graduacao', 'VESPERTINO', 1);
INSERT INTO Curso(Nome, tipo_Formacao, periodo, FK_cOD_cAMPUS)
VALUES('Marketing', 'Especialização', 'MATUTINO', 2);
INSERT INTO Curso(Nome, tipo_Formacao, periodo, FK_cOD_cAMPUS)
VALUES('Administração', 'Mestrado', 'NOTURNO',3);
INSERT INTO Curso(Nome, tipo_Formacao, periodo, FK_cOD_cAMPUS)
VALUES('Agronomia', 'Doutorado', 'MATUTINO', 4);

/* INSERINDO OS PROFESSORES */ 
INSERT INTO Professor(Nome, cpf, telefone, fk_cod_campus)
VALUES('Joao Ribeiro (ADS)', '5456456456-44', '00-0000-0001', '1');
INSERT INTO Professor(Nome, cpf, telefone, fk_cod_campus)
VALUES('Luana Tales (Marke..)', '5456456456-44', '00-0000-0002', '2');
INSERT INTO Professor(Nome, cpf, telefone, fk_cod_campus)
VALUES('Lucas Gabriel (Admini..)', '5456456456-44', '00-0000-0003', '3');
INSERT INTO Professor(Nome, cpf, telefone, fk_cod_campus)
VALUES('Ana Pereira (Agron..)', '5456456456-44', '00-0000-0004', '4');

/* RELACIONANDO PROFESSOR A CURSO DE MUITOS PARA MUITOS */
SELECT * FROM PROFESSOR_CURSO;
INSERT INTO professor_curso(fk_Cod_Professor, fk_Cod_curso) values(1, 1);
INSERT INTO professor_curso(fk_Cod_Professor, fk_Cod_curso) values(2, 2);
INSERT INTO professor_curso(fk_Cod_Professor, fk_Cod_curso) values(3, 3);
INSERT INTO professor_curso(fk_Cod_Professor, fk_Cod_curso) values(4, 4); 

/* inserindo disciplinas AOS PROFESSORES*/
select * from disciplina;
INSERT INTO disciplina(nome, carga_horaria, fk_Cod_professor) 
				VALUES('Banco de dados', 1, 1);
INSERT INTO disciplina(nome, carga_horaria, fk_Cod_professor) 
				VALUES('Google ads', 2, 2);
INSERT INTO disciplina(nome, carga_horaria, fk_Cod_professor) 
				VALUES('Leis Trabalhistas', 3, 3);
INSERT INTO disciplina(nome, carga_horaria, fk_Cod_professor) 
				VALUES('Soluçoes de Plantio', 4, 4);

/* inserindo as turmas */
select * from turma;
INSERT INTO Turma(Nome, Data_Inicio, Data_Fim, num_Alunos)
VALUES('Classe (ADS)', '2021/10/20', '2024/10/20', '30'); 
INSERT INTO Turma(Nome, Data_Inicio, Data_Fim, num_Alunos)
VALUES('Classe (Marke..)', '2021/10/20', '2024/10/20', '38');
INSERT INTO Turma(Nome, Data_Inicio, Data_Fim, num_Alunos)
VALUES('Classe (Adminis...)', '2021/10/20', '2024/10/20', '28');
INSERT INTO Turma(Nome, Data_Inicio, Data_Fim, num_Alunos)
VALUES('Classe (Agron...)', '2021/10/20', '2024/10/20', '27'); 
          
/* RELACIONANDO TURMA A PROFESSOR DE MUITOS PARA MUITOS */
SELECT * FROM PROFESSOR_TURMA;
INSERT INTO professor_turma(fk_Cod_Professor, fk_Cod_turma) values(1, 1);
INSERT INTO professor_turma(fk_Cod_Professor, fk_Cod_turma) values(2, 2); 
INSERT INTO professor_turma(fk_Cod_Professor, fk_Cod_turma) values(3, 3); 
INSERT INTO professor_turma(fk_Cod_Professor, fk_Cod_turma) values(4, 4);  

/*  Inserindo os alunos */ 
INSERT INTO Aluno(cpf, telefone, nome, sexo, fk_Cod_Turma, fk_Cod_Curso) 
		  VALUES ('000000000-01','43 99695-9869', 'Matheus willian de oliveira santos', 'M', 1, 1);
INSERT INTO Aluno(cpf, telefone, nome, sexo, fk_Cod_Turma, fk_Cod_Curso) 
		  VALUES ('000000000-02','43 99898-4589', 'Luana Maria Souza', 'F', 2, 2);
INSERT INTO Aluno(cpf, telefone, nome, sexo, fk_Cod_Turma, fk_Cod_Curso) 
		  VALUES ('000000000-03','43 97458-8578', 'Carlos caic santos', 'M', 3, 3);
INSERT INTO Aluno(cpf, telefone, nome, sexo, fk_Cod_Turma, fk_Cod_Curso) 
		  VALUES ('000000000-04','43 92536-4587', 'gabriela fernanda dias', 'F', 4, 4);
          
/* APOS CADASTRO DE ALUNO CONCLUIR INSERINDO-OS NA LISTA DE ATIVO */ 
SELECT * FROM CONTROLE_CHAMADA;
INSERT INTO CONTROLE_CHAMADA(fk_cod_turma, fk_aluno_ra, fk_cod_curso, status_ativo)
					  VALUES(1, 1, 1, true);
INSERT INTO CONTROLE_CHAMADA(fk_cod_turma, fk_aluno_ra, fk_cod_curso, status_ativo)
					  VALUES(2, 2, 2, true);
INSERT INTO CONTROLE_CHAMADA(fk_cod_turma, fk_aluno_ra, fk_cod_curso, status_ativo)
					  VALUES(3, 3, 3, true);
INSERT INTO CONTROLE_CHAMADA(fk_cod_turma, fk_aluno_ra, fk_cod_curso, status_ativo)
					  VALUES(4, 4, 4, true);

/* CRIANDO HISTORICO DE RENDIMENTO ACADEMICO */
SELECT * FROM HIST_eSCOLAR;
INSERT INTO HIST_ESCOLAR(Nota_atividade1, nota_atividade2, faltas, status, fk_cod_turma, fk_aluno_ra, fk_cod_professor, fk_cod_disciplina, fk_cod_curso)
	 VALUES(8.5, 6.4, 3 ,true, 1, 1, 1, 1, 1); 
INSERT INTO HIST_ESCOLAR(Nota_atividade1, nota_atividade2, faltas, status, fk_cod_turma, fk_aluno_ra, fk_cod_professor, fk_cod_disciplina, fk_cod_curso)
	 VALUES(5.5, 5.8, 15 , false, 2, 2, 2, 2, 2);
INSERT INTO HIST_ESCOLAR(Nota_atividade1, nota_atividade2, faltas, status, fk_cod_turma, fk_aluno_ra, fk_cod_professor, fk_cod_disciplina, fk_cod_curso)
	 VALUES(9.0, 9.4, 2 ,true, 3, 3, 3, 3, 3);
INSERT INTO HIST_ESCOLAR(Nota_atividade1, nota_atividade2, faltas, status, fk_cod_turma, fk_aluno_ra, fk_cod_professor, fk_cod_disciplina, fk_cod_curso)
	 VALUES(2.5, 3.0, 20 , false, 4, 4, 4, 4, 4);