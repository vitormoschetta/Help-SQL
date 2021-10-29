
# Desempenho

### Dicas:

**01. INDICES:**
Crie INDICES com campos de identificação única (além da Primary Key) que vc usa constantemente para realizar consultas.
Isto deixará a consulta mais rápida, uma vez que se o banco sabe que se trata de um campo único, ao achá-lo deixa de procurar por outros.

Atenção: Faça isso apenas nas colunas que você usa para realizar filtros e consultas, pois muitos INDICES podem deixar a Escrita mais lenta.
	
**02. CHAR:**
Use o tipo CHAR para campos de texto com tamanho fixo.

**03. NORMALIZAÇÃO**
Evite normalização desnecessária. Ex: Criar Tabela Endereco quando cada cliente possuirá apenas um endereço cadastrado.
Lembre-se que quanto mais 'joins' menor será o desempenho.