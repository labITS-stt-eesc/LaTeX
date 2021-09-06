# Templates LaTeX

Conjunto de templates em LaTeX para teses e artigos utilizados pelo grupo de pesquisa.

## Artigos ANPET

Template básico para criação de artigos que seguem os guias de formatação do congresso da [ANPET](https://anpet.org.br/index.php/pt/) (Associação Nacional de Pesquisa e Ensino em Transportes).

- *Atualizado para ANPET 2019*
- *Atualizado para ANPET 2021*

### Figuras

As figuras devem ser colocadas dentro da pasta ```Figuras```, para melhor organização.

### Referências

As referências devem ser adicionadas no arquivo ```bib\Referencias.bib```.

A formatação segue o estilo da [13ª Edição do Manual de Estilo de Chicago](https://www.chicagomanualofstyle.org/home.html), adaptado para a língua portuguesa. O arquivo de estilo com suas configurações pode ser encontrado em ```bib\chicago-br.bst```.

### Notas

Os arquivos podem ser exportados para o Overleaf ou editados na sua IDE de preferência. 

## Teses e Dissertações

Template criado pelo Prof. Jose Reynaldo Setti para teses, dissertações e qualificações da Escola de Engenharia de São Carlos da Universidade de São Paulo (EESC-USP).

### Opções de Formatações

Para escolher o tipo de formatação de documento, mudar o parâmetro *option* no arquivo principal, [tese-stt.tex](https://github.com/leandromarcomini/eesc-tese/blob/main/tese-stt.tex?plain=1#L16)
```LaTeX
    \documentclass[option]{eesc-stt}
```

As opções disponíveis são:

 	tesedr:     Formata documento para tese de doutorado
 	qualidr:    Formata documento para qualificação de doutorado 
 	dissertmst: Formata documento para dissertação de mestrado
	qualimst:   Formata documento para qualificação de mestrado

