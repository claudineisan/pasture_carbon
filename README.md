## Áreas de pastagem em 2018

Para identificar as áreas ocupadas por pastagens no Brasil, e o ano em que essas áreas foram convertidas para pastagens, foi utilizada a série temporal de mapeamentos das áreas de pastagens brasileiras produzidas pelo Lapig para esta classe de uso da terra. Essa série de mapas abrange o período de 1985 a 2020, e foi produzida no âmbito do projeto MapBiomas (<https://mapbiomas.org>). Os procedimentos metodológicos estão disponíveis em Parente et al., (2019) e no ATBD (Documento Base Teórico do Algoritimo) disponivel na página do projeto MapBiomas. A série de mapas em formato raster pode ser visualizada e baixada da plataforma Atlas Digital das Pastagens Brasileiras (<http://pastagem.org>).

O mapa de 2018 foi utilizado como referência para áreas de pastagens, pois na série atual este foi u último a ser filtrado pela lógica completa de remoção de ruídos desenvolvida para filtrar a série temporal. Os dados originais são baseados em imagens Landsat e tem 30 metros de resolução espacial. Aqui esses dados foram reamostrados para 1 km utilizando o critério de moda, onde apeans os pixels com mais de 50% da área ocupada por pastagens permaneceram classificados nesta categoria. 


## Idade das pastagens

Script utilizado para preprocessamento e exportação das áreas de pastagens no Brasil para o ano de 2018.
<https://code.earthengine.google.com/60caf2fc717efb5915e67668069a4c64>

As áreas ocupadas por pastagens no Brasil em 2018 somaram ~163,5 Mha, dos quais ~23,5 Mha foram contabilizados no bioma Caatinga e ~53,2 Mha no Cerrado.A idade da pastagem foi determinada a partir do ano de conversão para este uso da terra, ou seja, o ano em que maior área do pixel de 1 km-2 foi classificada como pastagem pela primeira vez (Figura 4). Aproximadamente 49,3 % da área de pastagem no Cerrado foi convertida antes de 1985, ou seja, pertencem a esta classe de uso da terra a mais de três décadas. Na Caatinga essa proporção foi de 54,9%.
