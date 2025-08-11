## Pregunta 4: ¿El scanner manual del Ejemplo 1-4 reconoce los mismos tokens que la versión Flex?

Para determinar si ambas implementaciones reconocen exactamente los mismos tokens, debemos considerar varios aspectos técnicos:

1. **Patrones de reconocimiento**:
   - El scanner generado por Flex utiliza expresiones regulares definidas en el archivo .l, lo que garantiza un reconocimiento preciso y consistente de tokens según los patrones especificados.
   - El scanner manual, al estar implementado directamente en código C, podría presentar variaciones en cómo identifica ciertos patrones, especialmente en casos complejos.

2. **Manejo de casos especiales**:
   - Para números negativos, Flex puede reconocer "-8" como un solo token (NUMBER con valor -8) si así está definido.
   - En cambio, el scanner manual podría interpretar esto como dos tokens separados (SUB seguido de NUMBER 8), dependiendo de su implementación.

3. **Tokens complejos**:
   - Flex maneja de forma nativa números hexadecimales (como 0xFF) cuando se incluye el patrón correspondiente.
   - Un scanner manual requeriría código adicional específico para reconocer este formato correctamente.

4. **Consistencia en el manejo de espacios y caracteres especiales**:
   - Flex proporciona un manejo uniforme de espacios en blanco y caracteres no reconocidos a través de sus reglas.
   - La versión manual podría tener un comportamiento diferente según cómo el programador haya implementado estas características.
