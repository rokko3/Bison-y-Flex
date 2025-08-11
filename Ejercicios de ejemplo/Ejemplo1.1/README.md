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

Ejecutamos el código de compilacion :
![alt text](image.png)

![image.png](attachment:8b2d5774-f852-41b2-9f44-edf99c75c99f:image.png)

Escribimos un input:
![image.png](attachment:c9ad13aa-4185-449a-b8d7-b535c909c117:image.png)