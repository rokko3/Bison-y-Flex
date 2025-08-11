%{
#include <stdio.h>
#include <time.h>

unsigned long word_count = 0, char_count = 0;
clock_t start, end;
%}

%%
[a-zA-ZáéíóúÁÉÍÓÚñÑ]+ { word_count++; char_count += yyleng; }
.                    { char_count++; }
\n                   { char_count++; }
%%
int yywrap(void){return 1;}
int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <archivo>\n", argv[0]);
        return 1;
    }
    
    start = clock();
    
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("Error al abrir archivo");
        return 1;
    }
    
    yylex();
    
    end = clock();
    double cpu_time_used = ((double)(end - start)) / CLOCKS_PER_SEC;
    
    fclose(yyin);
    
    printf("Resultados (Flex):\n");
    printf("  Palabras: %lu\n", word_count);
    printf("  Caracteres: %lu\n", char_count);
    printf("  Tiempo de ejecución: %.4f segundos\n", cpu_time_used);
    
    return 0;
}
