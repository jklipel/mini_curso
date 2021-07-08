## Diversidade de espécies e Riqueza ##

## Como carregar pacotes
library(reshape);library(reshape2)
library(here);library(dplyr);library(tibble);library(vegan)

## carregar dados de comunidade

data <- read.csv2(here::here("pasta_de_dados", "nome_da_tabela.csv"))
head(data)

#funcao dcast do  pacote reshape2
comunidade<-reshape2::dcast(data,  PlotCode~Species, value.var="D1",fun.agg = length)
head(comunidade)

#removendo a primeira linha e segunda coluna
comunidade<-comunidade[-1,-2]
head(comunidade)

#sitio precisa estar como nome de linha, e nao como variavel
comunidade2<-comunidade %>% remove_rownames %>% column_to_rownames(var="PlotCode")
head(comunidade2) #coloca 1 coluna como rowname


## Calcular diversidade de Shannon

library(vegan) # pacote bem importante!

comunidade_div<- diversity(comunidade2, "shannon");comunidade_div

## Calcular diversidade de Simpson

comunidade_div2<- diversity(comunidade2, "simpson");comunidade_div2


## Calcular Riqueza rarefeita

comunidade2 <- round(comunidade2)
raremax <- min(rowSums(comunidade2))
comunidade2_rare <- rarefy(comunidade2, raremax); comunidade2_rare

## Beta diversidade ## VER AINDA:

comm_beta <- betadiver(comunidade2); comm_beta
plot(comm_beta)
scores(comm_beta)
