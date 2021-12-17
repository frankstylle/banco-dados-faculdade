select * from campus;
select * from curso;
select * from professor;
select * from professor_curso;
select * from disciplina;
select * from turma;
select * from professor_turma;
select * from aluno;
select * from controle_chamada;
select * from hist_escolar;

/* pesquisa informação completa */
 SELECT A.nome AS Aluno, C.nome AS Curso, T.nome AS Turma, P.nome AS Professor, D.nome AS Disciplina, nota_atividade1 as 'Nota Atividade 1', nota_atividade2 as 'Nota Atividade 2', faltas AS Faltas, status as RESULTADO
 FROM Hist_Escolar H
 INNER JOIN Aluno A
 ON H.fk_aluno_ra = A.ra
 INNER JOIN Curso C
 ON H.fk_Cod_Curso = C.Cod_Curso
 INNER JOIN Turma T
 ON H.fk_Cod_turma = T.Cod_Turma
 INNER JOIN Professor P
 ON H.fk_Cod_professor = P.COd_Professor
 INNER JOIN Disciplina D
 ON H.fk_Cod_Disciplina = D.Cod_Disciplina;
 

