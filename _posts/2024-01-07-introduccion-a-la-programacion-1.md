---
layout: post
title: Introducción a la programación 1/2
date: "2024-01-07"
categories: 
  - "DevOps"
  - "Fundamentos de la programación"
tags: 
  - "course"
  - "programming"
readtime: true
lang-ref: intro
---

La informática es la ciencia que estudia todo lo regerente al procesamiento de la información de manera automática. La programación es una de las disciplinas más importantes de la informática, ya que es la que permite a los seres humanos comunicarse con las máquinas.

Un programa es una secuencia de instrucciones que le indican a una máquina qué hacer. Estas instrucciones se escriben en un lenguaje de programación, que es un lenguaje formal que se utiliza para expresar algoritmos.

### Arquitectura básica de un computador

Un computador es una máquina que está compuesta por varios elementos que trabajan juntos para procesar la información. El elemento más importante de un ordenador junto a su procesador es la memoria principal.

La memoria principal es el lugar donde se almacenan los datos y las instrucciones que se están utilizando en un momento dado. Se producen operaciones básicas de lectura y escritura.

<div align="center">
  <img src="/assets/img/curso-programacion/memoria-principal.png" alt="Memoria principal"/>
</div>

La memoria de un ordenador tiene una organización matricial, en la que cada celda tiene una dirección única. La memoria se divide en dos tipos:

* Memoria RAM (Random Access Memory): es una memoria volátil, lo que significa que los datos se pierden cuando se apaga el computador.  
* Memoria ROM (Read Only Memory): es una memoria no volátil, lo que significa que los datos se mantienen aunque se apague el computador.  

El direccionamiento de la memoria se realiza mediante un sistema de coordenadas, en el que cada celda tiene una dirección única. El tamaño de la memoria es el número de celdas que tiene:

```text
    Capacidad = (Número de palabras * Tamaño de la palabra) - 1
    Número de palabras = 2^16 = 65536
    Tamaño de la palabra = 8 bits = 1 byte
    Capacidad = (65536 * 1) - 1 = 65535
```

Las unidades de almacenamiento de la memoria son los bits y los bytes. Un bit es la unidad mínima de información, que puede tener dos valores: 0 o 1. Un byte es un conjunto de 8 bits, que puede representar 256 valores diferentes.  

```text
    Número de valores = 2^8 = 256
    Octeto o byte = 8 bits
    Kilobyte (KB) = 2^10 bytes = 1024 bytes
    Megabyte (MB) = 2^20 bytes = 1048576 bytes o 1024 KB
    Gigabyte (GB) = 2^30 bytes = 1073741824 bytes o 1024 MB
```

### Introducción a los sistemas operativos

Un sistema operativo es un conjunto de programas que se encargan de gestionar los recursos de un computador. Presenta una interfaz entre el usuario y el hardware, y se encarga de gestionar los recursos de la máquina.
Los sistemas operativos se dividen en dos tipos:

* Sistemas operativos de usuario: son los que se instalan en los computadores personales y permiten a los usuarios interactuar con la máquina.
* Sistemas operativos de tiempo real: son los que se utilizan en los sistemas embebidos y en los sistemas de control.

Un programa debe estar en memoria para ser ejecurado. El sistema operativo se encarga de cargar el programa en memoria, asignarle un espacio de memoria y ejecutarlo. Pueden existir varios programas en memoria al mismo tiempo, para esto el sistema operativo se encarga de gestionar la memoria, asignando y liberando espacio de memoria.

<div align="center">
  <img src="/assets/img/curso-programacion/estructura-capas-ordenador.png" alt="Sistema operativo"/>
</div>

### Introducción a los lenguajes de programación

Se utilizan lenguajes de programación para escribir programas que se ejecutarán en un computador. Los lenguajes de programación se dividen en dos tipos según su cercanía al lenguaje máquina:

* Lenguajes de bajo nivel: son lenguajes que están muy cerca del lenguaje máquina, por lo que son difíciles de entender y de escribir. Ejemplos: ensamblador.
* Lenguajes de alto nivel: son lenguajes que están más alejados del lenguaje máquina, por lo que son más fáciles de entender y de escribir. Ejemplos: C, C++, Java, Python.

Los lenguajes de programación se dividen en dos tipos según su forma de ejecución:

* Lenguajes compilados: son lenguajes que se traducen a lenguaje máquina antes de ser ejecutados. Ejemplos: C, C++.
* Lenguajes interpretados: son lenguajes que se traducen a lenguaje máquina mientras se ejecutan. Ejemplos: Python, Ruby.

Los lenguajes de bajo nivel son más rápidos que los lenguajes de alto nivel, pero son más difíciles de entender y de escribir. Son dependientes de la máquina, por lo que un programa escrito en un lenguaje de bajo nivel no se puede ejecutar en otra máquina.

Los lenguajes de alto nivel son más fáciles de entender y de escribir, pero son más lentos que los lenguajes de bajo nivel. Están diseñados para ser legibles por los humanos, por lo que un programa escrito en un lenguaje de alto nivel se puede ejecutar en cualquier máquina, es decir, son portables.

La principal ventaja de los lenguajes de alto nivel es que permiten a los programadores escribir programas más rápidamente, ya que no tienen que preocuparse por los detalles de la máquina. Además, los lenguajes de alto nivel son más fáciles de depurar, ya que los errores son más fáciles de encontrar. Por contra, los lenguajes de alto nivel son más lentos que los lenguajes de bajo nivel, ya que tienen que ser traducidos a lenguaje máquina antes de ser ejecutados y no se aprovechan al máximo las características de la máquina.

El traductor es un programa que se encarga de traducir un programa escrito en un lenguaje de programación a lenguaje máquina. Los traductores se dividen en varios tipos:

* Ensamblador: es un traductor que traduce un programa escrito en lenguaje ensamblador a lenguaje máquina.
* Compilador: es un traductor que traduce un programa escrito en un lenguaje de programación a lenguaje máquina de una sola vez.
* Intérprete: es un traductor que traduce un programa escrito en un lenguaje de programación a lenguaje máquina línea a línea.

La diferencia entre un compilador y un intérprete es que un compilador traduce un programa de una sola vez, mientras que un intérprete traduce un programa línea a línea. Los lenguajes compilados son más rápidos que los lenguajes interpretados, ya que no tienen que ser traducidos cada vez que se ejecutan.

<div align="center">
  <img src="/assets/img/curso-programacion/compilador-vs-interprete.png" alt="Compilador vs intérprete"/>
</div>

La compilación es el proceso de traducir un programa escrito en un lenguaje de programación a lenguaje máquina o programa objeto. Para ello, debe usar o montador o enlazador.

<div align="center">
  <img src="/assets/img/curso-programacion/compilacion.png" alt="Compilación"/>
</div>

## Programación estructurada

### Resolución de problemas y algoritmos

Un algoritmo es un conjunto de instrucciones que se utilizan para resolver un problema. Un algoritmo se puede representar de varias formas, como un diagrama de flujo, un pseudocódigo o un programa de computador. Las características de un algoritmo son:

* Finito: un algoritmo debe terminar en algún momento.
* Preciso: un algoritmo debe indicar el orden de realiazación de las instrucciones paso a paso.
* Determinista: un algoritmo debe producir el mismo resultado para los mismos datos de entrada. Es decir, siempre comportarse de la misma manera.

El diseño de un algortimo debe ser descendente, es decir, se debe empezar por el problema general y se debe ir descomponiendo en problemas más pequeños. Para ello, se utilizan técnicas de refinamiento, como la división y conquista, la recursividad o la programación dinámica.

```text
    Inicio
    Leer a
    Leer b
    c = a + b
    Escribir c
```

El desarrollo de algoritmos o desarrollo de software es el proceso de creación de un programa de computador. El desarrollo de software se divide en varias fases:

* Análisis: es la fase en la que se comprende el problema, identifican los requisitos del sistema y se definen los objetivos del proyecto.
* Diseño: es la fase en la que se definen las especificaciones del sistema, se diseñan los módulos del sistema y se planifica el desarrollo del sistema.
* Implementación: es la fase en la que se escribe el código del sistema, se prueban los módulos del sistema y se corrigen los errores del sistema.
* Pruebas: es la fase en la que se prueban los módulos del sistema, se prueban los casos de prueba del sistema y se corrigen los errores del sistema.
* Mantenimiento: es la fase en la que se corrigen los errores del sistema, se mejoran las funcionalidades del sistema y se actualiza el sistema.

La programación modular o programación estructurada es una técnica de programación que consiste en dividir un programa en módulos o subprogramas. Los módulos son bloques de código que realizan una tarea específica y se pueden reutilizar en otros programas. La programación modular tiene varias ventajas:

* Facilita la comprensión del programa.
* Facilita la depuración del programa.
* Facilita la reutilización del código.
* Facilita la modificación del programa.

La programación estructurada usa solamente tres estructuras de control: secuencia, selección e iteración.

* La estructura de control de secuencia es una secuencia de instrucciones que se ejecutan una detrás de otra.  
* La estructura de control de selección es una estructura que permite ejecutar un bloque de instrucciones si se cumple una condición.  
* La estructura de control de iteración es una estructura que permite ejecutar un bloque de instrucciones varias veces.

<div align="center">
  <img src="/assets/img/curso-programacion/programacion-estructurada.png" alt="Programación estructurada"/>
</div>

Veamos un ejemplo de cómo se puede resolver un problema con programación estructurada. Supongamos que queremos calcular si un año es bisiesto o no. Un año es bisiesto si es divisible por 4, pero no es divisible por 100, a menos que sea divisible por 400. Para resolver este problema, podemos utilizar la siguiente estructura de control:

<div align="center">
  <img src="/assets/img/curso-programacion/ano-bisiesto.png" alt="Año bisiesto"/>
</div>

```text
    Inicio
    Leer año
    Si año % 4 == 0 y año % 100 != 0 o año % 400 == 0
        Escribir "El año es bisiesto"
    Sino
        Escribir "El año no es bisiesto"
```

## Codificación de la información

### Introducción

Los ordenadores almacenan información de forma diferente a la nuestra: mientra que nosotros manejamos conceptos como números enteros, números reales, alfabeto, colores, ... los ordenadores solo entienden secuencias de unos y ceros.

Es por ello que necesitamos un mecanismo que permita traducir la información que manejamos a secuencias de unos y ceros. A este proceso se le llama codificación de la información. A la información que se codifica se le llama datos, y a las diferentes formas de codificar la información se les llama tipos de datos.

Los sistemas posicionales son aquellos en los que el valor de un dígito depende de su posición dentro de la secuencia de dígitos. Un dígito tendrá menos valor conforme más a la derecha esté, y más valor conforme más a la izquierda se encuentre.

```text
    4532 = 4000 + 500 + 30 + 2 = 4 * 10^3 + 5 * 10^2 + 3 * 10^1 + 2 * 10^0
```

### Codificación de enteros sin signo

Los números enteros sin signo (o positivos) se condifican utilizando la codificación binaria. La codificación binaria es un sistema posicional en el que cada dígito puede tener dos valores: 0 o 1.

```text
    Para encontrar la representación binaria de 25, debemos dividir 25 entre 2 sucesivamente y guardar el resto de cada división:
    25 / 2 = 12 resto 1
    12 / 2 = 6 resto 0
    6 / 2 = 3 resto 0
    3 / 2 = 1 resto 1
    1 / 2 = 0 resto 1
    Por lo que 25 en binario es 11001

    Si queremos encontrar la representación decimal de 11001. Debemos multiplicar cada dígito por 2 elevado a la posición que ocupa:
    1 * 2^4 + 1 * 2^3 + 0 * 2^2 + 0 * 2^1 + 1 * 2^0 = 16 + 8 + 0 + 0 + 1 = 25
```

Para operar con números binarios, se utilizan las mismas operaciones que con los números decimales, pero con las siguientes reglas.

<div align="center">
  <img src="/assets/img/curso-programacion/operaciones-binarias.png" alt="Operaciones binarias"/>
</div>

Aunque los números enteros sin signo se pueden representar con cualquier número de bits, en la práctica se suelen utilizar la bases de numeración octal (base 8) y hexadecimal (base 16) para simplificar la representación de los números binarios.

El sistema de numeración octal es un sistema posicional en el que cada dígito puede tener ocho valores: 0, 1, 2, 3, 4, 5, 6, 7. Para convertir un número decimal a octal, se divide el número decimal entre 8 sucesivamente y se guardan los restos de cada división.

<div align="center">
  <img src="/assets/img/curso-programacion/sistema-octal.png" alt="Sistema octal"/>
</div>

```text
    Para encontrar la representación octal de 25, debemos dividir 25 entre 8 sucesivamente y guardar el resto de cada división:
    25 / 8 = 3 resto 1
    3 / 8 = 0 resto 3
    Por lo que 25 en octal es 31

    Para convertir un número binario a octal, se agrupan los dígitos binarios de tres en tres y se convierten a octal:
    110 011 -> 6 3
```

El sistema de numeración hexadecimal es un sistema posicional en el que cada dígito puede tener dieciséis valores: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F. Para convertir un número decimal a hexadecimal, se divide el número decimal entre 16 sucesivamente y se guardan los restos de cada división.

<div align="center">
  <img src="/assets/img/curso-programacion/sistema-hexadecimal.png" alt="Sistema hexadecimal"/>
</div>

```text
    Para encontrar la representación hexadecimal de 25, debemos dividir 25 entre 16 sucesivamente y guardar el resto de cada división:
    25 / 16 = 1 resto 9
    1 / 16 = 0 resto 1
    Por lo que 25 en hexadecimal es 19

    Para convertir un número binario a hexadecimal, se agrupan los dígitos binarios de cuatro en cuatro y se convierten a hexadecimal:
    1100 1101 -> C D
```

El desbordamiento de un número ocurre cuando el resultado de una operación aritmética es mayor que el rango de valores que se pueden representar con el número de bits disponibles. El desbordamiento de un número puede ser positivo o negativo, y puede ser detectado mediante la comparación de los bits de signo de los operandos y del resultado. Para evitarlo, es fundamental que el programador tenga en cuenta el rango de valores que se pueden representar con el número de bits disponibles, y seleccionar un tipo de dato adecuado para la operación que se va a realizar.

```text
    Supongamos que queremos representar el mes del año (del 1 al 12), evidentemente tendríamos suficiente con 4 bits. 
    2^4 = 16 > 12

    Supongamos que queremos representar el día de la semana (del 1 al 7), evidentemente tendríamos suficiente con 3 bits.
    2^3 = 8 > 7

    Sin embargo, si queremos representar el número de segundos en un día (del 0 al 86400), necesitaríamos 17 bits.
    2^17 = 131072 > 86400
```

### Codificación de enteros con signo

Para codificar números enteros con signo se utiliza la codificación de complemento a 2. Esta codificación es un sistema posicional en el que el bit más significativo se utiliza para representar el signo del número: 0 para positivo y 1 para negativo. Presenta, además, varias ventajas sobre otras posibles codifications entre las que podemos destacar:

* Aprovecha al máximo el rango de valores que se pueden representar con el número de bits disponibles.
* Restar dos números equivale a sumar un número y su complemento a 2. Simplifica la implementación de la resta.

Para codificar un número en complemento a dos se realizan los siguientes pasos:

1. Se toma el valor absoluto del número (sin signo)
2. Se convierte el número a binario
3. Si el número es positivo, se añaden ceros a la izquierda hasta completar el número de bits
4. Si el número es negativo, se invierten todos los bits y se lse suma 1 al resultado

```text
    Para encontrar la representación en complemento a 2 de -25, debemos encontrar la representación en binario de 25 y sumarle 1:
    25 = 11001
    -25 = 00111 + 1 = 01000
```

Para convertir un número en complemento a 2 a decimal se realizan los siguientes pasos:

1. Si el bit más significativo es 0, el número es positivo y se convierte a decimal normalmente
2. Si el bit más significativo es 1, el número es negativo y se invierten todos los bits y se le suma 1 al resultado

```text
    Para encontrar la representación decimal de 11001 en complemento a 2, debemos invertir los bits y sumarle 1:
    11001 -> 00110 + 1 = 00111 = 7
```

Al igual que sucede en los enteros sin signo, los enteros con signo también pueden verse afectados por el problema del desbordamiento.

```text
    Supongamos qun dato de ocho dígitos y con un valor almacenado de 127, si le sumamos 1, el resultado sería 128, que no se puede representar con un dato de ocho bits. 
    Si ahora interpretamos el resultado, como el bit más significativo es un 1, consideramos que el número es negativo, por lo que el resultado sería -128. Es decir, el resultado de sumar 1 a 127 sería -128. Lo que es incorrecto.
```

### Codificación de números decimales

Los números decimales se pueden representar en binario utilizando la codificación de punto fijo o la codificación de punto flotante. La codificación de punto fijo es un sistema posicional en el que se utiliza un número fijo de bits para representar la parte entera y la parte decimal de un número. La codificación de punto flotante es un sistema posicional en el que se utiliza un número variable de bits para representar la parte entera y la parte decimal de un número.

```text
    Para codificar 175.8376 en punto fijo, se separa la parte entera de la parte decimal y se convierte cada parte a binario. En un formato de 8 bits con 4 bits para la parte entera y 4 bits para la parte decimal:
    175 = 10101111
    0.8376 = 1101
    Sería 10101111.1101

    Para codificar 175.8376 en punto flotante, se debe seguir la siguiente estructura:
    1. Signo: 0 para positivo y 1 para negativo
    2. Exponente: se suma 127 al exponente y se convierte a binario
    3. Mantisa: se convierte la parte entera y la parte decimal a binario y se concatenan

    Para encontrar la representación en punto flotante de 175.8376, debemos seguir los siguientes pasos:
    1. Signo: 0
    2. Exponente: 127 + 7 = 134 = 10000110
    3. Mantisa: 10101111.1101
    Por lo que la representación en punto flotante de 175.8376 es 0 10000110 10101111110100000000000
```

## Tipos, constantes y variables

### Tipos de datos

Cada lenguaje de programación tiene un conjunto de tipos de datos que se pueden utilizar para representar la información. Cada tipo de dato permite determinar los siguientes aspectos:

* El rango de valores que se pueden representar con el tipo de dato.
* El tamaño en memoria que ocupa el tipo de dato.
* Las operaciones que se pueden realizar con el tipo de dato.
* La forma en la que se almacenan en memoria los diferentes valores.

Los tipos de datos se dividen en dos categorías: tipos de datos primitivos y tipos de datos compuestos.

Los tipos de datos primitivos son aquellos que representan un único valor y se utilizan para representar los datos más básicos. Los tipos de datos primitivos se dividen en varios tipos:  

* Tipos de datos enteros: son aquellos que representan números enteros. Los tipos de datos enteros se dividen en varios tipos: *char*, *int*, *short*, *long*.  
* Tipos de datos reales: son aquellos que representan números reales. Los tipos de datos reales se dividen en varios tipos: *float*, *double*.  
* Tipos de datos lógicos: son aquellos que representan valores lógicos. Los tipos de datos lógicos se dividen verdaderos o falsos: *bool*.
* Tipos de datos carácter: son aquellos que representan caracteres. El tipo de dato carácter es: *char*.  

La diferencia entre los diferentes tipos radica, como en el caso de los enteros sin signo, en la cantidad de memoria que ocupan y en el rango de valores que pueden representar. Su tamaño no está definido en el estándar y puede variar de una máquina a otra. Lo que sí se garantiza es que el tamaño de un tipo de dato no será menor que el de otro tipo de dato de menor tamaño.

| Tipo de dato | Tamaño en bytes | Rango de valores |
|--------------|------------------|------------------|
| char         | 1                | -128 a 127       |
| int          | 2                | -32768 a 32767   |
| short        | 2                | -32768 a 32767   |
| long         | 4                | -2147483648 a 2147483647 |
| float        | 4                | 3.4E-38 a 3.4E+38 |
| double       | 8                | 1.7E-308 a 1.7E+308 |
| bool         | 1                | true o false     |

Los tipos de datos compuestos son aquellos que representan un conjunto de valores y se utilizan para representar los datos más complejos. Los tipos de datos compuestos se dividen en varios tipos:  

* Tipos de datos estructurados: son aquellos que representan un conjunto de valores de diferentes tipos. Los tipos de datos estructurados se dividen en varios tipos: *struct*, *union*.  
* Tipos de datos enumerados: son aquellos que representan un conjunto de valores que se pueden enumerar. El tipo de dato enumerado es el *enum*.  
* Tipos de datos puntero: son aquellos que representan la dirección de memoria de un valor. El tipo de dato puntero es el *pointer*.

### Constantes

Decimos que son constantes auqellos datos que no son susceptibles de ser modificados durante la ejecución de un programa. Las constantes se utilizan para representar valores que no cambian, como el valor de *pi* o el número de días de la semana.

Estas constantes se pueden encajar en varias categorías:

* Constantes enteras: son aquellas que representan números enteros. Las constantes enteras se definen con la palabra clave *const* y se pueden inicializar con un valor entero.
* Constantes reales: son aquellas que representan números reales. Las constantes reales se definen con la palabra clave *const* y se pueden inicializar con un valor real.
* Constantes lógicas: son aquellas que representan valores lógicos. Las constantes lógicas se definen con la palabra clave *const* y se pueden inicializar con un valor lógico.
* Constantes carácter: son aquellas que representan caracteres. Las constantes carácter se definen con la palabra clave *const* y se pueden inicializar con un valor carácter.

```java
    const int DIAS_SEMANA = 7;
    const float PI = 3.14159;
    const bool VERDADERO = true;
    const char INICIAL = 'J';
```

Algunos caracteres especiales se representan con secuencias de escape, que son secuencias de caracteres que se utilizan para representar caracteres especiales. Las secuencias de escape se representan con una barra invertida seguida de un carácter. Algunas secuencias de escape comunes son:

| Secuencia de escape | Carácter especial |
|----------------------|-------------------|
| \n                   | Salto de línea    |
| \t                   | Tabulación        |
| \b                   | Retroceso         |
| \r                   | Retorno de carro  |
| \'                   | Comilla simple    |
| \"                   | Comilla doble     |
| \\                   | Barra invertida   |

### Variables

Las variables se utilizan para almacenar valores que pueden cambiar durante la ejecución de un programa. Las variables se utilizan para representar datos que pueden variar, como el número de intentos de un usuario o el saldo de una cuenta bancaria.

Se designan mediante un nombre al que se llama identificador. Este identificador puede ser cualquier secuencia de letras, dígitos y guiones bajos, pero debe empezar por una letra. Además, no se pueden utilizar palabras reservadas del lenguaje de programación.

Es conveniente que el identificador de una variable sea descriptivo, para que se pueda entender fácilmente qué representa la variable. Además, es importante que el identificador de una variable sea único, para evitar confusiones.

```java
    int edad = 25;
    float altura = 1.75;
    bool casado = false;
    char inicial = 'J';
```

Las operaciones básicas que pueden realizarse con una variable son declararla, utilizar el valor almacenado, o asignarle un nuevo valor.

Hay lenguajes en los que es necesario declarar una variable antes de poder utilizarla. La declaración de una variable consiste en indicar el tipo de dato que va a almacenar la variable y el nombre de la variable.

```java
    int edad;
    float altura;
    bool casado;
    char inicial;
```

En otros lenguajes, como Python, no es necesario declarar una variable antes de poder utilizarla. En estos lenguajes, la variable se declara automáticamente cuando se le asigna un valor.

```python
    edad = 25
    altura = 1.75
    casado = False
    inicial = 'J'
```

Hay que tener en cuenta que si una varibale se declara pero no se le asigna un valor, la variable contendrá un valor basura, es decir, un valor que no tiene sentido. Por ello, es importante inicializar las variables antes de utilizarlas.

Para realizar la asignación de un valor a una variable se utiliza el operador de asignación, que es un signo igual (=). El operador de asignación se utiliza para asignar un valor a una variable. El valor que se asigna a una variable puede ser una constante, una expresión o el valor de otra variable.

El tiempo de vida de una varibale determina cuándo se crea y cuándo se destruye. Las variables se crean cuando se declara y se destruyen cuando se sale del ámbito en el que se declararon. El ámbito de una variable es la parte del programa en la que se puede utilizar la variable. Esto trae consigo una serie de consecuencias:

* La primera, y más importante, es que el valor de una variable en sucesivas ejecuciones del programa puede ser diferente.
* La segunda es que el valor de inicialización especificado en la declaración de la variable se aplica en casa una de las ejecuciones del bloque de código en el que se declara la variable.
* La tercer es que las modificaciones que hagamos sobre la variable dentro de un bloque de código no afectarán a la variable fuera de ese bloque.

A estas variables se les conoce como variables automáticas o locales y son las que habitualmente se utilizarán en los programas.

Existe un procedimiento para evitar que las variables locales se destruyan al salir del ámbito en el que se declararon, y es declararlas como variables globales. Las variables globales son aquellas que se declaran fuera de cualquier función y se pueden utilizar en cualquier parte del programa. Esta especificación tiene un triple efecto sobre la variable:  

* Hace que las variables se creen al inicio de la ejecución del programam, y no al declararla dentro de un bloque como las variables locales.
* Hace que las variables se destruyan al final de la ejecución del programa, y no al salir del bloque en el que se declararon.
* Hace que se inicialicen al comienzo de la ejecución del programa: al valor indicado en la declaración de la variable, o a cero si no se indica nada. Sólo pueden utilizarse expresiones constantes para la inicialización de las variables globales.

```java
    static int contador = 0;
```

Desde el punto de vista de la detección y corrección de errores, es muy conveniente que la visibilidad de las variables sea lo más reducida posible: podemos controlar el valor de dicha variable centrándonos en el contexto en el que es visible. Por esta razón es muy desaconsejable la utilización de variables globales en cualquier programa.

## Expresiones y operadores

En cualquier programa es necesario procesaro las datos de entrada para generar datos de salida. El elemento básico que tenemos para procesar los datos son las expresiones. Una expresión es una combinación de valores, variables y operadores que se evalúa para obtener un resultado. Las expresiones se utilizan para realizar cálculos, comparaciones y asignaciones.

Los paréntesis se utilizan para agrupar los elementos de una expresión y determinar el orden de evaluación de los operadores.

```text
    Para evaluar la expresión 2 + 3 * 4, primero se evalúa la multiplicación y luego la suma:
    2 + 3 * 4 = 2 + 12 = 14

    Para evaluar la expresión (2 + 3) * 4, primero se evalúa la suma y luego la multiplicación:
    (2 + 3) * 4 = 5 * 4 = 20
```

### Operadores aritméticos

Toman como valores operandos numéricos y producen como resultado un valor numérico. Los operadores aritméticos en general son:

* Operadores unarios: son aquellos que toman un único operando. Los operadores unarios son el operador de incremento y el operador de decremento.
  * \+ no tiene efecto aparente
  * \- cambia el signo del operando
* Operadores binarios: son aquellos que toman dos operandos. Los operadores binarios son el operador de suma, el operador de resta, el operador de multiplicación, el operador de división y el operador de módulo.
  * \+ suma dos operandos
  * \- resta dos operandos
  * \* multiplica dos operandos
  * \/ divide dos operandos. Devuelve el cociente de la división. Si los operandos son enteros, el resultado es un entero. Si los operandos son reales, el resultado es un real.
  * \% calcula el resto de la división entera de dos operandos. Devuelve el resto de la división. Ambos operandos deben ser enteros.

Estos operadores aritméticos siguen las reglas de prioridad de las operaciones aritméticas. Si dos operadores tienen la misma prioridad, se evalúan de izquierda a derecha.

No hay que olvidar que los valores de tipo *char* se pueden tratar como enteros, por lo que se pueden utilizar en operaciones aritméticas. Sin embargo, hay dos oepraciones que resultan de especial interés:  

* La suma de un valor de tipo *char* con un valor numérico, que produce un valor de tipo *char* y representa el carácter cuyo código se diferencia del primero tantas unidades como hayamos sumado o restado.  

```java
    char c = 'A';
    c = c + 1; // c = 'B'
```

* La resta de dos valores de tipo *char*, que produce un valor numérico y representa la diferencia entre los códigos de los dos caracteres. Esto es bastante útil para convertir un carácter en su posición en la tabla ASCII.  

```java
    char c = 'A';
    int n = c - 'A'; // n = 0
```

### Operadores relacionales

Toman como operando valores numéricos y producen como resultado un valor entero. Los operadores relacionales son todos binarios:

* *==*  Devuelve verdadero si los dos operandos son iguales.
* *!=*  Devuelve verdadero si los dos operandos son diferentes.
* *<* Devuelve verdadero si el primer operando es menor que el segundo.
* *<=*  Devuelve verdadero si el primer operando es menor o igual que el segundo.
* *\>*  Devuelve verdadero si el primer operando es mayor que el segundo.
* *\>=* Devuelve verdadero si el primer operando es mayor o igual que el segundo.

```text
    Si i,j,k son variables enteras, con valores 3, 4 y 5 respectivamente, entonces:
    i == j es falso
    i != j es verdadero
    i < j es verdadero
    i <= j es verdadero
    i > j es falso
    i >= j es falso
```

Conviene recordar que las variables de tipo *char* también son tipos numéricos, por lo que se pueden utilizar en operaciones relacionales. En este caso, se comparan los códigos ASCII de los caracteres. Para el código ASCII, y en general para cualquier sistema de codificación de caracteres, se pueden establecer las siguientes relaciones:

* '0' < '1' < ... < '9'
* 'A' < 'B' < ... < 'Z'
* 'a' < 'b' < ... < 'z'

Cuando se utilizan los operadores de relación de igualdad o desigualdad con operandos con decimales, hay que tener cuidado con la precisión de estos, puesto que puede ser que el resultado esperado no sea exactamente el obtenido.

```text
    Por ejemplo, si se compara 0.1 + 0.2 == 0.3, el resultado será falso, ya que el resultado de la suma no es exactamente 0.3, sino un valor muy próximo.
```

### Operadores lógicos

Tomando operandos numéricos, producen como resultado un valor lógico. Los operadores lógicos son todos binarios:

* *&&* Representa el Y de la lógica proposicional; es decir, devuelve verdadero si ambos operandos son verdaderos.
* *||* Representa el O de la lógica proposicional; es decir, devuelve verdadero si al menos uno de los operandos es verdadero.
* *!* Representa el NO de la lógica proposional; es decir, si el operando es verdadero, devuelve falso, y si el operando es falso, devuelve verdadero.

```text
    Si i,j,k son variables enteras, con valores 3, 4 y 5 respectivamente, entonces:
    i < j && j < k es verdadero
    i < j || j > k es verdadero
    !(i < j) es falso
```

### Operadores de manejo de bits

Sólo admiten operandos de tipo entero, y se aplican bit a bit. Los operadores de manejo de bits son:

* *~* Operador de negación bit a bit. Invierte los bits de un operando.
* *&* Operador de conjunción bit a bit. Realiza la operación lógica AND bit a bit.
* *|* Operador de disyunción bit a bit. Realiza la operación lógica OR bit a bit.
* *^* Operador de disyunción exclusiva bit a bit. Realiza la operación lógica XOR bit a bit.
* *<<* Operador de desplazamiento a la izquierda. Desplaza los bits de un operando a la izquierda un número de posiciones determinado.
* *>>* Operador de desplazamiento a la derecha. Desplaza los bits de un operando a la derecha un número de posiciones determinado.

Lo mejor para utilizar correctamente estos operadores es obtener la representación binaria de los operandos y aplicar la operación bit a bit, y luego volver a convertir el resultado a decimal.

```text
    ~126 = ~0111 1110 = 100 0001 = -127
    126 & 3 = 0111 1110 & 0000 0011 = 0000 0010 = 2
    126 | 3 = 0111 1110 | 0000 0011 = 0111 1111 = 127
    126 ^ 3 = 0111 1110 ^ 0000 0011 = 0111 1101 = 125
    126 << 2 = 0111 1110 << 2 = 1111 1000 = 504
    126 >> 2 = 0111 1110 >> 2 = 0001 1111 = 31
```

### Operadores de asignación

El operador de asignación admite dos operandos, el de la izquierda debe ser un identificador de variable, mientras que el de la derecha puede ser una constante, una variable o una expresión. El operador de asignación se representa con el símobolo *=*.

Una particularidad de este operador es que se evalúa de derecha a izquierda, por lo que las asignaciones de más a la derecha se realizan antes que las de más a la izquierda.

Cuando se realiza la asignación, el resultado de la expresión se convierte al tipo del operando de la izquierda. Si el tipo del operando de la izquierda es de mayor rango que el de la derecha, no hay ningún problema. Sin embargo, si es al revés sí pueden producirse alteraciones en los valores de los datos:

* Si un tipo entero se asigna a otro tipo entreo de menor rango, se produce un desbordamiento debido a que se copian los bits menos significativos del operando de la derecha en el operando de la izquierda.
* Si un valor flotante se asigna a una variable de tipo entero, se trunca el valor flotante, es decir, se pierde la parte decimal del valor flotante.
* Si un valor flotante se asigna a una variable flotante, se produce un redondeo que será tanto mayor cuanto menor sea la precisión del tipo de la variable.

```text
    int i = 3;
    float f = 3.14;
    i = f; // i = 3
    f = i; // f = 3.0
```

Es importante destacar que las asignaciones que puedad dar lugar a pérdida de información (por redondeo o truncado) no son ilegales, y por lo tanto el compilador nos va a dejar realizarlas; pero deben realizarse con muchísimo cuidado.

Existen operadores que permiten simultáneamente realizar una operación con una variable, y asignar el resultado a la misma variable. Estos operadores son los operadores de asignación compacta. Los operadores de asignación compacta son:

* *+=* Operador de asignación de suma. Suma el operando de la derecha al operando de la izquierda y asigna el resultado al operando de la izquierda.
* *-=* Operador de asignación de resta. Resta el operando de la derecha al operando de la izquierda y asigna el resultado al operando de la izquierda.
* **=* Operador de asignación de multiplicación. Multiplica el operando de la derecha por el operando de la izquierda y asigna el resultado al operando de la izquierda.
* */* Operador de asignación de división. Divide el operando de la izquierda por el operando de la derecha y asigna el resultado al operando de la izquierda.
* *%=* Operador de asignación de módulo. Calcula el resto de la división entera del operando de la izquierda por el operando de la derecha y asigna el resultado al operando de la izquierda.

```text
    int i = 3;
    i += 2; // i = 5
    i -= 1; // i = 4
    i *= 3; // i = 12
    i /= 4; // i = 3
    i %= 2; // i = 1
```

Es importante no perder la vista que en la asignación compacta, primero se evalúa la operación y luego se asigna el resultado a la variable. Por lo tanto, si se realiza una operación con una variable y se asigna el resultado a la misma variable, el resultado puede ser diferente al esperado.

```text
    La expresión x = x * y / z; es diferente de x *= y / z;
    Ya que si desglosamos la primera expresión, primero se evalúa x * y, y luego se divide el resultado por z. En cambio, en la segunda expresión, primero se evalúa x * y / z, y luego se asigna el resultado a x.
```

Ya hemos visto que cuando se trata de una asignación, se realiza una conversión de tipos, de forma que el resultado de evaluar la expresión se convierte al tipo de la variable antes de realizar la asignación. Hay situaciones en las que es necesario realizar un cambio de tipo sin necesidad de realizar una asignación. Para ello, se utilizan los operadores de conversión de tipo. Suele aparecer en la literatura como *casting*.

```java
    int i = 3;
    float f = 3.14;
    i = (int)f; // i = 3
    f = (float)i; // f = 3.0
```

### Operadores de condición

Los operadores de condición son operadores ternarios, es decir, que toman tres operandos. Los operadores de condición son:

* *?* Operador de condición. Evalúa el operando de la izquierda y, si es verdadero, devuelve el operando de la derecha; si es falso, devuelve el operando de la derecha.
* *:* Operador de condición. Se utiliza para separar los operandos del operador de condición.

```java
    int i = 3;
    int j = 4;
    int k = i < j ? i : j; // k = 3
```

### Reglas de prioridad

Los operadores tienen reglas de precedencia (o prioridad) y asociatividad que determinan exactamente la forma de evaluar las expresiones.

La precedencia de los operadores determina el orden en el que se evalúan los operadores en una expresión. Los operadores con mayor precedencia se evalúan antes que los operadores con menor precedencia. Si dos operadores tienen la misma precedencia, se evalúan de izquierda a derecha.

La asociatividad de los operadores determina el orden en el que se evalúan los operadores con la misma precedencia. Los operadores con asociatividad izquierda se evalúan de izquierda a derecha, mientras que los operadores con asociatividad derecha se evalúan de derecha a izquierda.

| Prioridad | Operador | Asociatividad | Descripción |
|-----------|----------|---------------|-------------|
| 1         | ()       | Izquierda     | Paréntesis  |
| 2         | ++, --   | Izquierda     | Operadores unarios postfijos |
| 3         | ()       | Izquierda     | Operadores de llamadas a funciones |
| 4         | [], ., -> | Izquierda    | Operadores de tablas y estructuras |
| 5         | +, -, !, ~, ++, -- | Derecha | Operadores unarios prefijos |
| 6         | *, /, %  | Izquierda     | Operadores de multiplicación y división |
| 7         | +, -     | Izquierda     | Operadores de suma y resta |
| 8         | <<, >>   | Izquierda     | Operadores de desplazamiento |
| 9         | <, <=, >, >= | Izquierda | Operadores de relación |
| 10        | ==, !=   | Izquierda     | Operadores de igualdad |
| 11        | &        | Izquierda     | Operadores de conjunción |
| 12        | \|       | Izquierda     | Operadores de disyunción |
| 13        | ^        | Izquierda     | Operadores de disyunción exclusiva |
| 14        | &&       | Izquierda     | Operadores de conjunción lógica |
| 15        | \|\|     | Izquierda     | Operadores de disyunción lógica |
| 16        | ?:       | Derecha       | Operadores de condición |
| 17        | =, +=, -=, *=, /=, %= | Derecha | Operadores de asignación |

## Estructuras de control

Hasta ahora las instrucciones seguían una estructura secuencial: se ejecutaba una sentencia, tras la finalización se ejecutaba la siguiente, y así sucesivamente hasta alcanzar el final del programa. Sin embargo, en la mayoría de los programas es necesario tomar decisiones o repetir un conjunto de instrucciones. Para ello, se utilizan las estructuras de control.

Las estructuras de control se dividen en tres categorías: estructuras secuenciales, estructuras condicionales y estructuras repetitivas. Se debe evitar el uso de cualquier otra estructura ya que conduce a un código no estructurado. Esto no supone ninguna limitación a la hora de escribir un programa, ya que cualquier algoritmo se puede expresar utilizando únicamente estas tres estructuras.

En concreto se deben evitar las instrucciones de salto incondicional, como *goto*, ya que dificultan la comprensión del código y la detección de errores. Además, las instrucciones de salto incondicional pueden provocar la ejecución de instrucciones fuera de su contexto, lo que puede llevar a resultados inesperados. También se deben evitar las sentencias de salto condicional, como *break* o *continue*, ya que dificultan la comprensión del código y la detección de errores.

### Estructuras secuenciales

Las sentencias se ejecutan en el orden en el que aparecen en el programa. La ejecución de una sentencia no depende de la ejecución de otra sentencia. Las estructuras secuenciales se utilizan para ejecutar un conjunto de instrucciones en un orden determinado.

```java
    int i = 3;
    int j = 4;
    int k = i + j;
```

### Estructuras condicionales

También conocidas como estructuras de selección, se utilizan para tomar decisiones en un programa. Las estructuras condicionales se dividen en dos tipos: estructuras condicionales simples y estructuras condicionales compuestas.

Las estructuras condicionales simples se utilizan para ejecutar un conjunto de instrucciones si se cumple una condición. Las estructuras condicionales simples se dividen en dos tipos: estructuras condicionales simples con una sola alternativa y estructuras condicionales simples con dos alternativas.

<div align="center">
  <img src="/assets/img/curso-programacion/if-else.png" alt="if-else" width="50%"/>
</div>

```java
    int i = 3;
    int j = 4;
    if (i < j) {
        System.out.println("i es menor que j");
    }
```

Estas sentencias se pueden anidar para realizar una selección múltiple. En este caso, se evalúan las condiciones en orden y se ejecuta el bloque de instrucciones correspondiente a la primera condición que se cumpla.

```java
    // Ejemplo de cálculo de año bisiesto
    int año = 2020;
    if (año % 4 == 0) {
        if (año % 100 != 0 || año % 400 == 0) {
            System.out.println("El año es bisiesto");
        } else {
            System.out.println("El año no es bisiesto");
        }
    } else {
        System.out.println("El año no es bisiesto");
    }
```

Las estructuras condicionales compuestas se utilizan para ejecutar un conjunto de instrucciones si se cumple una condición y otro conjunto de instrucciones si no se cumple la condición. Las estructuras condicionales compuestas se dividen en dos tipos: estructuras condicionales compuestas con una sola alternativa y estructuras condicionales compuestas con dos alternativas.

<div align="center">
  <img src="/assets/img/curso-programacion/switch-case.png" alt="switch-case" width="50%"/>
</div>

El funcionamiento de esta estructura es el siguiente:

1. Se evalúa la expresión que acompaña a la sentencia *switch*. Esta expresión debe ser de tipo entero, carácter o enumerado.
2. Se compara el valor de la expresión con el valor de cada una de las etiquetas *case*. Si se encuentra una coincidencia, se ejecutan las instrucciones asociadas a esa etiqueta. Estos valores deberán ser siempre expresiones constantes enteras.

Existe una etiqueta especial, *default*, que se ejecuta si no se encuentra ninguna coincidencia. La etiqueta *default* es opcional y se puede colocar en cualquier posición dentro de la sentencia *switch*.

```java
    // Programa que lea un número de mes e indique cuántos días tiene
    int mes = 2;
    switch (mes) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            System.out.println("El mes tiene 31 días");
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            System.out.println("El mes tiene 30 días");
            break;
        case 2:
            System.out.println("El mes tiene 28 o 29 días");
            break;
        default:
            System.out.println("Mes incorrecto");
    }
```

### Estructuras repetitivas

En este tipo de estructuras, se repite un conjunto de instrucciones en función de una condición. La principal diferencia entre las diferentes estructuras repetitivas consiste en qué punto se realiza la comprobación de la condición.

La sentencia *while* se utiliza para repetir un conjunto de instrucciones mientras se cumpla una condición. La condición se evalúa antes de ejecutar el bloque de instrucciones.

<div align="center">
  <img src="/assets/img/curso-programacion/while.png" alt="while" width="50%"/>
</div>

El funcionamiento es el siguiente:

1. Se evalúa la expresión que acompaña a la sentencia *while*. Si la expresión es verdadera, se ejecutan las instrucciones del bloque.
2. Se vuelve a evaluar la expresión. Si la expresión es verdadera, se ejecutan las instrucciones del bloque. Este proceso se repite hasta que la expresión sea falsa.

Es importante destacar que puede que el bloque que acompaña a la sentencia *while* no se ejecute nunca si la condición es falsa desde el principio. Además alguno de los valores que determinan la condición de salida del bucle deben cambiar en algún momento para que el bucle no sea infinito.

En la condición, es conveniente utilizar los operadores de rango (>, <, >=, <=) en lugar de los operadores de igualdad (==, !=) para evitar problemas de precisión.

```java
    // Programa que copia la entrada estándar en la salida estándar
    char c;
    while ((c = System.in.read()) != -1) {
        System.out.write(c);
    }
```

En las estructuras repetitivas en general, y como caso en particular en la sentencia *while*, es de especial importancia comprobar que los valores extermos de la condición de salida del bucle son correctos. Para ello es de gran utilizad repasar mentalmente el bucle con los valores extremos y comprobar que el bucle se comporta como se espera.

```text
Veamos un ejemplo en el que se pretende imprimir los números del 1 al 10. Si la condición de salida del bucle es i < 10, el bucle se ejecutará 9 veces, ya que el valor 10 no se imprimirá. Por el contrario, si la condición de salida del bucle es i <= 10, el bucle se ejecutará 10 veces, y se imprimirán los números del 1 al 10.
```

La sentencia *do-while* se utiliza para repetir un conjunto de instrucciones mientras se cumpla una condición. La condición se evalúa después de ejecutar el bloque de instrucciones.

<div align="center">
  <img src="/assets/img/curso-programacion/do-while.png" alt="do-while" width="50%"/>
</div>

A diferencia de la sentencia *while*, la sentencia *do-while* garantiza que el bloque de instrucciones se ejecuta al menos una vez. Esto es útil cuando se quiere ejecutar un bloque de instrucciones al menos una vez, independientemente de la condición.

```java
    // Programa que imprime los números del 1 al 10
    int i = 1;
    do {
        System.out.println(i);
        i++;
    } while (i <= 10);
```

La sentencia *for* se utiliza para repetir un conjunto de instrucciones un número determinado de veces. La sentencia *for* se compone de tres partes: la inicialización, la condición y la actualización.

<div align="center">
  <img src="/assets/img/curso-programacion/for.png" alt="for" width="50%"/>
</div>

El funcionamiento es el siguiente:

1. Se ejecuta la inicialización.
2. Se evalúa la condición. Si la condición es verdadera, se ejecutan las instrucciones del bloque.
3. Se ejecuta la actualización.
4. Se vuelve a evaluar la condición. Si la condición es verdadera, se ejecutan las instrucciones del bloque. Este proceso se repite hasta que la condición sea falsa.

La sentencia *for* es especialmente útil cuando se conoce el número de iteraciones que se van a realizar, ya que permite agrupar la inicialización, la condición y la actualización en un solo lugar.

En la sentencia *for*, la inicialización y la actualización son opcionales. Si no se especifican, se consideran vacías. La condición también es opcional. Si no se especifica, se considera verdadera.

```java
    // Programa que imprime los números del 1 al 10
    for (int i = 1; i <= 10; i++) {
        System.out.println(i);
    }
```
