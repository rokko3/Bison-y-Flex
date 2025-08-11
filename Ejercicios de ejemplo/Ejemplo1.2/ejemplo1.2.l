/* English -> American */
%%
"colour"        { printf("color"); }
"flavour"       { printf("flavor"); }
"clever"        { printf("smart"); }
"smart"         { printf("elegant"); }
"conservative"  { printf("liberal"); }
.|\n            { printf("%s", yytext); }
%%
int yywrap(void){return 1;}
int main(int argc, char **argv) {
    yylex(); /*Llama a la variable yylex que se encarga de realizar las comparaciones de las reglas */
    return 0; 
}
