-- Cria a tabela dos alunos.
CREATE TABLE TB_ALUNOS
 (Matricula_Aluno INT NOT null,
 Nome_Aluno VARCHAR(50), 
 Data_Matricula TIMESTAMP,
 Nome_Responsavel VARCHAR(50),
 Data_Nasc DATE,
 Endereco_Aluno VARCHAR(100),
 Telefone VARCHAR(9),
 Cpf_Responsavel VARCHAR(14),
 PRIMARY KEY(Matricula_aluno));

-- Cria a tabela dos facilitadores.
CREATE TABLE TB_FACILITADORES
 (ID_Facilitador INT NOT null,
 Nome_Facilitador VARCHAR(50),
 Materia VARCHAR(50),
 Endereco VARCHAR(100),
 Telefone VARCHAR(9),
 Horario_de_Trabalho VARCHAR(10),
 ID_Salario INT NOT null,
 ID_Departamento INT NOT null,
 PRIMARY KEY(ID_Facilitador),
 FOREIGN KEY (ID_Departamento) REFERENCES TB_DEPARTAMENTOS(ID_Departamento),
 FOREIGN KEY (ID_Salario) REFERENCES TB_SALARIOS(ID_Salario));												

 -- Cria a tabela dos departamentos.
CREATE TABLE TB_DEPARTAMENTOS
(ID_Departamento INT NOT null,
 Nome_Dep VARCHAR(50),
 Descricao VARCHAR(150),
PRIMARY KEY (ID_Departamento));

-- Cria a tabela dos cursos.
CREATE TABLE TB_CURSOS
 (ID_Curso INT NOT null,
 Nome_Curso VARCHAR(50),
 Descricao_Curso VARCHAR(255),
 Total_Horas VARCHAR(20),
 horario VARCHAR(25),
 PRIMARY KEY(ID_Curso));

-- Cria a tabela dos módulos.
CREATE TABLE TB_MODULOS
 (ID_Modulo INT NOT null,
 Nome_Modulo VARCHAR(50),
 Descricao VARCHAR(255),
 PRIMARY KEY (ID_Modulo));

 -- Cria a tabela dos Contadores.
CREATE TABLE TB_CONTADORES
 (ID_contador INT NOT null,
 Nome VARCHAR(30),
 Cpf VARCHAR(14),
 Endereco VARCHAR(100),
 Data_Nasc DATE,
 ID_Departamento INT NOT null,
 ID_Salario INT NOT null,  
 PRIMARY KEY (ID_Contador),
 FOREIGN KEY (ID_Departamento) REFERENCES TB_DEPARTAMENTOS(ID_Departamento),
 FOREIGN KEY (ID_Salario) REFERENCES TB_SALARIOS(ID_Salario)); 

 -- Cria a tabela dos Administradores.
Create table TB_ADMINISTRADORES
 (ID_Administrador INT NOT null,
 Nome VARCHAR(30),
 Cpf VARCHAR(14),
 Endereco VARCHAR(100),
 Data_Nasc DATE,
 ID_Departamento INT NOT null,
 ID_Salario INT NOT null, 
 PRIMARY KEY (ID_Administrador),
 FOREIGN KEY (ID_Departamento) REFERENCES TB_DEPARTAMENTOS(ID_Departamento),
 FOREIGN KEY (ID_Salario) REFERENCES TB_SALARIOS(ID_Salario));
 
-- Cria a tabela dos Salários.  
CREATE TABLE TB_SALARIOS
  (ID_Salario INT NOT null,
  Valor DECIMAL(10,2),
  PRIMARY KEY (ID_Salario));
  
-- Cria tabela relacional entre alunos e cursos.  
CREATE TABLE TB_ALUNOS_CURSOS
 (Matricula_Aluno INT NOT NULL,
  ID_Curso INT NOT NULL,
  PRIMARY KEY (Matricula_Aluno, ID_Curso),
  FOREIGN KEY (Matricula_Aluno) REFERENCES TB_ALUNOS(Matricula_Aluno),
  FOREIGN KEY (ID_Curso) REFERENCES TB_CURSOS(ID_Curso));

-- Cria tabela relacional entre modulos e facilitadores.  
CREATE TABLE TB_MODULOS_FACILITADORES
(ID_Facilitador INT NOT NULL,
  ID_Modulo INT NOT NULL,
  PRIMARY KEY (ID_Facilitador, ID_Modulo),
  FOREIGN KEY ( ID_Facilitador) REFERENCES TB_FACILITADORES(ID_Facilitador),
  FOREIGN KEY (ID_Modulo) REFERENCES TB_MODULOS(ID_Modulo));

-- Cria tabela relacional entre cursos e modulos.  
CREATE TABLE TB_CURSOS_MODULOS
( ID_Curso INT NOT NULL,
  ID_Modulo INT NOT NULL,
  PRIMARY KEY (ID_Curso, ID_Modulo),
  FOREIGN KEY ( ID_Curso) REFERENCES TB_CURSOS(ID_Curso),
  FOREIGN KEY (ID_Modulo) REFERENCES TB_MODULOS(ID_Modulo)
);

-- Cria tabela relacional entre contadores e salarios.  
 CREATE TABLE TB_CONTADORES_SALARIOS
 (ID_Contador INT NOT NULL,
 ID_Salario INT NOT NULL,
 PRIMARY KEY (ID_Contador, ID_Salario),
 FOREIGN KEY (ID_Contador) REFERENCES TB_Contadores(ID_Contador),
 FOREIGN KEY (ID_Salario ) REFERENCES TB_SALARIOS(ID_Salario));
  
 --Faz os inserts na tabela alunos.
  INSERT INTO TB_ALUNOS (Matricula_Aluno, Nome_Aluno, Data_Matricula, Nome_Responsavel, Data_Nasc, Endereco_Aluno, Telefone, Cpf_Responsavel) VALUES 
(1, 'Diego Castro Araujo', '2022-01-10 14:30:00', 'Maria Castro Araujo', '2008-05-10 00:00:00', 'Rua Joazeiro, 1337', '987543310', '772.181.264-05'),
(2, 'Matias Valente Ramos', '2022-01-12 09:00:00', 'José Vanlente Ramos', '2009-03-12 00:00:00', 'Rua Boa Vista, 1210', '995416238', '254.151.527-84'),
(3, 'Carlos Rodrigues', '2022-01-15 13:15:00', 'Ana Rodrigues', '2007-06-15 00:00:00', 'Avenida Ricardo Moura, 789', '985241201', '980.841.148-75'),
(4, 'Ana Oliveira', '2022-01-17 10:30:00', 'Paulo Oliveira', '2008-11-17 00:00:00', 'Rua dos Jardins, 1011', '986958520', '882.135.590-02'),
(5, 'Lucas Costa', '2022-01-20 14:00:00', 'Marta Costa', '2007-01-20 00:00:00', 'Rua Santo Agostinho, 1851', '979635410', '394.637.113-25'),
(6, 'Tânia Almeida Pereira', '2022-01-22 16:45:00', 'Fernando Almeida Pereira', '2009-04-22 00:00:00', 'Rua Cassiano Lemos, 1512', '979867520', '157.317.275-89'),
(7, 'Rayssa Saraiva Narvais', '2022-01-25 08:30:00', 'Tatiana Saraiva Narvais', '2008-07-25 00:00:00', 'Rua das Oliveiras, 1617', '986947418', '203.472.613-88'),
(8, 'Larissa Oliveira', '2022-01-28 15:00:00', 'Pedro Oliveira', '2007-03-28 00:00:00', 'Avenida das Águas, 1819', '983432312', '065.855.827-72'),
(9, 'Pedro Rodrigues', '2022-01-30 11:15:00', 'Luciana Rodrigues', '2008-05-30 00:00:00', 'Rua Uranos, 2021', '988484578', '422.554.307-20'),
(10, 'Nicole Lima Oliveira', '2022-02-02 14:45:00', 'Sérgio Lima Oliveira', '2009-02-02 00:00:00', 'Avenida Kenedy, 2223', '991708564', '787.585.442-32'),
(11, 'Carlos Carvalho Souza', '2022-02-11 14:35:00', 'Luciana Carvalho Souza', '2008-05-28 00:00:00', 'Rua Belo Horizonte, 441', '979854731', '665.360.867-08'),
(12, 'Lucas Santos', '2022-03-15 10:20:00', 'Marcela Santos', '2009-11-03 00:00:00', 'Rua João Paulo VI, 255', '992537456', '762.863.589-00'),
(13, 'Rafaela Oliveira', '2022-03-18 16:45:00', 'Mariana Oliveira', '2007-09-21 00:00:00', 'Av. Central, 789', '972488244', '162.364.056-38'),
(14, 'Gabriel Costa', '2022-04-02 09:10:00', 'Fernanda Costa', '2006-12-10 00:00:00', 'Rua Geraldo Macedo, 32', '993574528', '429.903.573-94'),
(15, 'Lara Barbosa Gomes', '2022-04-05 13:25:00', 'Isabela Barbosa Gomes', '2008-01-17 00:00:00', 'Rua Capitão Vieira, 1133', '999956812', '123.557.633-72'),
(16, 'Luiz Santos Goncalves', '2022-05-11 18:30:00', 'Cristina Santos Goncalves', '2009-04-29 00:00:00', 'Rua Santa Lúcia, 1864', '985530139', '193.548.163-04'),
(17, 'Ana Carolina Souza', '2022-06-03 11:05:00', 'Juliana Souza', '2006-07-23 00:00:00', 'Rua Júlio Ribeiro, 1461', '982699078', '468.827.348-79'),
(18, 'Fernando Santos', '2022-06-15 14:55:00', 'Mariana Santos', '2007-10-12 00:00:00', 'Av. das Flores, 258', '983134598', '630.631.424-50'),
(19, 'Camila Oliveira', '2022-06-28 09:45:00', 'Patricia Oliveira', '2008-09-06 00:00:00', 'Rua Marechal Deodoro, 863', '988398714', '876.644.351-29'),
(20, 'Mateus Ferreira Alves', '2022-07-10 16:15:00', 'Amanda Ferreira Alves', '2009-05-19 00:00:00', 'Rua Santo Antônio, 1175', '975453511', '839.022.928-57');

 --Faz os inserts na tabela facilitadores.
INSERT INTO TB_FACILITADORES (ID_Facilitador, Materia, Nome_Facilitador, Endereco, Telefone, Horario_de_Trabalho, ID_Salario, ID_Departamento) VALUES
(1, 'Kanban e Scrum', 'Pedro Gomes', 'Rua 4, 456', '95553159', '8:00-17:00', 1, 1),
(2, 'Python e SQL', 'Thomas Albuquerque dos Santos', 'Rua Beija-Flor, 46', '975844312', '8:00-17:00', 2, 1),
(3, 'JAVA', 'Agatha Marx da Silva', 'Rua Fresno, 98', '976581292', '8:00-17:00', 3, 1),
(4, 'Comunicação e Informação', 'Edson Ramos', 'Rua Geremias, 77', '931588829', '8:00-17:00', 1, 1);

 --Faz os inserts na tabela departamentos.
INSERT INTO TB_DEPARTAMENTOS (ID_Departamento, Nome_Dep, Descricao)VALUES 
(1, 'Departamento pedagógico e educacional', 'Departamento responsável pelo corpo de doscentes e  do desenvolvimento e planejamento estratégico das ações vinculadas à proposta pedagógica'),
(2,'Departamento Financeiro','Departamento responável pelo controle de finanças e pagamentos'),
(3,'Departamento Administrativo','Responsável pelo controle e administração dos outros departamentos, assim como documentação');
  
 --Faz os inserts na tabela cursos.
INSERT INTO TB_CURSOS (ID_Curso, Nome_Curso, Descricao_Curso, Total_Horas, horario) VALUES 
(1, 'Curso em Análise de dados', 'Curso com foco na linguagem Python e metodologias ágeis.', '600 horas', '8:00-12:00'),
(2,'Curso de Formação JAVA','Curso com foco em JAVA e desenvolvimento de soft skills.', '700 horas', '13:00-17:00');

 --Faz os inserts na tabela módulos.
INSERT INTO TB_MODULOS (ID_Modulo, nome_modulo , descricao) VALUES 
(1, 'Python ', 'Principais Noções em Python.'),
(2,'SQL', 'Criação de bancos e pesquisas utilizando as Querys.'),
(3,'Metodologias ágeis','Noções e aplicações das principais metodologias ágeis em alta no mercado.'),
(4,'JAVA','Principais Noções em Python.'),
(5,'Comunicação e informação','Boas práticas na comunicação e tratamento de informações.');

 --Faz os inserts na tabela contadores.
INSERT INTO TB_CONTADORES (ID_contador, nome, cpf, endereco, data_nasc, ID_Departamento, ID_Salario) VALUES 
(1, 'Carlos Magno', '966.787.231-81', 'Rua Veigas, 19', '1978-03-01', 2, 4),
(2, 'Jenifer Souza Mello','186.227.454-87', 'Rua Ricardo Soares, 123', '1989-04-12', 2, 4);

-- --Faz os inserts na tabela administradores.
INSERT INTO TB_ADMINISTRADORES (ID_Administrador, nome, cpf, endereco, data_nasc, ID_Departamento, ID_Salario) VALUES 
(1, 'Ana Paula Gomes', '553.124.787-23', 'Rua Apollo, 1010', '1993-01-09', 3, 5);

 --Faz os inserts na tabela salários.
INSERT INTO TB_SALARIOS (ID_SALARIO, Valor)VALUES 
(1,2600.00),
(2,3300.00),
(3,3600.00),
(4,3800.00),
(5,6300.00);

 --Faz a relação entra as tabelas Alunos e Cursos.
INSERT INTO TB_ALUNOS_CURSOS (Matricula_Aluno, ID_Curso) VALUES 
(1, 1),
(2, 2),
(3, 1),
(4, 2),
(5, 2),
(6, 1),
(7, 2),
(8, 2),
(9, 1),
(10,1),
(11,1),
(12,1),
(13,2),
(14,1),
(15,2),
(16,1),
(17,2),
(18,2),
(19,1),
(20,1);

--Faz a relação entra as tabelas Facilitadores e Módulos.
INSERT INTO TB_MODULOS_FACILITADORES (ID_Facilitador, ID_Modulo)VALUES 
(1, 3),
(2, 1),
(2, 2),
(3, 4),
(4, 5);

 --Faz a relação entra as tabelas Cursos e Módulos.
INSERT INTO TB_CURSOS_MODULOS (ID_Curso, ID_Modulo) VALUES 
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5);

--Faz a relação entra as tabelas Contador e Salario.
INSERT INTO TB_CONTADORES_SALARIOS (ID_Contador, ID_Salario) VALUES 
(1, 1), 
(1, 2),  
(1, 3),  
(1, 4),
(1, 5),
(2, 1), 
(2, 2),  
(2, 3),  
(2, 4),
(2, 5);


-- Perguntas sobre as informações do banco de dados:

-- 1. Selecionar a quantidade total de estudantes cadastrados no banco;

SELECT COUNT(*) FROM TB_ALUNOS;


-- 2. Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados (adicionando também os módulos onde estão);
SELECT TB_ALUNOS.Nome_Aluno, TB_CURSOS.Nome_Curso, TB_MODULOS.Nome_Modulo
FROM TB_ALUNOS_CURSOS
JOIN TB_ALUNOS ON TB_ALUNOS_CURSOS.Matricula_Aluno = TB_ALUNOS.Matricula_Aluno
JOIN TB_CURSOS ON TB_ALUNOS_CURSOS.ID_Curso = TB_CURSOS.ID_Curso
JOIN TB_CURSOS_MODULOS ON TB_CURSOS.ID_Curso = TB_CURSOS_MODULOS.ID_Curso
JOIN TB_MODULOS ON TB_CURSOS_MODULOS.ID_Modulo = TB_MODULOS.ID_Modulo;


-- 3. Selecionar quais pessoas facilitadoras atuam em mais de uma turma.
SELECT f.Nome_Facilitador, c.Nome_Curso
FROM TB_FACILITADORES f
JOIN TB_MODULOS_FACILITADORES mf ON f.ID_Facilitador = mf.ID_Facilitador
JOIN TB_MODULOS m ON mf.ID_Modulo = m.ID_Modulo
JOIN TB_CURSOS_MODULOS cm ON m.ID_Modulo = cm.ID_Modulo
JOIN TB_CURSOS c ON cm.ID_Curso = c.ID_Curso
WHERE f.ID_Facilitador IN (
    SELECT f2.ID_Facilitador
    FROM TB_FACILITADORES f2
    JOIN TB_MODULOS_FACILITADORES mf2 ON f2.ID_Facilitador = mf2.ID_Facilitador
    JOIN TB_MODULOS m2 ON mf2.ID_Modulo = m2.ID_Modulo
    JOIN TB_CURSOS_MODULOS cm2 ON m2.ID_Modulo = cm2.ID_Modulo
    GROUP BY f2.ID_Facilitador
    HAVING COUNT(DISTINCT cm2.ID_Curso) > 1
)
ORDER BY f.Nome_Facilitador, c.Nome_Curso;


-- 4. Selecionar quais alunos possuem mais de 15 anos de idade.
SELECT Nome_Aluno, Data_Nasc, DATE_PART('year', AGE(CURRENT_DATE, Data_Nasc)) as Idade
FROM TB_ALUNOS
WHERE DATE_PART('year', AGE(CURRENT_DATE, Data_Nasc)) > 15;


-- 5. Selecionar quais módulos o curso de análise de dados e JAVA possuem.
SELECT c.Nome_Curso, m.Nome_Modulo
FROM TB_CURSOS c
INNER JOIN TB_CURSOS_MODULOS cm ON c.ID_Curso = cm.ID_Curso
INNER JOIN TB_MODULOS m ON cm.ID_Modulo = m.ID_Modulo
WHERE c.Nome_Curso IN ('Curso em Análise de dados', 'Curso de Formação JAVA');


-- 6. Selecionar a média dos facilitadores.
SELECT AVG(s.Valor) AS Media_Salario
FROM TB_FACILITADORES f
JOIN TB_SALARIOS s ON f.ID_Salario = s.ID_Salario;


