📚 REVISÃO – CONCEITOS DE BANCO DE DADOS

🔹 1. PAPEL DOS MODELOS
- Função: Representar como os dados se relacionam
- Usado para: Planejar, entender e construir bancos de dados
- Evita: Erros, redundância e inconsistência
- Etapas da Modelagem:
A modelagem de banco de dados é dividida em três níveis:

- Modelo Conceitual:
Utiliza o Modelo Entidade Relacionamento (ER).
Representado por diagramas ER.
Foca na estrutura lógica de alto nível, independente de SGBD.

- Modelo Lógico:
Tradução do modelo conceitual para estruturas lógicas específicas (como tabelas e tipos de dados).
Ainda não há dependência física de um SGBD, mas já se define como as entidades e relacionamentos serão implementados logicamente.

- Modelo Físico:
Define detalhes técnicos como índices, tipos físicos de dados, particionamento e fator de bloco.
Totalmente dependente do SGBD utilizado.

🔹 2. QUEM CRIA OS MODELOS?
- Responsável: Equipe de Banco de Dados (analistas, DBAs)
- Não é função do front-end
- Modelos vêm antes da programação

🔹 3. IMPORTÂNCIA DA CARDINALIDADE
- Define: Quantas ocorrências de uma entidade se relacionam com outra
- Tipos:
  - 1:1 → um para um
  - 1:N → um para muitos
  - N:M → muitos para muitos
- Afeta relacionamentos, tabelas e chaves estrangeiras

🔹 4. RESTRIÇÕES
- O que são: Regras que garantem a integridade dos dados
- Exemplos:
  - PK (Primary Key) → valor único, obrigatório
  - FK (Foreign Key) → referencia uma outra tabela
  - NN (Not Null) → não pode ficar vazio
  - UNIQUE → não pode repetir
- Quem define: Projetista ou analista do banco

🔹 5. DIFERENÇA ENTRE BANCO DE DADOS E SGBD

| Banco de Dados         | SGBD (Sistema Gerenciador)         |
|------------------------|-------------------------------------|
| Conjunto de dados      | Software que gerencia esses dados   |
| Ex: dados dos clientes | Ex: MySQL, PostgreSQL, Oracle       |
| Armazenamento          | Criação, leitura, edição, exclusão  |
