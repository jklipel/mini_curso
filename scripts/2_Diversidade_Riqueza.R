
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

library(vegan) # pacote bem importante

comunidade2<- diversity(comunidade2, "shannon");comunidade2


comunidade2 <- round(comunidade2)
raremax <- min(rowSums(comunidade2))
comunidade2_rare <- rarefy(comunidade2, raremax)