#mostra todas as bases de dados do SGBD:
show databases;


#invoca ou chama um banco de dados específico:
use performance_schema;

#mostra as tabelas do banco de dados invocando ou em uso:
show tables;


#1 - Criar a base de dados desejada - consulta

#2 - Invocar a base de dadas criada

#3 - Criar as tabelas
	#para cada tabela:
		#criar atributo com seu tipo
		#definir resrições
			#atributo
			#chave primária
            #chave estrangeira
	
-- exercicio sobre a base criada...

show databases;
use mydb;
show tables;

-- na tabela medico preciso alterar o tamanho do nome... de 45 caracteres para 100 caracteres
-- na tabela consulta preciso adicionar um atributo chamado convênio

-- usar o alter table