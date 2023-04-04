CREATE TABLE TB_ALUNOS
(Matricula_Aluno INT NOT null,
Data_Matricula DATE,
Nome_Aluno VARCHAR(50),
Nome_Responsavel VARCHAR(50),
Data_Nasc DATE,
Endereco_Aluno VARCHAR(100),
Telefone VARCHAR(9),
Cpf_Responsavel VARCHAR(14),
PRIMARY KEY(Matricula_aluno));

CREATE TABLE TB_FACILITADORES
(ID_Facilitador INT NOT null,
Materia VARCHAR(50),
Nome_Facilitadores  VARCHAR(50),
Endereco VARCHAR(100),
Telefone VARCHAR(9),
Horario_de_Trabalho VARCHAR(10),
Data_de_Inicio DATE,
PRIMARY KEY(ID_Facilitador));

CREATE TABLE TB_DEP_FINANCEIRO
(ID_Colaborador_Fin INT NOT null,
Cargo VARCHAR(50),
Nome VARCHAR(50),
Enderco VARCHAR(100),
Telefone VARCHAR(9),
Horario_de_trabalho VARCHAR(10),
Data_de_Inicio DATE,
PRIMARY KEY(ID_Colaborador_Fin));
 
CREATE TABLE TB_DEP_ADMINISTRATIVO
(ID_Colaborador_Adm INT NOT null,
Cargo VARCHAR(50),
Nome VARCHAR(50),
Endereco VARCHAR(100),
Telefone VARCHAR(9),
Horario_de_trabalho VARCHAR(10),
Data_de_Inicio DATE,
PRIMARY KEY (ID_Colaborador_Adm));
 
 -- TROCA DE BOLETOS EM ABERTO PARA SITUAÇÃO DOS BOLETOS E PERGUNTAR SOBRE PAGAMENTOS EFETUADOS (ALTERAR PARA HISTORICO OU ALGO ASSIM)
CREATE TABLE TB_CONTROLE_PGT_BOLETOS
(ID_contr_pgtos INT NOT null,
Pagamentos_Efetuados VARCHAR(50),
Situacao_boletos Varchar(50),
Observacoes VARCHAR(100),
Matricula_Aluno INT,
PRIMARY KEY (ID_contr_pgtos),
FOREIGN KEY (Matricula_Aluno) REFERENCES TB_ALUNOS(Matricula_Aluno));

CREATE TABLE TB_DEP_PEDAGOGICO
(ID_Colaborador_Ped INT NOT null,
Cargo VARCHAR(50),
Nome VARCHAR (50),
Endereço VARCHAR(100),
Telefone VARCHAR(9),
Horario_de_Trabalho VARCHAR(10),
Data_de_Inicio DATE,
PRIMARY KEY (ID_Colaborador_Ped));

CREATE TABLE TB_CURSOS
(ID_Curso INT NOT null,
Nome_Curso VARCHAR(50),
Descricao_Curso VARCHAR(255),
Total_Horas VARCHAR(20),
PRIMARY KEY(ID_Curso));


CREATE TABLE TB_MODULOS
(ID_Modulo INT NOT null,
Horario_Aulas VARCHAR(20),
ID_Curso INT,
Matricula_Aluno INT,
ID_Facilitador INT,
PRIMARY KEY (ID_Modulo),
FOREIGN KEY (ID_Curso) REFERENCES TB_CURSOS(ID_Curso),
FOREIGN KEY (ID_Facilitador) REFERENCES TB_FACILITADORES(ID_Facilitador),
FOREIGN KEY (Matricula_Aluno) REFERENCES TB_ALUNOS(Matricula_Aluno));





