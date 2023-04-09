-- Cria a tabela dos alunos.
CREATE TABLE TB_ALUNOS
 (Matricula_Aluno INT NOT null,
 Nome_Aluno VARCHAR(50), 
 Data_Matricula TIMESTAMP,
 Nome_Responsavel VARCHAR(50),
 Data_Nasc TIMESTAMP,
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
 FOREIGN KEY (ID_Salario) REFERENCES TB_SALARIOS(ID_Salario));														   ;

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
 Data_Nasc TIMESTAMP,
 ID_Departamento INT NOT null,
 ID_Salario INT NOT null,  
 PRIMARY KEY (ID_Contador),
 FOREIGN KEY (ID_Departamento) REFERENCES TB_DEPARTAMENTOS(ID_Departamento),
 FOREIGN KEY (ID_Salario) REFERENCES TB_SALARIOS(ID_Salario)); 

 -- Cria a tabela dos Gerentes.
Create table TB_GERENTES
 (ID_Gerente INT NOT null,
 Nome VARCHAR(30),
 Cpf VARCHAR(14),
 Endereco VARCHAR(100),
 Data_Nasc TIMESTAMP,
 ID_Departamento INT NOT null,
 ID_Salario INT NOT null, 
 PRIMARY KEY (ID_Gerente),
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
  
 
  INSERT INTO TB_ALUNOS (Matricula_Aluno, Nome_Aluno, Data_Matricula, Nome_Responsavel, Data_Nasc, Endereco_Aluno, Telefone, Cpf_Responsavel) VALUES 
(1, 'Cleiton  Silva', '2022-01-10 14:30:00', 'Maria Silva', '2008-05-10 00:00:00', 'Rua das Flores, 123', '98854331', '123.874.778-55'),
(2, 'Maria da Silva Santos', '2022-01-12 09:00:00', 'José Santos', '2009-03-12 00:00:00', 'Rua dos Pássaros, 456', '995416238', '222.222.222-22'),
(3, 'Carlos Rodrigues', '2022-01-15 13:15:00', 'Ana Rodrigues', '2007-06-15 00:00:00', 'Avenida Ricardo Moura, 789', '999999997', '333.333.333-33'),
(4, 'Ana Oliveira', '2022-01-17 10:30:00', 'Paulo Oliveira', '2008-11-17 00:00:00', 'Rua dos Jardins, 1011', '999999996', '444.444.444-44'),
(5, 'Lucas Costa', '2022-01-20 14:00:00', 'Marta Costa', '2007-01-20 00:00:00', 'Rua dos Sonhos, 1213', '999999995', '555.555.555-55'),
(6, 'Luana Pereira', '2022-01-22 16:45:00', 'Fernando Pereira', '2009-04-22 00:00:00', 'Avenida dos Ventos, 1415', '999999994', '666.666.666-66'),
(7, 'Fábio Souza', '2022-01-25 08:30:00', 'Tatiana Souza', '2008-07-25 00:00:00', 'Rua das Oliveiras, 1617', '999999993', '777.777.777-77'),
(8, 'Larissa Oliveira', '2022-01-28 15:00:00', 'Pedro Oliveira', '2007-03-28 00:00:00', 'Avenida das Águas, 1819', '999999992', '888.888.888-88'),
(9, 'Pedro Rodrigues', '2022-01-30 11:15:00', 'Luciana Rodrigues', '2008-05-30 00:00:00', 'Rua Uranos, 2021', '999999991', '999.999.999-99'),
(10, 'Tatiane Costa', '2022-02-02 14:45:00', 'Sérgio Costa', '2009-02-02 00:00:00', 'Avenida Kenedy, 2223', '999999990', '000.000.000-00'),
(11, 'Larissa Silva', '2022-02-11 14:35:00', 'Luciana Silva', '2008-05-28 00:00:00', 'Rua das Flores, 123', '998887777', '111.222.333-44'),
(12, 'Lucas Santos', '2022-03-15 10:20:00', 'Marcela Santos', '2009-11-03 00:00:00', 'Rua do Sol, 456', '988886666', '222.333.444-55'),
(13, 'Rafaela Oliveira', '2022-03-18 16:45:00', 'Mariana Oliveira', '2007-09-21 00:00:00', 'Av. Central, 789', '997778888', '333.444.555-66'),
(14, 'Gabriel Costa', '2022-04-02 09:10:00', 'Fernanda Costa', '2006-12-10 00:00:00', 'Rua do Mar, 987', '988889999', '444.555.666-77'),
(15, 'Mariana Lima', '2022-04-05 13:25:00', 'Isabela Lima', '2008-01-17 00:00:00', 'Rua da Praia, 654', '996665555', '555.666.777-88'),
(16, 'Bruno Ferreira', '2022-05-11 18:30:00', 'Cristina Ferreira', '2009-04-29 00:00:00', 'Rua dos Passarinhos, 321', '988887777', '666.777.888-99'),
(17, 'Ana Carolina Souza', '2022-06-03 11:05:00', 'Juliana Souza', '2006-07-23 00:00:00', 'Rua da Montanha, 147', '999998888', '777.888.999-00'),
(18, 'Fernando Santos', '2022-06-15 14:55:00', 'Mariana Santos', '2007-10-12 00:00:00', 'Av. das Flores, 258', '997777888', '888.999.000-11'),
(19, 'Camila Oliveira', '2022-06-28 09:45:00', 'Patricia Oliveira', '2008-09-06 00:00:00', 'Rua do Céu, 753', '999998888', '999.000.111-22'),
(20, 'Gustavo Silva', '2022-07-10 16:15:00', 'Amanda Silva', '2009-05-19 00:00:00', 'Rua dos Coqueiros, 159', '988887777', '000.111.222-33');

INSERT INTO TB_FACILITADORES (ID_Facilitador, Materia, Nome_Facilitador, Endereco, Telefone, Horario_de_Trabalho, ID_Salario, ID_Departamento) VALUES
(1, 'Kanban e Scrum', 'Pedro Gomes', 'Rua 4, 456', '95553159', '8:00-17:00', 1, 1),
(2, 'Python e SQL', 'Thomas Albuquerque dos Santos', 'Rua Beija-Flor, 46', '975844312', '8:00-17:00', 2, 1),
(3, 'JAVA', 'Agatha Marx da Silva', 'Rua Fresno, 98', '976581292', '8:00-17:00', 3, 1),
(4, 'Comunicação e Informação', 'Edson Ramos', 'Rua Geremias, 77', '931588829', '8:00-17:00', 1, 1);

INSERT INTO TB_DEPARTAMENTOS (ID_Departamento, Nome_Dep, Descricao)VALUES 
(1, 'Departamento pedagógico e educacional', 'Departamento responsável pelo corpo de doscentes e  do desenvolvimento e planejamento estratégico das ações vinculadas à proposta pedagógica'),
(2,'Departamento Financeiro','Departamento responável pelo controle de finanças e pagamentos'),
(3,'Departamento Administrativo','Responsável pelo controle e administração dos outros departamentos, assim como documentação');
  
INSERT INTO TB_CURSOS (ID_Curso, Nome_Curso, Descricao_Curso, Total_Horas, horario)
VALUES (1, 'Curso em Análise de dados', 'Descrição do curso 1', '100 horas', 'Segunda-feira, 18:00-22:00')  

INSERT INTO TB_MODULOS (ID_Modulo, nome, descricao)
VALUES (1, 'Módulo 1', 'Descrição do módulo 1');

INSERT INTO TB_CONTADORES (ID_contador, nome, cpf, endereco, data_nasc, ID_Departamento, ID_Salario)
VALUES (1, 'José', '98765432100', 'Rua 3, 789', '1980-01-01', 1, 2);

INSERT INTO TB_GERENTES (ID_Gerente, nome, cpf, endereco, data_nasc, ID_Departamento, ID_Salario)
VALUES (1, 'Ana', '11122233344', 'Rua 4, 1010', '1990-01-01', 2, 3);

INSERT INTO TB_SALARIOS (ID_SALARIO, Valor)
VALUES (1, 1000.00);

INSERT INTO TB_ALUNOS_CURSOS (Matricula_Aluno, ID_Curso)
VALUES (1, 1);

INSERT INTO TB_MODULOS_FACILITADORES (ID_Facilitador, ID_Modulo)
VALUES (1, 1);
 
INSERT INTO TB_CURSOS_MODULOS (ID_Curso, ID_Modulo)
VALUES (1, 1);

INSERT INTO TB_CONTADORES_SALARIOS (ID_Contador, ID_Salario)
VALUES (1, 1); 
  
  
  
  
