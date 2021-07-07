
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
