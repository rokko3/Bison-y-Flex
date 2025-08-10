# Bison-y-Flex
## Scanner y Parsing

El **scanner** se encarga de convertir la linea en tokens, cada uno identificado por su propio token, luego el **parseo** indentifica el proceso a realizar (la operacion en si).

---

# Funcionamiento de Flex

Consiste en un conjunto de expresiones que si conciden con una expresion se realiza una accion. El compilador se encarga de leer la expresion, buscar si coincide con alguna expresion guardada y hace la accion correspondiente. Flex permite comparar de manera paralela cada instruccion y hace 100 comparaciones a la vez.

---

Un ejemplo de contador de palabras en linux es el comando wc

```bash
wc --help
Print newline, word, and byte counts for each FILE, and a total line if
more than one FILE is specified.  A word is a nonempty sequence of non white
space delimited by white space characters or by start or end of input.

```

Flex se compone de 3 partes.

- La primera parte, consiste en la configuracion de variables

```c
%{
int variable;
int variabl2;
char variabl;
%}
```

- La segunda se trata de los patrones y las acciones a realizar

```c
%%

[a-zA-Z]+ { words++; chars+=strlen(yytext);}
\n { chars++; lines++;}
. {chars++;}
%%
```

- La tercera es la implementacion al codigo de C, para que permita generar el scanner

```c
int main (int argc, char **argv){

yylex(); # Llama la funcion del scanner de flex
printf("%8d%8d%8d\n", lines,words,chars);
```

Esta ultima es lo que permite que se copie la rutina de flex en el programa de C y pueda servir el funcionamiento

---

## Etapas de procesamiento de codigo

1. Usamos la herramienta de flex para traducir el program

```bash
flex _nombrearchivo
```

1. Compila el archivo traducido con cc y lo linkeamos con la libreria de flex, que es la flag -lfl 

```bash
cc lex.yy.c -lfl
```

1. Corremos el programa producido