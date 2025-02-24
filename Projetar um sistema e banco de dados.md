  Na computação, o que é: projetar um sistema e um banco de dados

-> Projetar um sistema e projetar um banco de dados são duas tarefas essenciais em processos de desenvolvimento de software, cada uma com um foco diferente, mas que se complementam para criar soluções robustas e eficientes.

1. Projetar um Sistema
Projetar um sistema envolve a definição de como os componentes de software e hardware interagem para atender a uma necessidade ou resolver um problema. Esse processo pode ser dividido em várias etapas, como:
   - Análise de Requisitos: Entender as necessidades dos usuários, especificações funcionais e não funcionais (como desempenho, segurança, escalabilidade).
   - Arquitetura do Sistema: Decidir como o sistema será estruturado, como os componentes vão se comunicar e quais tecnologias serão usadas (ex: arquitetura em camadas, microserviços).
   - Modelagem: Criar diagramas e representações do sistema, como diagramas de fluxo de dados, diagramas de classes ou diagramas de sequência.
   - Implementação e Testes: Transformar o design do sistema em código real, integrando e testando para garantir que o sistema atenda aos requisitos.
-> O objetivo do design de um sistema é criar uma solução que seja funcional, eficiente e fácil de manter, levando em conta também questões como escalabilidade e segurança.
   
2. Projetar um Banco de Dados
   - Análise de Requisitos: Definir quais dados serão armazenados, como esses dados se relacionam entre si e como serão acessados. Aqui, a necessidade do sistema orienta o tipo de banco de dados a ser usado (relacional, NoSQL, etc.).
   - Modelagem de Dados: Criar um modelo conceitual (normalmente um diagrama Entidade-Relacionamento ou ER), que descreve as entidades, atributos e os relacionamentos entre elas.
   - Modelagem Lógica e Física: Converter o modelo conceitual em um modelo lógico, adaptado à estrutura do banco de dados escolhido, e depois em um modelo físico, que descreve a implementação real (como tabelas, índices, e tipos de dados).
   - Normalização: Processar o banco de dados para reduzir a redundância e evitar anomalias de dados. Isso envolve dividir as tabelas de forma a eliminar dependências indesejadas.
   - Indexação e Otimização: Definir índices para otimizar a velocidade das consultas, além de planejar estratégias de backup, segurança e recuperação de dados.
-> O objetivo do design de banco de dados é garantir que os dados sejam armazenados de forma eficiente, íntegra e acessível, além de permitir que o sistema manipule esses dados de forma rápida e precisa.
   
Relação entre o Sistema e o Banco de Dados:
    -> O design do sistema e o banco de dados se complementam, pois o sistema precisa de um banco de dados bem estruturado para gerenciar informações de forma eficiente.
