CREATE TABLE tb_empresa
( id INT not null,
 nome VARCHAR (50),
 endereco VARCHAR (50),
 cursos VARCHAR (100),
 PRIMARY KEY (id));
 
 CREATE TABLE tb_tecnologias
 ( id INT not null,
  nome VARCHAR (50),
  area VARCHAR (50),
  PRIMARY KEY (id));
  
 CREATE TABLE tb_relatorios
 ( id INT not null,
  data_comp VARCHAR (50),
 )
 
 CREATE TABLE relatorios_tecnologias
 (id_tecnologia INT not null,
 id_empresa INT not null,
 Primary KEY (id_tecnologia,id_empresa),
 FOREIGN KEY (id_tecnologia) REFERENCES tb_tecnologias(id),
 FOREIGN KEY (id_empresa) REFERENCES tb_empresa(id));
 
