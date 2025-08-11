/* recognize tokens for the calculator and print them out */
%%
":"    { printf("COLON\n"); }
"-"    { printf("MINUS\n"); }
"+"    { printf("PLUS\n"); }
"*"    { printf("TIMES\n"); }
"/"    { printf("DIVIDE\n"); }
"!"    { printf("ABS\n"); }
[0-9]+ { printf("NUMBER %s\n", yytext); }
\n     { printf("NEWLINE\n"); }
[ \t]  { /* ignora espacios y tabulaciones */ }
.      { printf("Mystery character %s\n", yytext); } /* Si se agrega un caracter diferente al que reconoce el scanner, lo imprime*/
%%
int yywrap(void){return 1;}
int main() {
    yylex();
    return 0;
}
