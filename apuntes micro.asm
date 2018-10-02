modos de direccionamiento
es el termino dado al mecanismo que permite calcular las direcciones donde se encuentran los datos

** modo de direccionamiento inherte
es el que se aplica a aquellas instrucciones que no tienen operandos. Esto se debe o bien a que la instruccion no necesita datos o a que los datos con los que operan la instruccionestan en registros predefinidos.

ejemplo:

clc ----> clear carry
cbw ----> convert byte to word



						dato 		debe 			?

						mov 		al,[dato]

						cbw

** modo de direccionamiento inmediato

muchas de las instrucciones permiten que uno de los operandos sea una constante, la constante puede ser una constane numerica una expresion constante  o una etiqueta

						mov			al,65d
						mov			al,41h
						mov 		ax,2*(3+2)/3
						mov 		ah, size dato1
						inicio:


modo de direccionamiento por registros

los registros son los operandos mas usados en las instrucciones.

Ejemplo:

						mov			di, ax 
						push 		di
						xchg		ah, dl
						inc 		si



modo de direccionamiento directo

en este modo de direccionamiento uno de los datos se encuentra en una localidad de memoria (una variable) 
ejemplo:


dato1		dw		0123h
dato2		donde456789ABh

dato1 	|	2  	3	|		posicion 	0
		|	0	1	|					1
dato2	|	A	B	|					2
		|	8	9	|					3
		|	6	7	|					4
		|	4	5	|					5







						mov 		bx,[dato1]
						mov 		cl,[dato1]		; cl = ?    = 23h
						mov 		dh,[dato1+1]	; dh = ?	= 01h
						mov 		ax,[dato2]		; ax= ?		= 89ABh
						mov 		bx,[dato2+2]	; bx = ?	= 4567h
						mov 		cx,[dato2+1]	; cx = ? 	= 6789h	


INSTRUCCIONES

las instrucciones en ensamblador se clasifican en 6 grupos:

1	instrucciones de transferencia de datos
2	instrucciones aritmeticas
3	instrucciones logicas
4	instrucciones de control de flujo
5	instrucciones de control del procesador
6	instrucciones de cadenas



instrucciones de transferencia de datos.


mov 	destino, fuente
