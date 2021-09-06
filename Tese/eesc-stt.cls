%% eesc-stt.cls, v0.1 
%%
%% Este trabalho é uma adequação das normas de dissertações e teses
%% da Universidade de São Paulo - USP para a classe abntex2.cls
%%
%%
%% Quaisquer dúvidas favor enviar e-mail para:
%%
%% athila.uno@gmail.com ou
%% renato.monaro@gmail.com
%% [criadores da adaptação no SEL-EESC-USP, eesc.cls]
%%
%% jrasetti@usp.br 
%% [adaptação para o STT-EESC-USP, eesc-stt.cls]

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% eesc-stt: Modelo de Trabalho Acadêmico (tese de doutorado, dissertação de
% mestrado e trabalhos monográficos em geral) em conformidade com 
% ABNT NBR 14724:2011. Esta classe estende as funcionalidades da classe
% abnTeX2 elaborada de forma a adequar os parâmetros exigidos pelas 
% normas USP e do Departamento de Engenharia de Transportes da EESC-USP
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

%========================================================================
% Identificação
%========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eesc-stt}[2014/09/23 v0.1 Classe Tese STT-EESC - Prog Pos-Grad Eng Transp]

%========================================================================
% Declaração de opções
%========================================================================
% Opções:
% 	tesedr:     Formata documento para tese de doutorado
%	qualidr:    Formata documento para qualificação de doutorado
% 	dissertmst: Formata documento para dissertação de mestrado
% 	qualimst:   Formata documento para qualificação de mestrado
% -----------------------------------------------------------------------
\DeclareOption{tesedr}{
\def\@tipotrabalho{Tese de Doutorado}
\def\@worktype{Ph.D. Thesis}
\def\@nivelPos{Doutor}
\def\@niveltrabalho{tese}
}

\DeclareOption{qualidr}{
\def\@tipotrabalho{Qualificação de doutorado}
\def\@worktype{Ph.D. Thesis}
\def\@nivelPos{Doutor}
\def\@niveltrabalho{tese}
}

\DeclareOption{dissertmst}{
\def\@tipotrabalho{Disserta\c{c}\~ao de Mestrado}
\def\@worktype{Master Thesis}
\def\@nivelPos{Mestre}
\def\@niveltrabalho{dissertação}
}

\DeclareOption{qualimst}{
\def\@tipotrabalho{Qualifica\c{c}\~ao de mestrado}
\def\@worktype{Master Thesis}
\def\@nivelPos{Mestre}
\def\@niveltrabalho{dissertação}
}

\ProcessOptions\relax

%=========================================================================
% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%=========================================================================
\LoadClass[a4paper,12pt,twoside,openright]{abntex2}

%=========================================================================
% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%=========================================================================
\RequirePackage{ae}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
%\RequirePackage[alf,abnt-emphasize=bf,abnt-repeated-author-omit=yes,abnt-year-extra-label=yes]{abntex2cite}	% Citações padrão ABNT %% abnt-year-extra-label=yes parece não ser uma opção válida do abntex2cite
\RequirePackage[alf,abnt-emphasize=it,abnt-repeated-author-omit=no]{abntex2cite}	% Citações padrão ABNT
\RequirePackage{color}	% Controle das cores
\RequirePackage{pifont}
\RequirePackage{lastpage}
\RequirePackage{pdfpages}
\RequirePackage{calc,graphicx}
\RequirePackage{etoolbox}
\RequirePackage{algorithm,algorithmic}
\RequirePackage{nomencl}


\counterwithout{equation}{chapter}  % para numeração dentro de cada capítulo, comente esta linha
\setsecnumdepth{subsubsection}
\settocdepth{subsection}

\newsubfloat{figure}


% ---
% Configurações de aparência do PDF final

% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informações do PDF
\hypersetup{
     	%backref=true,
     	%pagebackref=true,
		%bookmarks=true,         		% show bookmarks bar?
		pdftitle={\imprimirtitulo}, 
		pdfauthor={\imprimirautor},
    	pdfsubject={\imprimirpreambulo},
%		pdfkeywords={PALAVRAS}{CHAVES}{abnt}{abntex}{abntex2},
	    pdfproducer={LaTeX with abnTeX2}, 	% producer of the document
	    pdfcreator={\imprimirautor},
    	colorlinks=true,       		% false: boxed links; true: colored links
    	linkcolor=black,          	% color of internal links
    	citecolor=black,        		% color of links to bibliography
    	filecolor=magenta,      		% color of file links
		urlcolor=black,
		bookmarksdepth=4
}
% ---
\newcommand{\rev}[1]{\textcolor{red}{[#1]}}
\renewcommand{\labelitemi}{\ding{111}}

% Comandos de dados - título do documento em português e inglês
\providecommand{\imprimirtitulo}{}
\newcommand{\@engtitle}{}
\renewcommand{\titulo}[2]{\title{#1}\renewcommand{\imprimirtitulo}{#1} \renewcommand{\@engtitle}{#2}}

% Comandos de dados - autor e autorbib
\newcommand{\@authorbib}{}
\providecommand{\imprimirautor}{}
\renewcommand{\autor}[2]{\author{#1}\renewcommand{\imprimirautor}{#1} \renewcommand{\@authorbib}{#2}}

% --------------------------------
% Definição Geral

\newcommand{\arquivofichacatalografica}{}
\newcommand{\inserirfichacatalografica}[1]{\renewcommand{\arquivofichacatalografica}{#1}}

\newcommand{\arquivofolhaaprovacao}{}
\newcommand{\inserirfolhaaprovacao}[1]{\renewcommand{\arquivofolhaaprovacao}{#1}}

\renewcommand{\maketitle}{%
	% Capa
	\imprimircapa

	% Ficha catalográfica
	\ifthenelse{\not\equal{\arquivofichacatalografica}{}}
	{
		\imprimirfolhaderosto*{} 
		\begin{fichacatalografica}
			\includepdf[pages={1}]{\arquivofichacatalografica}
		\end{fichacatalografica}
	}
	{
		\imprimirfolhaderosto{}
	}
	
	% Folha de aprovação
	\ifthenelse{\not\equal{\arquivofolhaaprovacao}{}}
	{
		\begin{folhadeaprovacao}
		 	\includepdf[pages={1}]{\arquivofolhaaprovacao}
		\end{folhadeaprovacao}
	}
	{
	}
}

%========================================================================
% Definição da capa, folha de rosto e folha de aprovação.
%========================================================================
% --- Definições de comprimento
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{140mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{120mm}

\instituicao
{%
	UNIVERSIDADE DE SÃO PAULO
	\par
	Escola de Engenharia de São Carlos
	\par
	Departamento de Engenharia de Transportes
	\par
	Programa de Pós-Graduação em Engenharia de Transportes
}

%\preambulo{
%	\@tipotrabalho~submetida à Escola de Engenharia de São~Carlos,
%	da Universidade de São~Paulo, como parte dos requisitos para
%	a obtenção do título de \@nivelPos~em Ciências, 
%	Programa de Pós-Graduação em Engenharia de Transportes.
%}

% STT: preambulo mudado para atender à norma da CPG-EESC
\preambulo{
	\@tipotrabalho~submetida à Escola de Engenharia de São~Carlos,
	da Universidade de São~Paulo, como parte dos requisitos para
	a obtenção do título de \emph{\@nivelPos~em Ciências}, 
	Programa de Pós-Graduação em Engenharia de Transportes. 
	Área de Concentração: 
}


% ---
% Impressão da Capa
\renewcommand{\imprimircapa}{%
	\thispagestyle{empty}
	\noindent
  	\begin{capa}%
    	\center
    	\parbox[b]{\textwidth}
	{
		\centering
		\vbox to \titlepagewinvoffset
		{
			\sffamily\imprimirinstituicao
			\vfill
			\@formataautorcapa
			\@formatatitulocapa
		}
	}
	
	\vfill{\sffamily 			% diminui o tamanho de local e data
  	\centerline{\imprimirlocal}
	\centerline{\imprimirdata}
    }
  	\end{capa}
}

\def\@formataautorcapa{%

	\parbox[b]{\titlepagewinwidth}
	{%
		\sffamily\centering\vbox to \titlepagewinheight
		{%
			\vspace*{\fill}
				{\large{\imprimirautor}}
      		\vspace*{\fill}
    		}
   	}

}

\def\@formatatitulocapa{%

	\parbox[b]{\titlepagewinwidth}
	{%
		\sffamily\centering\vbox to \titlepagewinheight
		{%
			\vspace*{\fill}
      			{\huge{\textbf{\imprimirtitulo}}\par}
			\vspace*{\fill}
    		}
   	}

}
% ---

% ---
% Conteudo padrao da Folha de Rosto

% STT - linhas comentadas foram mudadas
% Comandos de dados - Área de concentração
%\providecommand{\imprimirareaconcentracao}{}
%\newcommand{\areaconcentracao}[1]{\title{#1}\renewcommand{\imprimirareaconcentracao}
%			{Área de concentração: #1}}
%
\providecommand{\imprimirareaconcentracao}{}
\newcommand{\areaconcentracao}[1]{\title{#1}\renewcommand{\imprimirareaconcentracao}{#1}}

\makeatletter

\renewcommand{\folhaderostocontent}{


\newlength{\tampar}
\setlength{\tampar}{0.58\textwidth}
\newlength{\tamconcetracao}
\settowidth{\tamconcetracao}{\imprimirareaconcentracao}
\newlength{\tamorientador}
\settowidth{\tamorientador}{\imprimirorientadorRotulo~\imprimirorientador}
\newlength{\tamcoorientador}
\settowidth{\tamcoorientador}{\imprimircoorientadorRotulo~\imprimircoorientador}

%\ifthenelse{\lengthtest{\tamconcetracao > \tampar}}{\setlength{\tampar}{\the\tamconcetracao}}{}
\ifthenelse{\lengthtest{\tamorientador>\tampar}}{\setlength{\tampar}{\the\tamorientador}}{}
\ifthenelse{\lengthtest{\tamcoorientador>\tampar}}{\setlength{\tampar}{\the\tamcoorientador}}{}


  \begin{center}

	
    \@formataautorcapa

    \@formatatitulocapa

    \abntex@ifnotempty{\imprimirpreambulo}
    {%
  		\hspace*{\fill}
  		\makebox[\tampar][l]
  		{%
    			\parbox[b]{\tampar}
    			{
%% STT- linhas comentadas foram mudadas
%    				\imprimirpreambulo\\
%    				\par\imprimirareaconcentracao\\
%% Imprime Preâmbulo seguido de "Área de Concentração: [nome]" na mesma linha
    				\imprimirpreambulo{} 
					\imprimirareaconcentracao\\

    {\imprimirorientadorRotulo~\imprimirorientador\par}
    \abntex@ifnotempty{\imprimircoorientador}{%
       {\imprimircoorientadorRotulo~\imprimircoorientador}%
    }%
    			}
    		}\hspace{1em}
    		\vfill
    }%

  	\centerline{\imprimirlocal}
	\centerline{\imprimirdata}\vspace{16pt}
	% Folha de aprovação
	\ifthenelse{\not\equal{\arquivofolhaaprovacao}{}}
	{
		\scriptsize{Este documento é a versão corrigida da \@niveltrabalho. A versão original está \\ 
		 depositada no Serviço de Pós-Graduação da EESC-USP.}
	}
	{
	}
  \end{center}
}
% ---


% ---
% Dedicatória
% ---
\newcommand{\imprimirdedicatoria}[1]{
	\begin{dedicatoria}
   		\vspace*{\fill}
   		\centering
   		\noindent
   		\textit{#1}
   		\vspace*{\fill}
	\end{dedicatoria}
}
% ---

% ---
% Agradecimentos
% ---
\newcommand{\imprimiragradecimentos}[1]{
	\begin{agradecimentos}
		#1
	\end{agradecimentos}
}
% ---

% ---
% Epígrafe
% ---
\newcommand{\imprimirepigrafe}[1]{
\begin{epigrafe}
    \vspace*{\fill}
	\begin{flushright}
		\textit{#1}
	\end{flushright}
\end{epigrafe}
}
% ---


%========================================================================
% Listas e Sumário
%========================================================================

% ---
% Lista de ilustrações
% ---
\newcommand{\listailustracoes}{
	\pdfbookmark[0]{\listfigurename}{lof}
	\listoffigures*
	\cleardoublepage
}
% ---

% ---
% Lista de tabelas
% ---
\newcommand{\listatabelas}{
	\pdfbookmark[0]{\listtablename}{lot}
	\listoftables*
	\cleardoublepage
}
% ---

% ---
% Lista de abreviaturas
% ---
\newcommand{\listasiglas}[1]{
	\thispagestyle{empty}
	\pagestyle{empty}
	\pdfbookmark[0]{Lista de siglas}{Lista de siglas} 
	\chapter*{Lista de siglas}
	\input{#1}
	\cleardoublepage
}

\floatname{algorithm}{Algoritmo}
\renewcommand{\listalgorithmname}{Lista de algoritmos}
\newcommand{\cftalgorithmname}{\algorithmname\space} 
\newcommand{\listaalgoritmos}{
	\pdfbookmark[0]{\listalgorithmname}{loa}
	\thispagestyle{empty}
	\pagestyle{empty}
	\listofalgorithms
	\cleardoublepage
}

\renewcommand{\nompreamble}{\thispagestyle{empty}}
\renewcommand\nomname{Lista de símbolos}
\newcommand{\listasimbolos}{
	\thispagestyle{empty}
	\pagestyle{empty}
	\makenomenclature
	\pdfbookmark[0]{\nomname}{los}
	\printnomenclature
	\cleardoublepage
}
% ---

% ---
% Sumário
% ---
\newcommand{\sumario}{%
	\chapter*{\contentsname}
	\pdfbookmark[0]{\contentsname}{toc}
	\thispagestyle{empty}
	\pagestyle{empty}
	\@starttoc{toc}
	\cleardoublepage}
% ---

%========================================================================
% Resumo e Abstract
%========================================================================

% ---
% Resumo
% ---
\renewenvironment{resumo}[1]
{%
	\gdef\@abstractkw{#1}
	\chapter*{Resumo}\par%
	\pdfbookmark[0]{Resumo}{Resumo} 
	\@authorbib~ \textbf{\imprimirtitulo}. \pageref{LastPage}~p.~\@tipotrabalho~ -- ~Escola de Engenharia 
	de São Carlos, Universidade de São Paulo, \imprimirdata.\par\vspace{6ex}
}%	
{
   	\par\vspace{2ex}
   	\vspace{0.5cm}
   	\noindent\textbf{Palavras-chave:} \@abstractkw.
	\thispagestyle{empty}
	\cleardoublepage
}

% ---

% ---
% Abstract
% ---
\renewenvironment{abstract}[1]
{%
	\gdef\@abstractkw{#1}
	\chapter*{Abstract}\par%
	\pdfbookmark[0]{Abstract}{Abstract} 
	\@authorbib~ \textbf{\@engtitle}. \pageref{LastPage}~p.~\@worktype~ -- ~São Carlos School of Engineering, 
	University of São Paulo, \imprimirdata.\par\vspace{6ex}
}%	
{
   	\par\vspace{2ex}
   	\vspace{0.5cm}
   	\noindent\textbf{Keywords:} \@abstractkw.
	\thispagestyle{empty}
	\cleardoublepage
}
% ---

%=======================================================================
% Ajuste do cabeçalho e rodapé
%=======================================================================

\makepagestyle{eescchaplast}
\makeevenhead{eescchaplast}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{eescchaplast}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{eescchaplast}{\textwidth}{\normalrulethickness}


\makepagestyle{eescpartlast}
\makeoddhead{eescpartlast}{}{}{\ABNTEXfontereduzida\thepage}
\makeevenhead{eescpartlast}{\ABNTEXfontereduzida\thepage}{}{}


\renewcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}% customizing chapter pagestyle
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 


\renewcommand{\textual}{%
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  \aliaspagestyle{cleared}{eescchaplast}
  \aliaspagestyle{part}{eescchaplast}
  \nouppercaseheads
}% Configura layout para elementos pós-textuais

\renewcommand{\postextual}{
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}
  \aliaspagestyle{cleared}{eescchaplast}
  \aliaspagestyle{part}{eescpartlast}
\aliaspagestyle{afterpart}{eescpartlast}

}
\renewcommand{\backmatter}{\postextual}

% ---

%=========================================================================
% Nomes Constantes
%=========================================================================
%\renewcommand{\chaptername}{Capítulo}
%\renewcommand{\partname}{Parte}

%=========================================================================
% Configurações
%=========================================================================
% --- 
\chapterstyle{madsen}

% --- 
\renewcommand*{\figureautorefname}{Figura}
\renewcommand*\footnoteautorefname{Nota de Rodapé}%
\renewcommand*\itemautorefname{Item}%
\renewcommand*\tableautorefname{Tabela}%
\renewcommand*\partautorefname{Parte}%
\renewcommand*\appendixautorefname{Apêndice}%
\renewcommand*\chapterautorefname{Capítulo}%
\renewcommand*\sectionautorefname{Seção}%
\renewcommand*\subsectionautorefname{Subseção}%
\renewcommand*\subsubsectionautorefname{Subseção}%
\renewcommand*\paragraphautorefname{Parágrafo}%
\renewcommand*\subparagraphautorefname{Subparágrafo}%
\renewcommand*\FancyVerbLineautorefname{Linha}%
\renewcommand*\theoremautorefname{Teorema}%
\renewcommand*\pageautorefname{Página}%
% --- 


% ---
% Fonte padrão section, subsection e subsubsection
\renewcommand{\ABNTEXchapterfont}{\huge\bfseries}

% Tipo de trabalho para classe abntex2 (ficha catalográfica)
% ---
\tipotrabalho{\@tipotrabalho}

% --- 
% Espaçamentos entre linhas e parágrafos 
% --- 

%%% O tamanho do parágrafo é dado por:
\setlength{\parindent}{1em}

% Controle do espaçamento entre um parágrafo e outro:
\setlength{\parskip}{1ex}  % tente também \onelineskip


%% --- 
%  Redefinição do tamanho das letras dos títulos de seções e 
%  subseções
\renewcommand{\ABNTEXsectionfontsize}{\large}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXchapterfont}{\sffamily\bfseries}
\renewcommand{\ABNTEXsectionfont}{\sffamily\bfseries}
\renewcommand{\ABNTEXsubsectionfont}{\rmfamily\bfseries}
