# libasm

## Proyecto escuela 42
### Instrucciones generales
Su biblioteca se debe llamar libasm.a
- Tiene que entregar un main que probará sus funciones y compilará con su biblioteca para mostrar que funciona.
- Tiene que escribir las funciones siguientes:

  - t_strlen (man 3 strlen)

  - ft_strcpy (man 3 strcpy)

  - ft_strcmp (man 3 strcmp)

  - ft_write (man 2 write)

  - ft_read (man 2 read)

  - ft_strdup (man 3 strdup, se autoriza malloc)

- Debe verificar los errores durante las syscalls y reenviarlas correctamente.
- Vuestro código debe permitir la lectura de la variable errno (de <errno.h>) desde un fichero .c
- Para esto, está autorizado extern ___error

### Parte extra:


La lista enlazada utilizará la estructura siguiente:
```

typedef struct 		s_list

  {

	void *data;
  
	struct s_list *next;
  
  
  } 			t_list;
  
  ```
Puede volver a escribir las funciones siguientes en asm:

- ft_atoi_base (Como la de la piscina)

- ft_list_push_front (Como la de la piscina)

- ft_list_size (Como la de la piscina)

- ft_list_sort (Como la de la piscina)

- ft_list_remove_if (Como la de la piscina)

Tiene que escribir en asm 64 bits. Cuidado con las “calling convention”, es decir el protocolo de llamadas entre funciones.

Tiene que entregar archivos ’.s’ y no asm inline.

Debe compilar su código con nasm

Debe utilizar la sintaxis Intel y no la de AT&T.


Para ejecutar este proyecto puede hacerlo con make o con make test. Este segundo hará la prueba de cada uno de los archivos de la parte obligatoria. No están añadidos los bonus.


Para hacer comprobaciones, a parte del main que viene, hay algún test en github, por ejemplo
https://github.com/cacharle/libasm_test


#### Este ha sido mi proyecto para la escuela de programación 42 Madrid como jeserran, puedes utilizarlo como guía para realizar tu proyecto pero nunca copiarlo para utilizarlo como propio.
