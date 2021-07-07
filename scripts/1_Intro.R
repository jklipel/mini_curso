
### Aula 1 ### 
### Introdução ###

## Diretório

## Como carregar pacotes


## Como carregar uma tabela

# 1- Quando a tabela estiver em formato .txt no seu diretório
data <- read.table("nome_da_tabela.txt", h=T)

# 2- Quando a tabela estiver em formato .csc no seu diretório

data <- read.csv("nome_da_tabela.csv", h=T)

## Como visualizar a tabela

head(data)

## Como ver nomes das colunas

names(data)

## Como saber a dimensão da tabela

dim(data)

## Saber a "classe" da tabela

class(data)

## Como excluir uma (ou +) coluna(s): Várias maneiras... aqui vai algumas

data <- data[,c(-1,-2,-5)] 

# ou

data <- data[,-c(1:3)]

# ou

data <- data[,-c(1,5)]

## Como excluir uma linha da tabela

data <- data[-1,]

# Lembrar que antes da vírgula é linha e depois da vírgula se refere a colunas.

## Minha tabela é gingantesca, mas quero apenas 3 colunas dela

data <- data[,c("coluna1","coluna2","coluna3")]

## Minha tabela é gigantesca, mas tem linhas com NA e quero tirar essas linhas

row.has.na <- apply(data, 1, function(x){any(is.na(x))}) #tirar NA
sum(row.has.na)
data <- data[!row.has.na,]

# ou eu sei o nome da linha que devo tirar

data<-data[!(data$Nome_coluna=="Nome_linha"),]


