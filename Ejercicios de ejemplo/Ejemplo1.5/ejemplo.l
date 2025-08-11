%{
#include <stdio.h>
#include <stdlib.h>
#include "ejemplo.tab.h"   /* generado por Bison; contiene definiciones de tokens y de yylval */
%}

%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"!"    { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n     { return EOL; }
[ \t]  { /* ignorar espacios */ }
.      { printf("Mystery character %s\n", yytext); }
%%
/* yywrap para no ingresar la flag -lfl*/
int yywrap(void) {
    return 1;
}


