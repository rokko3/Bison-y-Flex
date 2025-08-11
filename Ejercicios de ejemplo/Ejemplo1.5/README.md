# Ejemplo 1.5

# BNF
El BNF consta de una funcionalidad semantica validas para un lenguaje de programacion.
Si lo comparamos con el español: "Una oracion es valida si tiene un sujeto, un verbo y un objeto".

<Oracion> ::= <Sujeto> <Verbo> <Objeto>  
<Sujeto>  ::= "El estudiante" | "La pizza"  
<Verbo>   ::= "come" | "programa"  
<Objeto>  ::= "codigo" | "carbohidratos"  

De esta manera podemos crear una oracion: "El estudiante come carbohidratos".
---
Una expresion BNF se compone de los siguientes aspectos:
* No terminales (Expresados por < >)
* Terminales (tokens o palabras)
* Reglas (instrucciones dadas por ::=)

Escribimos el codigo usando nano y escribiendo linea por linea:

```bash
/* recognize tokens for the calculator and print them out */
%{
#include <stdlib.h>
/* Incluimos la libreria porque tiene metodos de parseo de enteros a string (atoi, atol, strol)*/

enum yytokentype { /* enumeracion para darle un valor entero a varibles*/
    NUMBER = 258,
    ADD = 259,
    SUB = 260,
    MUL = 261,
    DIV = 262,
    ABS = 263,
    EOL = 264
};

int yylval; /* Permite la obtencion de un valor entero, para realizar operaciones*/
%}

%%

"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"!"    { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; } /* Convierte el string ingresado a entero usando (atoi) luego retorna el valor de NUMBER*/
\n     { return EOL; }
[ \t]  { /* ignore whitespace */ }
.      { printf("Mystery character %c\n", *yytext); }

%%

int main(int argc, char **argv) {
    int tok;
    
    while(tok = yylex()) { /* realiza una asignacion de variables, mientras que se pueda asignar se repite el bucle*/
        printf("%d", tok);
        if(tok == NUMBER)
            printf(" = %d\n", yylval);
        else
            printf("\n");
    }
    
    return 0;
}

```

Ejecutamos el código y ingresamos un input:

![alt text](image.png)

Este programa en flex reconoce numeros y operadores basicos (+, -, *, /, !) en una linea de texto. Cuando escribes un numero, lo convierte a entero y lo imprime junto con el token correspondiente. Si escribes un operador valido, imprime el token correspondiente (ADD, SUB, MUL, DIV, ABS). Si escribes un caracter que no es valido (como una letra o simbolo raro), el programa muestra un mensaje diciendo que es un "Mystery character"