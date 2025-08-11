%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%token ADD SUB MUL DIV ABS AND OR EOL

/* Definición de precedencia de operadores */
%left OR             /* Menor precedencia */
%left AND
%left ADD SUB
%left MUL DIV
%nonassoc ABS       

%%

calclist: 
    | calclist exp EOL { printf("= %d (0x%x)\n", $2, $2); }
;

exp: term
    | exp ADD term { $$ = $1 + $3; }
    | exp SUB term { $$ = $1 - $3; }
    | exp OR term  { $$ = $1 | $3; }
    | exp AND term { $$ = $1 & $3; }
;

term: factor
    | term MUL factor { $$ = $1 * $3; }
    | term DIV factor { 
        if ($3 == 0) {
            yyerror("División por cero");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
      }
;

factor: NUMBER
      | ABS factor { $$ = $2 >= 0 ? $2 : -$2; }
;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
