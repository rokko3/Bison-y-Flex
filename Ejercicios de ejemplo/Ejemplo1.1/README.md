# Ejemplo 1.1

Escribimos el codigo usando nano y escribiendo linea por linea:

```bash
/* just like Unix wc */

%{
    int chars = 0;
    int words = 0;
    int lines = 0;
%}

%%

[a-zA-Z]+ { words++; chars += strlen(yytext); }
\n        { chars++; lines++; }
.         { chars++; }

%%

int main(int argc, char **argv)
{
    yylex();
    printf("%8d%8d%8d\n", lines, words, chars);
    return 0;
}
```

Ejecutamos el código de compilacion e ingresamos un input :
![Ejecucion](image.png)

Como vemos, el programa da como salida: lineas, palabras, caracteres. Siendo la cantidad de lineas 3, palabras 12 y caracteres 63. Este programa puede ser utilizado para verificar la cantidad de palabras y caracteres en un archivo, como lo puede ser un bloc de notas o word.