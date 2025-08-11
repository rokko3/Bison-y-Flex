# Ejercicio 2

Escribimos las reglas gramaticales con bison:
```bash
%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%

calclist: /* nothing */
    | calclist exp EOL { 
        printf("= %d (0x%x)\n", $2, $2);  /* Mostrar en decimal y hex */
      }
;

exp: factor          { $$ = $1; }
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
;

factor: term         { $$ = $1; }
      | factor MUL term { $$ = $1 * $3; }
      | factor DIV term { if ($3 == 0) {
                                    yyerror("division por cero");
                                    $$ = 0;
                                } else {
                                    $$ = $1 / $3;
                                } }
;

term: NUMBER        { $$ = $1; }
    | ABS term      { $$ = $2 >= 0 ? $2 : -$2; }
;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
```
---
Escribimos las relgas lexicas con flex:

```bash
%{
#include <stdlib.h>
#include "ejemplo.tab.h"

%}

%%

"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"!"    { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }       /* convierte decimal */
0x[0-9a-fA-F]+ { 
    yylval = (int)strtol(yytext, NULL, 16);            /* convierte hexadecimal */
    return NUMBER; 
}
\n     { return EOL; }
[ \t]  { /* ignora espacios en blanco*/ }
.      { printf("Carater no reconocido: %c\n", *yytext); }

%%
```

Ejecutamos el código y ingresamos un input:

![alt text](image.png)

En esta imagen vemos que si ingresamos un numero en hexadecimal (0x...) y realizamos operaciones entre si, el programa muestra el valor y el resultado de la operacion, tanto en valor decimal como en hexadecimal. Cabe recalcar que tambien reconoce expresiones en mayusculas o en minisculas, como es en el caso de 0xf y 0xF.

![alt text](image-1.png)

Si aplicamos la division, vemos que tambien aplica la regla de la division por 0 y si es valida la operacion, muestra en decimal y en hexadecimal.

