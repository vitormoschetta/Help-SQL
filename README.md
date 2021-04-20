# Help-SQL

# SQL
A linguagem SQL é uma só, porém ela é dividida em tipos de acordo com a funcionalidade dos comandos:
- **DDL - Data Definition Language - Linguagem de Definição de Dados**
São os comandos que interagem com os objetos do banco.
São comandos DDL : CREATE, ALTER e DROP

- **DML - Data Manipulation Language - Linguagem de Manipulação de Dados**
São os comandos que interagem com os dados dentro das tabelas.
São comandos DML : SELECT, INSERT, DELETE e UPDATE

- **DTL - Data Transaction Language - Linguagem de Transação de Dados**
São os comandos para controle de transação.
São comandos DTL : BEGIN TRANSACTION, COMMIT E ROLLBACK

- **DCL - Data Control Language - Linguagem de Controle de Dados**
São os comandos para controlar a parte de segurança do banco de dados.
São comandos DCL : GRANT, REVOKE E DENY.


# Resumo:

**Views (Exibições)**: Tabela virtual formada a partir de outras tabelas. Simplifica consulta complexas.  
**Trigger (Gatilho)**: Acionado ao executar Insert, Update ou Delete em uma determinada tabela.  
**Stored Procedures (Procedimentos armazenados)**: Função que executa scripts ao ser explicitamente invocada. Aceita parâmetros de entrada.  
**Job (trabalho)**: Qualquer script (processo), ou conjunto de scripts que devam ocorrer numa determinada ordem e em um determinado horário.



# Views
Uma tabela Virtual formada por outras tabelas. 

**Segurança**: Proteger as tabelas originais.

**Simplificação de consultas**: O DBA pode facilitar a vida dos programadores através das Views, uma vez que uma consulta complexa
pode ser simplificada para uma consulta simples, como se fosse um atalho.

Exemplo:

#### Create Tables:
```
CREATE TABLE CLIENT(
	ID INT PRIMARY KEY IDENTITY,
	CLIENT_NAME VARCHAR(50) NOT NULL,	
)

CREATE TABLE CLIENT_ADDRESS(
	ID INT PRIMARY KEY IDENTITY,
	STREET VARCHAR(100) NOT NULL,
	NUMBER INT NOT NULL,
	NEIGHBORHOOD VARCHAR(50),
	CITY VARCHAR(50),
	COUNTRY VARCHAR(50),
	CLIENT_ID INT FOREIGN KEY REFERENCES CLIENT(ID)
)
```

#### Create View:
```
CREATE VIEW vReport 
AS
SELECT	C.ID, C.CLIENT_NAME,
		CA.STREET, CA.NUMBER, CA.NEIGHBORHOOD, CA.CITY, CA.COUNTRY 		
FROM CLIENT AS C
INNER JOIN CLIENT_ADDRESS AS CA 
ON CA.CLIENT_ID = C.ID
```

#### Query:
Agora podemos obter os dados que queremos de duas formas:

```
SELECT	C.ID, C.CLIENT_NAME,
		CA.STREET, CA.NUMBER, CA.NEIGHBORHOOD, CA.CITY, CA.COUNTRY 		
FROM CLIENT AS C
INNER JOIN CLIENT_ADDRESS AS CA ON CA.CLIENT_ID = C.ID
```

Consultando a View temos o mesmo resultado:
```
select * from vReport
```


# Trigger
Gatilho acionado ao executar Insert, Update ou Delete em uma determinada tabela.

Exemplo:

#### Create Tables

```
CREATE TABLE CLIENT(
	ID INT PRIMARY KEY NOT NULL IDENTITY,
	CLIENT_NAME VARCHAR(50) NOT NULL,	
)

CREATE TABLE CLIENT_ADDRESS(
	ID INT PRIMARY KEY NOT NULL IDENTITY,
	STREET VARCHAR(100) NOT NULL,
	NUMBER INT NOT NULL,
	NEIGHBORHOOD VARCHAR(50),
	CITY VARCHAR(50),
	COUNTRY VARCHAR(50),
	CLIENT_ID INT NOT NULL
)

CREATE TABLE REPORT(
	CLIENT_ID INT NOT NULL,
	CLIENT_NAME VARCHAR(50) NOT NULL,
	STREET VARCHAR(100) NOT NULL,
	NUMBER INT NOT NULL,
	NEIGHBORHOOD VARCHAR(50),
	CITY VARCHAR(50),
	COUNTRY VARCHAR(50)
)
```

#### Create Trigger:
Essa Trigger tem o objetivo de preencher a tabela REPORT toda vez que um Endereço (CLIENT_ADDRESS) for adicionado:
```
CREATE TRIGGER TGR_FILL_REPORT2  
ON CLIENT_ADDRESS
AFTER INSERT
AS 
BEGIN	
	SET NOCOUNT ON;
	INSERT into REPORT(CLIENT_ID, CLIENT_NAME, STREET, NUMBER, NEIGHBORHOOD, CITY, COUNTRY)

	SELECT	i.CLIENT_ID, 
			(select C.CLIENT_NAME from CLIENT AS C WHERE C.ID = i.CLIENT_ID), 
			i.STREET, 
			i.NUMBER, 
			i.NEIGHBORHOOD, 
			i.CITY, 
			i.COUNTRY

	FROM inserted i
END
GO
```

Observe que ao usar o Trigger, ele cria uma TABELA TEMPORÁRIA chamada 'inserted'. Ela contém os dados que adicionamos na tabela CLIENT_ADDRESS.
Como precisamos também do Nome do Cliente (CLIENT_NAME), então precisamos fazer um SELECT na tabela CLIENT com o CLIENT_ID que temos na tabela 
temporária.

#### Insert Values
Vamos testar nossa Trigger. Insira os dados:
```
INSERT INTO CLIENT(CLIENT_NAME) VALUES('CLIENT A')

INSERT INTO CLIENT_ADDRESS(STREET, NUMBER, NEIGHBORHOOD, CITY, COUNTRY, CLIENT_ID)
VALUES('STREET A', 001, 'NEIGHBORHOOD A', 'CITY A', 'BR', 1)
```

#### Result
Ao inserir valores na tabela CLIENT_ADDRESS a Trigger foi acionada, e preencheu a tabela REPORT, consulte:
```
SELECT * FROM REPORT
```


# Stored Procedures
Função que pode ser executada ao invocar de seu nome. 
Aceita parâmetros de entrada.

Exemplo:
Com base nas mesmas tabelas (CLIENT e CLIENT_ADDRESS) dos exemplos anteriores, vamos criar a Procedure:
```
CREATE PROCEDURE Search
@CLIENT_NAME VARCHAR(50) 
AS
SELECT	C.ID, C.CLIENT_NAME,
		CA.STREET, CA.NUMBER, CA.NEIGHBORHOOD, CA.CITY, CA.COUNTRY 		
FROM CLIENT AS C
INNER JOIN CLIENT_ADDRESS AS CA ON CA.CLIENT_ID = C.ID
WHERE C.CLIENT_NAME = @CLIENT_NAME
```

Executar a Procedure:
```
execute Search 'CLIENT A'
```

Perceba que essa procedure traz os mesmos resultados do exemplo anterior, porém com a distinção de filtrar a consulta pelo Nome do cliente (CLIENT_NAME)
que passamos por parâmetro.

# Job

Um JOB seria qualquer script (processo), ou conjunto de scripts que devam ocorrer numa determinada ordem e em um determinado horário.


<br>
<br>
<hr>

# Outros  

### Chave primária composta
Geralmente, criamos chaves compostas quando não há um campo que, por si só, possa ser usado para identificar as linhas da tabela de forma exclusiva, necessitando que seja realizada uma combinação de dois ou mais campos para tal.

### Pegar Schema de uma determinada tabela
```
select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='Client_address'
```


<br>

## Precision e Scale

Quando declaramos tipos numéricos podemos informar a precisão e a escala:

```
PRICE NUMERIC(8,2)
```

A declaração acima quer dizer que o nosso valor pode conter 8 numeros, com duas casas decimais após a virgula. 

Exemplo na imagem:

![alt text](assets/img/image01.png?raw=true=250x250 "Title")


