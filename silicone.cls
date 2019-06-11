\ProvidesClass{silicone}
\usepackage[utf8]{inputenc}
\LoadClass[12pt]{article}
\RequirePackage{fullpage}
\RequirePackage[letterpaper, margin=2cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[spanish]{babel}
\RequirePackage{epsfig}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{epstopdf}
\RequirePackage{mathtools}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage{parskip}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{ifthen}
\RequirePackage{dirtytalk}
\RequirePackage{mdframed}
\RequirePackage{calc}
\RequirePackage{algorithmic}
\RequirePackage{algorithm}

% ===== DEFAULT VALUES THAT SHOULD BE DEFINED ON .tex ===
\def\@semester{2} 
\def\@year{2018}
\def\@isPuc{0} % By default it is a puc document
% =======================================================

\parindent 0pt % No indentation paragraphs

\thispagestyle{empty}
\def\@pucCode{AAA0000}
\def\@pucCourse{Lorem Ipsum III}
\def\@pucFaculty{Departamento Lorem Ipsum}
\def\@pucTeachers{ProfA}
\def\@student{John Doe}
\def\@studentNumber{12345678}

\def\@titleText{Título}
\def\@subTitle{Subtitulo}
\def\@docAuthor{Autor}
\def\@rHeader{Header Derecho}


\newcommand{\setPuc}[3]{\def\@isPuc{1}
\def\@pucCode{#1}
\def\@pucCourse{#2}
\def\@pucFaculty{#3}
}

\newcommand{\setStudent}[2]{
  \def\@student{#1}
  \def\@studentNumber{#2}
  }
\newcommand{\setTeachers}[1]{\def\@pucTeachers{#1}}
\newcommand{\setRightHeader}[1]{\def\@rHeader{#1}}
\newcommand{\setAuthor}[1]{\def\@docAuthor{#1}}
\newcommand{\setDocTitle}[1]{\def\@titleText{#1}}
\newcommand{\setYear}[1]{\def\@year{#1}}
\newcommand{\setSemester}[1]{\def\@semester{#1}}

\newcommand{\makefirstheader}{
  \begin{minipage}{2.3cm}
    \includegraphics[width=2cm]{img/logo.pdf}
    \vspace{0.5cm} % Fix logo height alignment.
    \end{minipage}
    \begin{minipage}{\linewidth}
    \textsc{\raggedright \footnotesize
    Pontificia Universidad Católica de Chile \\
    \@pucFaculty \\
    \@pucCode - \@pucCourse\\}
    \end{minipage}
}

\newcommand{\makeDocTitle}{
  \begin{center}
    \vspace{0.5cm}
    {\huge\bf \@titleText}\\
    \vspace{0.2cm}
    \today\\
    \vspace{0.2cm}
    \ifthenelse{\equal{\@isPuc}{1}}{
      \footnotesize{\@semesterº Semestre \@year~~ - ~Profesores: \@pucTeachers}\\
      }{
        \footnotesize{\@subTitle}\\
      }
    \vspace{0.2cm}
    \footnotesize{\ifthenelse{\equal{\@isPuc}{1}}{
      \@student~~ - \@studentNumber}{
        \@docAuthor
      }}
    \rule{\textwidth}{0.05mm}
    \end{center}
}



\AtBeginDocument{
  \ifthenelse{\equal{\@isPuc}{1}}{\makefirstheader}{}
  \makeDocTitle
  \rhead{\ifthenelse{\equal{\@isPuc}{1}}{
  \@student~~ - \@studentNumber
}{
  \@rHeader
}}
}

\setlength{\headheight}{15.2pt}
\setlength{\headsep}{5pt}
\pagestyle{fancy}

% Functions

\newcommand{\N}{\mathbb{N}}
\newcommand{\Exp}[1]{\mathcal{E}_{#1}}
\newcommand{\List}[1]{\mathcal{L}_{#1}}
\newcommand{\EN}{\Exp{\N}}
\newcommand{\LN}{\List{\N}}

\newcommand{\comment}[1]{}
\newcommand{\lb}{\\~\\}
\newcommand{\eop}{_{\square}}
\newcommand{\hsig}{\hat{\sigma}}
\newcommand{\ra}{\rightarrow}
\newcommand{\lra}{\leftrightarrow}
\newcommand{\vect}[1]{\left\langle #1 \right\rangle}
\newcommand{\PD}[1]{
  \begin{center}
    \begin{mdframed}[align=center, userdefinedwidth=30em]
      \centering
      \textbf{\underline{Por Demostrar}}
      
      \vspace{.5mm}
      #1
    \end{mdframed}  
  \end{center}
}

\newcommand{\dset}[1]{\{ #1 \}}
