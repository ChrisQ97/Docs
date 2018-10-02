list p=18f4550
#include <p18f4550.inc>
    
    org	    0x00
    goto    configurar
    org	    0x08
    goto    interrupcion
    org	    0x20
    
configurar:
    movlw   0x80
    movwf   INTCON	    ;Se pone INTCON con el primer bit como 1 y el resto como 0 para activar todas las interrupciones unmasked
    movlw   0x28
    movwf   T0CON	    ;Se coloca como 1 el bit 5 y 3 en T0CON
    
    CLRF    TRISB	    ;Se coloca el puerto D como salida
    movlw   0xFF
    movwf   TRISA	    ;Volvemos todos los pines del puerto A como entrada
    
    clrf    PORTA	    ;inicializar el porta
    clrf    PORTB	    ;inicializar el puerto d    
    bcf	    RCON, 7	    ;Se coloca IPEN como 0 para no distinguir entre interrupciones de alta y baja prioridad, y permitir usar interrupciones unmasked
    bsf	    T0CON, 7	    ;Habilitamos TIMER0
    movlw   0xED
    movwf   TMR0	    ;Colocamos el timer con un valor inicial de 236 para que asi solo cuente 20 hasta llegar al desbordamiento en 256
    bsf	    INTCON, 5	    ;Encendemos el timer
 
ciclo:
    movlw   0xEC	;Ponemos 235 como valor del registro W
    subwf   TMR0, 0	;Le restamos al contador (que empieza en 236 pero aumenta hasta 255) el valor de 235 para que vaya de 1 a 20
    movwf   PORTB	;Movemos el valor del contador del registro w al puerto b 
    ;con este se mueve el valor
    goto    ciclo
    
interrupcion:		;Mete todos los valores que se estaban usando antes de la interrupcion a una pila
    bcf	    INTCON, 5	;Apagamos el timer
    bcf	    INTCON, 2
    movlw   0xEC
    movwf   TMR0	;Le volvemos a configurar el valor inicial al timer de 236 para que solo cuente 20
    clrf    PORTB	;Reinicializamos el puerto D
    bsf	    INTCON, 5	;De nuevo encender el timer
    retfie		;Regresa todos los valores de la pila
    
end
    
	
