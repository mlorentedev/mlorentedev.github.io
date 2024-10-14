---
layout: post
title: Introducción a la programación 2
date: "2024-01-28"
categories: 
  - "DevOps"
  - "Fundamentos de la programación"
tags: 
  - "course"
  - "programming"
readtime: true
lang-ref: intro
---

## Funciones

Para resolver un programa es fundamental descomponerlo en problemas más pequeños, puesto que la resolución de cada uno de estos sería más fácil. También hay situaciones en las que una tarea tiene que realizarse más de una vez dentro de un programa; en estos casos, interesa escribir el código una sola vez, y poder ejecutarlo tantas veces como sea preciso.

Tanto una cosa como la otra se consiguen mediante el uso de funciones. Una función es un conjunto de instrucciones que se agrupan bajo un nombre y que se pueden invocar desde cualquier parte del programa. Las funciones se utilizan para dividir un programa en tareas más pequeñas y para reutilizar el código.

Un aspecto importante a cosinderar es que el hilo de ejecución no se pierde. Cuando desde un punto del programa llamamos a una función, la ejecuciñon sigue en el punto en que hemos definido la función; cuando esta última termina, la ejecución vuelve al punte dese el que se llamó a la función, continuando la ejecución normal. Este mecanismo puede repetise de forma reiterada, de forma que una función puede llamar a otra función, que a su vez puede llamar a otra función, y así sucesivamente... pero siempre manteniendo que tras la finalización de la ejecución de una función, el hilo de ejcución vuelve a la función que hizo la llamada.

<div align="center">
  <img src="/assets/img/curso-programacion/funciones.png" alt="funciones"/>
</div>

Esto significa que todas las funciones están definidas al mismo nivel, en el más exterior dentro de un fichero, y por lo tanto su visibilidad y el alcance son los mismoq ue los de las variables definidas a ese nivel.

Un programa en general, es un conjunto de funciones que se llaman entre sí. En la mayoría de los lenguajes de programación, un programa tiene una función principal, que es la función que se ejecuta al inicio de la ejecución del programa. En algunos lenguajes como C y Java, la función principal se llama *main*. Un programa finalizará cuando se temrine la ejecución de la función *main*.

### Definición de funciones

Para poder utilizar funciones dentro de un programa es imprescindible que antes se especifique la tarea  arealizar. Para ello se utiliza la definición de funciones.

La definición de una función consiste en especificar:

* Cómo se llama la función: el *identificador*.
* Los valores, y el tipo de dato al que pertenecen, que necesita para su ejecución: los *parámetros*.
* El tipo del valor que devuelve (si es que devuelve algún valor): el *tipo*.
* Qué es lo que realmente hace: el *cuerpo*.

```java
    int suma(int a, int b) {
        return a + b;
    }
```

El identificador de una función permite identificar de forma única la función a la que estamos haciendo referencia dentro del programa. Para formar el identificador de una función se utilizan los mismos criterior que para formar los identificadores de las variables.  

En un programa no puede haber dos funciones con el mismo identificador, a no ser que las funciones se encuentren en ficheros diferentes y tengan restrinciones de visibilidad. En este caso, se dice que las funciones tienen el mismo nombre pero son funciones diferentes. En algunos lenguajes esto se permite mediante la utilización de la cláusula *static*.

Cuando definimos una función para reutilizarla, es muy importante tener un mecanismo que nos permita modificar los valores utilziados por la función para sus cálculos. Esto se logra con los parámetros. Cada uno de los valores que necesita la función para realizar su tarea se denomina parámetro. Los parámetros se utilizan para pasar valores a la función. Los parámetros se definen en la cabecera de la función, entre paréntesis, separados por comas. Los parámetros se componen de un tipo y un identificador.

El cuerpo de una función lo constituye el bloque en el que se incluyen las sentencias necesarias para realizar el objetivo encomendado. Dependiendo del lengauje de programación, el cuerpo de la función puede estar formado por una o varias sentencias. En el caso de que la función devuelva un valor, la última sentencia del cuerpo de la función debe ser una sentencia de retorno.

El tipo de una función es el tipo del valor que devuelve la función. Si una función no devuelve ningún valor, se dice que la función es de tipo *void*. En este caso, la función no debe contener una sentencia de retorno. Si una función devuelve un valor, la función debe contener una sentencia de retorno. La sentencia de retorno se utiliza para devolver un valor desde la función al punto en el que se llamó a la función.

### Declaración de funciones

Para poder utilizar una función en un programa, es necesario que la función esté definida antes de ser utilizada. Esto significa que la definición de la función debe aparecer antes de la llamada a la función.
En algunos lenguajes de programación, como C, es necesario que la definición de la función aparezca antes de la llamada a la función. En otros lenguajes de programación, como Java, no es necesario que la definición de la función aparezca antes de la llamada a la función.

A la declaración de una función se le llama prototipo de la función. El prototipo de una función se compone del tipo de la función, el identificador de la función y los parámetros de la función. El prototipo de una función se utiliza para indicar al compilador que la función existe y que se va a utilizar en el programa.

```java
    int suma(int a, int b);
```

### Utilización de funciones

Para utilizar una función (o hacer una llamada), escribiremos el identificador de la función, y colocaremos entre paréntesis los valores que deseamos para los parámetros. En general, podremos utilizar como prarámetro cualquier expresión del mismo tipo que el parámetro formal correspondiente.

```java
    int a = 3;
    int b = 4;
    int c = suma(a, b);
```

Cuando se realiza una llamada a una función, antes de comenzar su ejecución se evalúan las expresiones que forman los parámetros reales, y los valores obtenidos se asignan a las variables que representan los parámetros formales. Sólo entonces comienza la ejecución de la función.

La asignación entre parámetros reales y formales se relaiza siempre según el orden en el que aparecen tanto en la llamada como en la definición: el primer parámetro real se asigna al primer parámetro formal, el segundo parámetro real se asigna al segundo parámetro formal, y así sucesivamente. A esto se le llama correspondencia posicional.

Por tanto, es fundamental que el número de parámetros reales coincida con el de parámetros formales, debiendo también coincidir en el orden y en el tipo de ambas clases de parámetros. En algunos lengaujes de programación, es posible que una función tenga un número variable de parámetros. En este caso, se dice que la función tiene parámetros variables o está sobrecargada. Pero esto no es lo habitual.

```java
    int suma(int a, int b) {
        return a + b;
    }
    int a = 3;
    int b = 4;
    int c = suma(a, b);
```

Es importante destacar que los parámetros formales actúan como variables locales, los cambios que se realicen en los parámetros formales no afectan a los parámetros reales. Por tanto, los parámetros reales actúan como constantes, y no se pueden modificar dentro de la función.
Además, puesto que vamos a utilizar los parámetros reales para realizar una asignación sobre los parámetros formales, sólo podremos utilizr como parámetros aquellos elementos que puedan aparecer en el lado derecho de una asignación.

### Recursividad

Un caso particular de llamada a una función es cuando una función se llama a sí misma. A este mecanismo se le llama recursividad. La recursividad es un concepto muy importante en programación, ya que permite resolver problemas de forma más sencilla y elegante.

Esta técnica se aplica problemas que pueden definirse de modo natural de forma recusriva. No todos los problemas admiten soluciones recursivas, y si la admiten muchas veces no son inmediatas. Sí podemos asegurar que toda solución recusriva tiene una solución iterativa equivalente aunque no siempre es inmediato obtenerla.

En las definiciones de funciones recursivas es imprescindible que exista un caso base, es decir, un caso en el que la función no se llame a sí misma. Si no se cumple esta condición, la función se llamará a sí misma de forma indefinida, lo que provocará un error en tiempo de ejecución.

Aunque el código de una función que utiliza técnicas recursivas pueda ser más corto, habitualmente consume más memoria durante la ejecución, y puede llegar a ser más lento en la ejecución que una solución iterativa, debido a que en cada llamada que la función se hace a sí misma es necesario copiar valores en variables y estas ocupan espacio en memoria, tanto más cuanto mayor sea el número de llamadas.

```java
    int factorial(int n) {
        if (n == 0) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }

    // Si se llama a factorial(5), se realizarán las siguientes llamadas:
    // factorial(5) = 5 * factorial(4)
    // factorial(4) = 4 * factorial(3)
    // factorial(3) = 3 * factorial(2)
    // factorial(2) = 2 * factorial(1)
    // factorial(1) = 1 * factorial(0)
    // factorial(0) = 1 (caso base)
```

### Compilación separada

Cuando un programa es muy grade y tiene muchas funciones, suele ser conveniente dividir el programa en varios ficheros. Cada fichero contendrá un conjunto de funciones relacionadas entre sí. A esta técnica se le llama compilación separada.

La compilación separada es un concepto distinto al de la modularidad, aunque muy relacionado: la compilación separada implica necesariamente modularidad, pero un programa modular puede estar compuesto por un único fichero, y por lo tanto no le es de aplicación la compilación separada.

La división del programa en varios ficheros tiene dos considerables ventajas:

* El programa queda más estructurado y organizado.
* Si se necesita modificar un fichero, sólo se compilaría el modificado, para posteriormente enlazarlo con el resto de ficheros.

Cada fichero en los que se descompone un porgrmaa fuente conforma lo que se denomina *unidad de compilación*. Cada unidad de compilación se compila de forma independiente, generando un fichero objeto. Posteriormente, los ficheros objeto se enlazan para formar el programa ejecutable.

## Tablas

Hasta ahora, para representar una magnitud del mundo real en un programa utilizamos las variables. ¿Qué ocurre si necesitamos representar un conjunto de magnitudes? En este caso, utilizaremos las tablas.

Una tabla es un conjunto finito y ordenado de elementos del mismo tipo agrupados bajo le mismo nombre. Su principal caracterísitca es el modo de almacenamiento en memoria: se realiza en posiciones consecutivas. Una característica diferenciadora de las tablas con respecto a otros tipos de datos es que no soportan el operador de asignación ne la mayoría de lenguajes; para asignar una tabla a otra será necesario asignar cada uno de los elementos de la tabla.

### Declaración de tablas

La declaración de una tabla se hace indicando el tipo de todos los elementos de la tabla, seguido del nombre de la variable, seguido del número de elementos encerrados entre corchetes.

Se puede aprovechar la declaración de una tabla para inicializarla. Para ello, se encierran entre llaves los valores de los elementos de la tabla, separados por comas.

```java
    int tabla[5] = {1, 2, 3, 4, 5};
```

La asignación se realiza en orden ascendente del índice, de forma que si no hay suficientes valores para inicializar la tabla, se asignarán valores a los índices más bajos; los elementos para los que no haya valores se inicializarán a 0.

Un caso especial es el de las tablas de caracteres, que se utilizan para almacenar cadenas de caracteres. En este caso, la inicialización se realiza con una cadena de caracteres entre comillas dobles.

```java
    char cadena[] = "Hola";
```

En algunos lengiajes es necesario incluir un carácter especial al final de la cadena, que se llama carácter nulo, y que se representa con el carácter *\0*. Este carácter se utiliza para indicar el final de la cadena.

Es importante especificar que cuando se utilizan funciones de escaneo y de impresión de cadenas, es necesario que la cadena esté terminada con el carácter nulo. Si no se incluye este carácter, la función de escaneo o de impresión de cadenas no funcionará correctamente. Es por ello, que al leer hay que tener en cuenta que el carácter nulo ocupa una posición en la tabla.

### Acceso a elementos de una tabla

Para acceder a un elemento de una tabla, se utiliza el nombre de la tabla, y, encerrado entre corchetes, el índice del elemento al que queremos acceder, sabien que el primer elemento de la tabla tiene índice 0.

Este índice siempre debe ser un valor entero, y puede ser una constante, una variable o una expresión.

```java
    int tabla[5] = {1, 2, 3, 4, 5};
    int a = tabla[2]; // a = 3
```

Puesto que el primer elemento de la tabla tiene índice 0, el último elemento de la tabla tiene índice *n - 1*, siendo *n* el número de elementos de la tabla.

### Recorrido de tablas

Para recorrer los elementos de una tabla, la estructura repetitiva for es la ideal. Nos permite realizar una asignación inicial (que el valor del índice sea cero), una operación tras cada iteración (incrementar el índice una unidad), y una comparación de control (que no se haya superado el límite de la tabla).

```java
    // Veamos un ejemplo que calcula la media de las calificaciones de diez alumnos, que se introducirán por teclado.

    int calificaciones[10];
    float media = 0;
    for (int i = 0; i < 10; i++) {
        System.out.println("Introduce la calificación del alumno " + (i + 1));
        calificaciones[i] = System.in.read();
        media += calificaciones[i];
    }
    media /= 10;
    System.out.println("La media de las calificaciones es " + media);

    // Obsérvese que la función System.in.read() devuelve un valor entero, por lo que la calificación se almacena en un entero y que en la condición de control del bucle se compara con 10, que es el número de elementos de la tabla, y no i <= 10, puesto que el índice del último elemento de la tabla es 9.
```

### Utilización de constantes simbólicas

En ocasiones, la dimensión de una tabla es un valor que se utiliza más de una vez: tenemos que declarar la tabla, inicializarla, recorrerla... En estos casos, es conveniente utilizar una constante simbólica, que es un identificador que representa un valor constante.

También es importante que el nombre de la constante simbólica sea significativo, de forma que se pueda identificar fácilmente el valor que representa en el programa.

```java
    // El siguiente programa calcula las calificaciones ponderadas de un curso.

    int calificaciones[TAM_CALIFICACIONES];
    float ponderaciones[TAM_CALIFICACIONES] = {0.1, 0.2, 0.3, 0.4};
    float media = 0;
    for (int i = 0; i < TAM_CALIFICACIONES; i++) {
        System.out.println("Introduce la calificación del alumno " + (i + 1));
        calificaciones[i] = System.in.read();
        media += calificaciones[i] * ponderaciones[i];
    }
```

### Tablas multidimensionales

Hasta ahora, hemos visto tablas de una dimensión, es decir, tablas que tienen un único índice. Sin embargo, en ocasiones necesitamos representar información que tiene más de una dimensión. Para ello, utilizamos tablas multidimensionales.

La principal característica de las tablas multidimensionales es que se almacenan en memoria de forma bidimensional, es decir, en filas y columnas.

Para declarar una tabla multidimensional, se indica el tipo de todos los elementos de la tabla, seguido del nombre de la variable, seguido de los números de elementos de cada dimensión encerrados entre corchetes.

```java
    int tabla[3][4] = {
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12}
    };
```

Es importante recordar que en las tablas multidimensionales, la primera dimensión se corresponde con las filas, y la segunda dimensión se corresponde con las columnas. Por tanto, el primer índice se refiere a la fila, y el segundo índice se refiere a la columna. Además, al inicializar una tabla multidimensional, se pueden omitir los corchetes interiores, es decir, únicamente puede suprimirse el primero de los índices, y sólo ése.

```java
    int tabla[3][4] = {
        1, 2, 3, 4,
        5, 6, 7, 8,
        9, 10, 11, 12
    };

    // En este caso, la tabla se inicializa de la misma forma que en el ejemplo anterior.
```

Las tablas pueden pasarse como parámetros a las funciones. Cuandos e hace esto, lo que realmente se pasa como parámetro es la dirección al primer elemento de la tabla, y no la tabla en sí misma, esto es consecuencia de la no existencia del operador asignación para las tablas.

Puesto que el tamaño de la tabla no va implíctio en la misma, siempre que se pase una tabla como parámetro a una fucnión será necesario pasar también el tamaño de la tabla.

```java
    void imprime_tabla(int tabla[][4], int filas) {
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.print(tabla[i][j] + " ");
            }
            System.out.println();
        }
    }
```

## Tipos agregados

### Estructuras de datos

Una estructura es un conjunto finito de elementos de cualquier tipo agrupados bajo un mismo nombre. Las estructuras se utilizan para agrupar datos relacionados entre sí. Las estructuras se utilizan para representar un objeto del mundo real en un programa.

A cada elemento de la estructura se le denomina campo. Al contrario de lo que sucede con las tablas, no puede asegurarse en ningún caso que los campos de una estructura se almacenen en posiciones consecutivas de memoria.

Para declarar una estructura, se utiliza la palabra reservada *struct*, seguida del nombre de la estructura, y entre llaves, los campos de la estructura.

En lenguajes como Java, las estructuras se conocen como clases, y se definen de forma distinta. En Java, las clases se utilizan para agrupar datos y métodos relacionados entre sí.

```java
    class alumno {
        char nombre[20];
        int edad;
        float nota;
    };
```

### Enumeraciones

En muchas situaciones, necesitamos que una variable pueda tener un valor dentro de un conjunto finito de valores. Para representar este tipo de variables, utilizamos las enumeraciones.

Dicho tipo nos permite definir un conjunto de valores que representarán algún parámetro cuyos valores sean discretos y finitos. Por ejemplo, los días de la semana, los meses del año, los colores, etc.

Para declarar una enumeración, se utiliza la palabra reservada *enum*, seguida del nombre de la enumeración, y entre llaves, los valores de la enumeración.

```java
    enum dias_semana {
        lunes, martes, miercoles, jueves, viernes, sabado, domingo
    };
```

## Entrada y salida

Muchas aplicaciones requieren escribir o leer información de un dispositivo de entrada/salida. En Java, la entrada y salida se realiza a través de flujos de datos. Un flujo de datos es una secuencia de datos que se transfiere de un lugar a otro. En Java, los flujos de datos se utilizan para leer y escribir datos en un dispositivo de entrada/salida.

### Entrada de datos

La entrada de datos se realiza a través de la clase *Scanner*. La clase *Scanner* se utiliza para leer datos de la entrada estándar. Para utilizar la clase *Scanner*, es necesario importar la clase *Scanner* del paquete *java.util*.

```java
    import java.util.Scanner;

    Scanner sc = new Scanner(System.in);

    int a = sc.nextInt();
    float b = sc.nextFloat();
    String c = sc.nextLine();
```

### Salida de datos

La salida de datos se realiza a través de la clase *System.out*. La clase *System.out* se utiliza para escribir datos en la salida estándar. Para utilizar la clase *System.out*, es necesario importar la clase *System* del paquete *java.lang*.

```java
    System.out.println("Hola, mundo!");
```

### Formateo de datos

El formateo de datos se realiza a través de la clase *String*. La clase *String* se utiliza para formatear datos en una cadena de caracteres. Para utilizar la clase *String*, es necesario importar la clase *String* del paquete *java.lang*.

```java
    int a = 3;
    float b = 4.5;
    String c = "Hola";
    String d = String.format("a = %d, b = %f, c = %s", a, b, c);
```

### Archivos

La entrada y salida de archivos se realiza a través de la clase *File*. La clase *File* se utiliza para leer y escribir archivos en un dispositivo de entrada/salida. Para utilizar la clase *File*, es necesario importar la clase *File* del paquete *java.io*.

```java
    import java.io.File;

    File f = new File("archivo.txt");
```

## El sistema operativo UNIX

A continuación, se describen los conceptos básicos del sistema operativo UNIX. Aunque las explicaciones de los comandos se refieren al sistema operativo linux, casi en su totalidad son aplicables a cualquier sistema operativo UNIX.

### Estructura de directorios y sistema de ficheros

Los ficheros sirven para guardar informaciñon, y normalmente están almacenados en disco. Todo el sistema UNIX está basado en ficheros. Cada fichero tiene un nombre, un contenido, un lugar para almacenarlo y cierta información de tipo administrativo, como por ejemplo, quién es el dueño y cuál es su tamaño.

El nombre de un fichero puede tener hasta 255 caracteres, y puede contener cualquier carácter, excepto el carácter barra inclinada (/) y el carácter nulo. Los nombres de los ficheros son sensibles a mayúsculas y minúsculas.

La estructura de directorios de UNIX es jerárquica, y se representa mediante un árbol. El directorio raíz del sistema se representa por una barra inclinada (/). Cada directorio puede contener ficheros y otros directorios. Los directorios se utilizan para organizar los ficheros en grupos lógicos.

Cada usuario tiene un directorio de trabajo, que es el directorio en el que se encuentra cuando inicia sesión en el sistema. El directorio de trabajo se representa por un punto (.) y el directorio padre se representa por dos puntos (..).

Para seleccionar un fichero dentro de una estructura de directorios, se utiliza una ruta. La ruta de un fichero se compone de una secuencia de nombres de directorios separados por barras inclinadas (/). La ruta de un fichero puede ser absoluta o relativa. Podemos utilizar cualquiera de los tres métodos siguientes:

* Ruta absoluta: se inicia en el directorio raíz del sistema.
* Ruta relativa: se inicia en el directorio de trabajo del usuario.
* Ruta relativa: se inicia en el directorio actual.

```bash
    # Ejemplo de rutas absolutas
    /home/usuario/fichero
    # Ejemplo de rutas relativas
    fichero
    # Ejemplo de rutas relativas
    ./fichero
```

En los sistemas operativos de tipo UNIX los ficheros y directorios presentan tres propiedades especiales: el propietario, el grupo y los permisos. El propietario es la persona que creó el fichero o directorio. El grupo es un conjunto de usuarios que tienen permisos para acceder al fichero o directorio. Los permisos son las acciones que se pueden realizar sobre el fichero o directorio.

Los tipos de permisos son:

* Lectura (r): permite leer el contenido del fichero o directorio.
* Escritura (w): permite modificar el contenido del fichero o directorio.
* Ejecución (x): permite ejecutar el fichero o acceder al directorio.

Y los conjuntos de permisos son:

* Propietario: el propietario del fichero o directorio.
* Grupo: el grupo al que pertenece el fichero o directorio.
* Otros: el resto de usuarios del sistema.

Dentro de cada conjunto, el primer carácater indica el tipo de fichero o directorio, y los tres siguientes caracteres indican los permisos del propietario, del grupo y de los otros usuarios.

```bash
    # Ejemplo de permisos. En este caso, el fichero tiene permisos de lectura y escritura para el propietario, y permisos de lectura para el grupo y para los otros usuarios.
    -rw-r--r-- 1 usuario grupo 0 ene 1 00:00 fichero
```

### Formato general de las órdenes

El procesador de órdenes (también conocido como *shell* o intérprete de comandos) es un programa que permite al usuario interactuar con el sistema operativo. El procesador de órdenes se utiliza para ejecutar comandos y programas, y para realizar tareas de administración del sistema.

El formato general de las órdenes es el siguiente:

* Comando: es el nombre del comando que se desea ejecutar.
* Opciones: son modificadores que se utilizan para cambiar el comportamiento del comando.
* Argumentos: son los valores que se pasan al comando para que realice su tarea.

```bash
    # Ejemplo de formato general de las órdenes
    comando -opciones argumentos
```

Los corchetes angulares (<>) se utilizan para indicar que el usuario debe sustituir el valor por el valor real. Los corchetes cuadrados ([]) se utilizan para indicar que el argumento es opcional.

```bash
    # Ejemplo de formato con corchetes
    comando [-opciones] <argumentos>
```

Las órdenes se pueden ejecutar de forma interactiva o en lotes. En la ejecución interactiva, el usuario introduce las órdenes una a una, y el sistema responde inmediatamente. En la ejecución en lotes, el usuario introduce las órdenes en un fichero, y el sistema las ejecuta secuencialmente.

### Ayuda en línea

El sistema operativo UNIX dispone de un sistema de ayuda en línea que permite al usuario obtener información sobre los comandos y programas del sistema. La ayuda en línea se utiliza para obtener información sobre el uso de los comandos, las opciones disponibles y los argumentos que se pueden utilizar.

La ayuda en línea se obtiene a través del comando `man`. El comando `man` se utiliza para mostrar las páginas del manual del sistema. Para obtener información sobre un comando, se utiliza el comando `man` seguido del nombre del comando.

```bash
    # Ejemplo de ayuda en línea
    man pwd
```

### Comandos básicos

El sistema operativo UNIX dispone de un conjunto de comandos básicos que se utilizan para realizar tareas de administración del sistema. Los comandos básicos se utilizan para gestionar los ficheros y directorios del sistema, y para realizar tareas de administración del sistema.

Los comandos básicos se utilizan para realizar tareas como:

* Navegar por el sistema de ficheros.
* Crear, modificar y eliminar ficheros y directorios.
* Cambiar los permisos de los ficheros y directorios.
* Visualizar el contenido de los ficheros.
* Comprimir y descomprimir ficheros.
* Copiar, mover y renombrar ficheros y directorios.
* Buscar ficheros y directorios.
* Mostrar información del sistema.

### Navegación por el sistema de ficheros

El comando `pwd` se utiliza para mostrar el directorio de trabajo actual. El directorio de trabajo es el directorio en el que se encuentra el usuario cuando inicia sesión en el sistema.

```bash
    pwd
```

El comando `cd` se utiliza para cambiar de directorio. El comando `cd` se utiliza para moverse por el sistema de ficheros. Para cambiar al directorio raíz del sistema, se utiliza el comando `cd` seguido de una barra inclinada (/).

```bash
    # Cambiar al directorio raíz del sistema
    cd /
```

El comando `ls` se utiliza para mostrar el contenido de un directorio. El comando `ls` se utiliza para listar los ficheros y directorios de un directorio. Para mostrar los ficheros y directorios ocultos, se utiliza el comando `ls` seguido de la opción `-a`.

```bash
    # Mostrar el contenido del directorio actual
    ls
    # Mostrar el contenido del directorio actual, incluyendo los ficheros y directorios ocultos
    ls -a
```

### Creación, modificación y eliminación de ficheros y directorios

El comando `touch` se utiliza para crear un fichero vacío. El comando `touch` se utiliza para crear un fichero vacío en el directorio actual. Si el fichero ya existe, se actualiza la fecha de modificación del fichero.

```bash
    touch fichero
```

El comando `mkdir` se utiliza para crear un directorio. El comando `mkdir` se utiliza para crear un directorio en el directorio actual. Si el directorio ya existe, se muestra un mensaje de error.

```bash
    mkdir directorio
```

El comando `rm` se utiliza para eliminar un fichero o directorio. El comando `rm` se utiliza para eliminar un fichero o directorio en el directorio actual. Si el fichero o directorio no existe, se muestra un mensaje de error.

```bash
    # Eliminar un fichero
    rm fichero
    # Eliminar un directorio
    rm -r directorio
```

### Cambio de permisos de ficheros y directorios

El comando `chmod` se utiliza para cambiar los permisos de un fichero o directorio. El comando `chmod` se utiliza para cambiar los permisos de un fichero o directorio en el directorio actual. Los permisos se especifican mediante un número octal.

El número octal se compone de tres dígitos, que representan los permisos del propietario, del grupo y de los otros usuarios. Cada dígito se compone de tres bits, que representan los permisos de lectura, escritura y ejecución.

```bash
    # Cambiar los permisos de un fichero a lectura y escritura para el propietario, y a lectura para el grupo y para los otros usuarios
    chmod 644 fichero
    # Cambiar los permisos de un directorio a lectura, escritura y ejecución para el propietario, y a lectura y ejecución para el grupo y para los otros usuarios
    chmod 755 directorio
```

### Visualización del contenido de los ficheros

El comando `cat` se utiliza para mostrar el contenido de un fichero. El comando `cat` se utiliza para mostrar el contenido de un fichero en la salida estándar. Si el fichero es muy grande, el comando `cat` mostrará el contenido del fichero por pantalla.

```bash
    cat fichero
```

El comando `more` se utiliza para mostrar el contenido de un fichero por páginas. El comando `more` se utiliza para mostrar el contenido de un fichero por páginas en la salida estándar. Si el fichero es muy grande, el comando `more` mostrará el contenido del fichero por páginas.

```bash
    more fichero
```

El comando `less` se utiliza para mostrar el contenido de un fichero por páginas. El comando `less` se utiliza para mostrar el contenido de un fichero por páginas en la salida estándar. Si el fichero es muy grande, el comando `less` mostrará el contenido del fichero por páginas.

```bash
    less fichero
```

### Comprimir y descomprimir ficheros

El comando `gzip` se utiliza para comprimir un fichero. El comando `gzip` se utiliza para comprimir un fichero en el directorio actual. El comando `gzip` crea un fichero comprimido con la extensión `.gz`.

```bash
    gzip fichero
```

El comando `gunzip` se utiliza para descomprimir un fichero. El comando `gunzip` se utiliza para descomprimir un fichero en el directorio actual. El comando `gunzip` crea un fichero descomprimido sin la extensión `.gz`.

```bash
    gunzip fichero.gz
```

El comando `tar` se utiliza para crear un archivo tar. El comando `tar` se utiliza para crear un archivo tar en el directorio actual. El comando `tar` crea un archivo tar con los ficheros y directorios especificados.

```bash
    tar -cvf archivo.tar fichero1 fichero2 directorio
```

El comando `tar` se utiliza para extraer un archivo tar. El comando `tar` se utiliza para extraer un archivo tar en el directorio actual. El comando `tar` extrae un archivo tar con los ficheros y directorios especificados.

```bash
    tar -xvf archivo.tar
```

### Copia, movimiento y renombrado de ficheros y directorios

El comando `cp` se utiliza para copiar un fichero o directorio. El comando `cp` se utiliza para copiar un fichero o directorio en el directorio actual. El comando `cp` crea una copia del fichero o directorio con el nombre especificado.

```bash
    # Copiar un fichero
    cp fichero1 fichero2
    # Copiar un directorio
    cp -r directorio1 directorio2
```

El comando `mv` se utiliza para mover un fichero o directorio. El comando `mv` se utiliza para mover un fichero o directorio en el directorio actual. El comando `mv` mueve el fichero o directorio con el nombre especificado.

```bash
    # Mover un fichero
    mv fichero1 fichero2
    # Mover un directorio
    mv directorio1 directorio2
```

El comando `mv` se utiliza para renombrar un fichero o directorio. El comando `mv` se utiliza para renombrar un fichero o directorio en el directorio actual. El comando `mv` renombra el fichero o directorio con el nombre especificado.

```bash
    # Renombrar un fichero
    mv fichero1 fichero2
    # Renombrar un directorio
    mv directorio1 directorio2
```

### Búsqueda de ficheros y directorios

El comando `find` se utiliza para buscar ficheros y directorios. El comando `find` se utiliza para buscar ficheros y directorios en el sistema de ficheros. El comando `find` busca los ficheros y directorios que coinciden con los criterios especificados.

```bash
    # Buscar ficheros y directorios en el directorio actual
    find . -name fichero
    # Buscar ficheros y directorios en el directorio actual y en los subdirectorios
    find . -name fichero -type f
```

El comando `grep` se utiliza para buscar texto en los ficheros. El comando `grep` se utiliza para buscar texto en los ficheros del sistema de ficheros. El comando `grep` busca el texto que coincide con los criterios especificados.

```bash
    # Buscar texto en los ficheros del directorio actual
    grep texto fichero
    # Buscar texto en los ficheros del directorio actual y en los subdirectorios
    grep -r texto directorio
```

### Información del sistema

El comando `date` se utiliza para mostrar la fecha y la hora del sistema. El comando `date` se utiliza para mostrar la fecha y la hora del sistema en la salida estándar. El comando `date` muestra la fecha y la hora en el formato especificado.

```bash
    date
```

El comando `who` se utiliza para mostrar los usuarios conectados al sistema. El comando `who` se utiliza para mostrar los usuarios conectados al sistema en la salida estándar. El comando `who` muestra los usuarios conectados al sistema con la información especificada.

```bash
    who
```

El comando `ps` se utiliza para mostrar los procesos en ejecución en el sistema. El comando `ps` se utiliza para mostrar los procesos en ejecución en el sistema en la salida estándar. El comando `ps` muestra los procesos en ejecución en el sistema con la información especificada.

```bash
    ps
```

### Redirección y tuberías

La redirección se utiliza para cambiar la entrada y la salida de los comandos. La redirección se utiliza para enviar la salida de un comando a un fichero, y para enviar la entrada de un comando desde un fichero.

```bash
    # Redirigir la salida de un comando a un fichero
    comando > fichero
    # Redirigir la entrada de un comando desde un fichero
    comando < fichero
```

Las tuberías se utilizan para combinar la salida de un comando con la entrada de otro comando. Las tuberías se utilizan para enviar la salida de un comando a la entrada de otro comando.

```bash
    # Combinar la salida de un comando con la entrada de otro comando
    comando1 | comando2
```

### Variables de entorno

Las variables de entorno se utilizan para almacenar información sobre el entorno del sistema. Las variables de entorno se utilizan para almacenar información sobre el sistema, como el nombre del usuario, el directorio de trabajo y la configuración del sistema.

```bash
    # Mostrar el valor de una variable de entorno
    echo $variable
    # Asignar un valor a una variable de entorno
    variable=valor
```

## Control de versiones

### Desarrollo colaborativo

Los programadores desarrollan código de forma colaborativa. Las herramientas populares como Dropbox, Google Drive o OneDrive no son adecuadas para el desarrollo de software. Las herramientas de control de versiones permiten a los programadores trabajar juntos en un proyecto de software.

Estas herramientas tienen muchos nombres: sistema de control de versiones (VCS), sistema de control de código fuente (SCM), sistema de control de revisiones (RCS), repositorios de código, etc. Pero todos hacen lo mismo: rastrean los cambios en el código fuente.

<div align="center">
  <img src="/assets/img/curso-programacion/cvs.png" alt="cvs"/>
</div>

En esta ocasión, vamos a introducir Git. Git es un sistema de control de versiones con diversas caracterísitcas que lo hacen ideal para el desarrollo colaborativo:

* Es software libre
* Es muy popular
* Existen múltiples herramientas para trabajar con él
* Es muy rápido en relizar las operaciones
* Permite trabajar offline y luego sincronizar (distribuido)
* Posee funcionalidades que facilitan el trabajo colaborativo

Fué desarrollado por Linus Torvalds en 2005 para el desarrollo del kernel de Linux. Git es un sistema de control de versiones distribuido, lo que significa que cada desarrollador tiene una copia local del repositorio, lo que permite trabajar offline y luego sincronizar.

<div align="center">
  <img src="/assets/img/curso-programacion/git.png" alt="git"/>
</div>

Posee varios clientes como TortoiseGit, GitKraken, RabbitVCS, etc. Que permiten integrarlo en le explorador de ficheros.

Cabe destacar que está integrado en editores de código como Visual Studio Code, Atom, Sublime Text, etc.

<div align="center">
  <img src="/assets/img/curso-programacion/ides.png" alt="ides"/>
</div>

Además, existen múltiples aplicaciones para trabajar con los repositorios locales (clientes) mediante línea de comandos o interfaz gráfica. Aunque los clientes gráficos es posible que no ofrezcan todas las funcionalidades de Git se puede combinar sin problemas con las operaciones por líneas de comandos.

<div align="center">
  <img src="/assets/img/curso-programacion/git-for-windows.png" alt="git-for-windows"/>
</div>

Por último, existen servicios de alojamiento de repositorios remotos como GitHub, GitLab, Bitbucket, etc. Que permiten alojar repositorios de forma gratuita o de pago.

<div align="center">
  <img src="/assets/img/curso-programacion/hosts.png" alt="hosts"/>
</div>

### Conceptos básicos

¿Qué es un repositorio?
Es una carpeta en disco que contiene los ficheros de un proyecto y la información necesaria para controlar las versiones de los mismos. Tiene una subcarpeta oculta llamada `.git` que contiene la información de control de versiones.

¿Cómo se crea un repositorio?

* Local: se crea un directorio y se inicializa como repositorio con el comando `git init`.
* Remoto: se crea un repositorio en un servidor y se clona en la máquina del desarrollador con el comando `git clone`.

¿Qué se guarda en un repositorio?

* Ficheros: los ficheros del proyecto.
* Metadatos: información sobre los ficheros y las versiones. Quién modificó cada fichero, cuándo y por qué.

¿Cómo se trabaja con un repositorio?

1. El desarrollador crea y edita los ficheros de forma habitual con editores de código.
2. Cuando se completa una funcionalidad, se indican los ficheros nuevos o los que se han modificado con el comando `git add` y se crea una nueva versión con el comando `git commit`.
3. Cuando se desea compartir los cambios con otros desarrolladores, se suben al repositorio remoto con el comando `git push`.
4. Cuando se desea obtener los cambios de otros desarrolladores, se descargan del repositorio remoto con el comando `git pull`.

Veamos las zonas en las que está un fichero:

* Working directory: es el directorio de trabajo, donde se encuentran los ficheros del proyecto. Este es el espacio donde el desarrollador crea y modifica los ficheros. Si se va a trabajar con un repositorio existente, los ficheros se obtienen de una versión (*commit*) alohada en el directorio git usando el comando `git checkout`.
* Local repo: es el directorio `.git` que contiene la información de control de versiones. En este directorio se almacenan los metadatos de los ficheros y las versiones. Si se va a trabajar con un repositorio existente, se obtiene la información de control de versiones del repositorio remoto con el comando `git clone`.
* Staging area: no es una carpeta real, es una lista de ficheros, digamos que un área intermedia entre el directorio de trabajo y el repositorio local. En esta área se preparan los ficheros que se van a añadir al repositorio local. Si se va a trabajar con un repositorio existente, se añaden los ficheros al área de preparación con el comando `git add`.

<div align="center">
  <img src="/assets/img/curso-programacion/git-areas.png" alt="git-areas"/>
</div>

Los cuatro estados de los ficheros son:

* Untracked: ficheros que no están en el repositorio. Por ejemplo, ficheros que se acaban de crear y todavía no se han añadido al repositorio.
* Unmodified: ficheros que no han sido modificados desde la última versión.
* Modified: ficheros que han sido modificados desde la última versión. Por ejemplo, ficheros que se han editado y todavía no se han añadido al repositorio.
* Staged: ficheros que han sido añadidos al área de preparación. Por ejemplo, ficheros que se han añadido al área de preparación y todavía no se han añadido al repositorio.

<div align="center">
  <img src="/assets/img/curso-programacion/git-states.png" alt="git-states"/>
</div>

Los *commits* son las versiones de los ficheros que se guardan en el repositorio. Cada *commit* tiene un identificador único que se genera automáticamente. Los *commits* se crean con el comando `git commit`.
Generalmente se añade un mensaje que describe los cambios realizados en el *commit*. Además cada commit se identifica con un hash que es un número hexadecimal de 40 caracteres que se genera automáticamente. Se suele usar la expresión "hash del commit" en lugar del "número de commit" o "id del commit" para referirse a este identificador.

<div align="center">
  <img src="/assets/img/curso-programacion/git-commit.png" alt="git-commit"/>
</div>

Los *snapshots* son las versiones de los ficheros que se guardan en el repositorio. Cada *snapshot* tiene un identificador único que se genera automáticamente. Los *snapshots* se crean con el comando `git commit`.

La identidad del desarrollador se configura con el comando `git config`. La identidad del desarrollador se compone de un nombre de usuario y una dirección de correo electrónico. La identidad del desarrollador se utiliza para identificar al desarrollador en los *commits*.

```bash
    # Configurar el nombre de usuario
    git config --global user.name "Nombre Apellido"
    # Configurar la dirección de correo electrónico
    git config --global user.email "Email"
    # Ver la configuración de la identidad del desarrollador
    git config --list
    cat $HOME/.gitconfig
```

Además estos datos se configuran a nivel de ususario en el sistema operativo, en el fichero `.gitconfig` que se encuentra en el directorio de usuario.

### Git: trabajando en local

Para instalar Git en Windows, se descarga el instalador de la página web oficial de Git y se ejecuta el instalador. El instalador de Git instala Git en el sistema y configura las variables de entorno.

Para instalar Git en Linux, se utiliza el gestor de paquetes de la distribución. En Ubuntu, se instala Git con el comando `sudo apt-get install git`.

```bash
    sudo apt-get install git
```

Para comprobar rápidamente si Git está instalado, se ejecuta el comando `git --version`. Si Git está instalado, se muestra la versión de Git.

```bash
    git --version
```

A la hora de crear un repositorio, se crea un directorio y se inicializa como repositorio con el comando `git init`. El comando `git init` crea un directorio `.git` en el directorio actual.

```bash
    # Crear un directorio
    mkdir proyecto
    # Cambiar al directorio
    cd proyecto
    # Inicializar como repositorio
    git init
```

Veamos un ejemplo para crear un fichero y añadirlo al repositorio. Se crea un fichero con el comando `touch` y se añade al área de preparación con el comando `git add`. Se crea una nueva versión con el comando `git commit`.

```bash
    # Crear un fichero
    touch fichero
    # Añadir al área de preparación
    git add fichero
    # Crear una nueva versión
    git commit -m "Mensaje del commit"
```

Para subir los cambios al repositorio remoto, se añade el repositorio remoto con el comando `git remote add` y se suben los cambios al repositorio remoto con el comando `git push`.

```bash
    # Añadir el repositorio remoto
    git remote add origin URL_REPOSITORIO
    # Subir los cambios al repositorio remoto
    git push -u origin master
```

A la hora de consultar el estado del repositorio, se muestra el estado de los ficheros con el comando `git status`. El comando `git status` muestra los ficheros que han sido modificados y los ficheros que han sido añadidos al área de preparación.

```bash
    git status
```

Existen una serie de buenas prácticas en el uso de los commits:

* Hacer commits pequeños y frecuentes
* Hacer commits atómicos, es decir, que contengan un solo cambio
* Añadir un mensaje descriptivo al commit
* Separar el asunto del cuerpo del mensaje con una línea en blanco
* Limitar la longitud del asunto a 50 caracteres
* Limitar la longitud del cuerpo a 72 caracteres
* Utilizar el imperativo en el asunto del mensaje
* Utilizar el presente en el asunto del mensaje
* Utilizar el cuerpo del mensaje para explicar el por qué del cambio

<div align="center">
  <img src="/assets/img/curso-programacion/git-commit-example.png" alt="git-commit-example"/>
</div>

Las ramas o *branches* se utilizan para trabajar en paralelo en el mismo repositorio. Las ramas se utilizan para desarrollar nuevas funcionalidades o corregir errores sin afectar a la rama principal. Las ramas se crean con el comando `git branch`.

Una rama se puede crear partiendo de cualquier commit del repositorio. Es como hacer una copia de un documento para poder trabajas en dos "líneas de trabajo" en paralelo.

En cualquier momento se pueden mezclar el código de dos ramas diferentes. Cuando el código de la rama master está estbale, es cuando se publicará una nueva release.

<div align="center">
  <img src="/assets/img/curso-programacion/git-branch.png" alt="git-branch"/>
</div>

```bash
    # Crear una rama
    git branch rama
    # Cambiar a la rama
    git checkout rama
    # Hacer cambios en la rama y añadir al área de preparación
    git add fichero
    # Crear una nueva versión
    git commit -m "Mensaje del commit"
    # Cambiar a la rama master
    git checkout master
    # Mezclar la rama
    git merge rama
```

Existe una estrategia de desarrollo bastante común que consiste en que cada nueva funcionalidad se desarrolla en una rama diferente. Una vez que la funcionalidad está terminada y probada, se mezcla con la rama principal. Esta técnica se conoce como *feature branch*.

Para borrar commits o ramas, se borra el commit con el comando `git reset` y se borra la rama con el comando `git branch -d`.

```bash
# Borrar el último commit
git reset --hard HEAD~1
# Borrar una rama
git branch -d rama
```

Hay que tener cuidado de no borrar commits o ramas que contengan cambios importantes. Si se borra un commit o una rama por error, se pueden recuperar los cambios con el comando `git reflog`. Sin embargo, es mejor prevenir que curar, por lo que es recomendable hacer una copia de seguridad manual de los cambios importantes antes de borrar.

Para borrar el contenido de un área de trabajo y retroceder al último commit, se utiliza el comando `git reset`. El comando `git reset` se utiliza para borrar el contenido del área de trabajo y retroceder al último commit. Es importante destacar que esta operación es irreversible, por lo que se recomienda hacer una copia de seguridad de los cambios importantes antes de borrar.

```bash
    git reset --hard HEAD
```

Si por el contrario, queremos hacer un reset suave de manera que los cambios se mantengan en el área de trabajo, se utiliza el comando `git reset --soft HEAD~1`. El comando `git reset --soft HEAD~1` se utiliza para hacer un reset suave y retroceder al último commit. En este caso, los cambios se mantienen en el área de trabajo.

```bash
    git reset --soft HEAD~1
```

Cuando en dos ramas se han modificado el mismo fichero, se produce un conflicto. Los conflictos se producen cuando dos ramas han modificado el mismo fichero y se intenta mezclar las ramas. Los conflictos se resuelven manualmente, editando el fichero y eliminando las líneas que causan el conflicto.

Es necesario que el desarrollador decide qué cambios se mantienen y cuáles se eliminan. Para resolver un conflicto, se edita el fichero y se eliminan las líneas que causan el conflicto. Una vez resuelto el conflicto, se añade el fichero al área de preparación con el comando `git add` y se crea una nueva versión con el comando `git commit`.

### Git y GitHub: trabajando en equipo

La forma más recomendada de trabajar con repositorios remotos en git es usar una clave SSH. Técnicamente se deben generar dos claves, una pública y una privada. La clave pública se añade a la cuenta de GitHub y la clave privada se guarda en el sistema local. Para generar las claves se utiliza el comando `ssh-keygen`.

```bash
    ssh-keygen -t rsa -b 4096 -C "Email"
```

Luego, se copia la clave pública al portapapeles con el comando `cat` y se añade a la cuenta de GitHub en la sección de claves SSH.

```bash
    cat $HOME/.ssh/id_rsa.pub
```

Hay dos formas de comenzar a trabajar en GitHub:

* Crear un repositorio en GitHub y clonarlo en local. Normalmente se incluye un fichero README.md con información sobre el proyecto y el fichero de licencia.
* Crear un repositorio en local y subirlo a GitHub. Esto nos permite subir nuestros cambios si ya tenemos contenido. Es un poco más engorroso pero es útil si ya tenemos un proyecto en local.

El repositorio local tiene automáticamente configurado el repositorio de GitHub como un repositorio remoto. Lo habitual es tener un único repositorio remoto, pero se pueden tener varios. Cada uno tiene un nombre, el repositorio de GitHub se llama `origin`.

```bash
    # Crear un repositorio en GitHub
    git remote add origin URL_REPOSITORIO
    # Subir los cambios al repositorio remoto
    git push -u origin master
```

Para el desarrollo colaborativo normalmente se utiliza GitHub como repositorio centralizado de confianza donde cada desarrollador tendrña una copia de este repositorio enlocal. Los cambios ademñas de comitearlos a nuestro repositorio local, se subirán al repositorio remoto empujando los cambios con el comando `git push`.

Periódicamente tendremos que traer los cambios del repositorio remoto a nuestro repositorio local. Para ello utilizamos el comando `git pull`.

```bash
    # Descargar los cambios del repositorio remoto
    git pull
    # Subir los cambios al repositorio remoto
    git push
```

Para poder habilitar que otros usuarios colaboren con nuestro repositorio, debemos añadirlos como colaboradores en GitHub. Para ello, en la página del repositorio, en la pestaña `Settings`, en la sección `Manage access`, se añade el nombre de usuario del colaborador.

Cuando se trabaja sobre master, los miembros del equipo sólo pueden conocer lo que hace un compañero cuando ya está integrado. Sería interesante que otros miembros del equipo pudieran revisar los cambios antes de que finalmente se integren para, si es necesario, solicitar mejoras. Esto es especialmente útil para desarrolladores con poca experiencia y para proyectos de software libre en los que los desarrolladores ajenos al proyecto hacen contribuciones al mismo. Esto es lo que se conoce como *pull request*.

 Un pull request es una petición que hace un colaborador al propietario del repositorio para que incorpore los cambios que ha hecho en su repositorio. El propietario del repositorio revisa los cambios y decide si los incorpora o no.

 El funcionamiento es el siguiente:
    1. El colaborador hace un fork del repositorio del propietario. Creando una rama en local, generalmente asociada a una funcionalidad o *branch-per-feature*.
    2. El colaborador hace los cambios en su rama y los sube a su repositorio en GitHub.
    3. Desde la interfaz web, solicita integrar la rama en master del repositorio del propietario (pull request).
    4. El pull request tiene un hilo de comentarios asociado para dar feedback sobre sus commits. Se pueden hacer más commits sobre la rama y se añadirán al pull request.
    5. Cuando el código está listo, se acepta el pull request y se integra en master.

Para que los cambios en el servidor se refleren en el repositorio local, se utiliza el comando `git fetch`. El comando `git fetch` se utiliza para descargar los cambios del servidor y actualizar el repositorio local. El comando `git fetch` descarga los cambios del servidor y actualiza el repositorio local.

```bash
    git fetch
```

Los tags o etiquetas se utilizan para marcar los *commits* importantes. Los tags se utilizan para marcar los *commits* importantes en el repositorio o para marcar releases e hitos del proyecto. Los tags se crean con el comando `git tag`.

```bash
    git tag -a v1.0 -m "Versión 1.0"
```
