list p=18f4550
#include <p18f4550.inc>
	
	org		0x00
	goto		inicio
	org		0x20		    
	contador 	EQU 0xFF    ;declaracion de variable 
	contador2	EQU 0xFF    ;declaracion de segunda variable

inicio:				    
	CLRF	PORTD		    ;PORTD = 0. Lo inicializamos
	CLRF	TRISD		    ;Se coloca el puerto D como salida
	setf	ADCON1		    ;Ponemos digitales las salidas del inicio
	
codigo: 
	BSF	PORTD, 0
	call	retardo 
	BCF	PORTD, 0
	call	retardo
	
	BSF	PORTD, 0
	call	retardo 
	BCF	PORTD, 0
	call	retardo
	
	BSF	PORTD, 0
	call	retardo 
	BCF	PORTD, 0
	call	retardo
	
	BSF	PORTD, 0
	call	retardo
	
	BSF	PORTD, 1
	call	retardo 
	BCF	PORTD, 1
	call	retardo
	
	BSF	PORTD, 1
	call	retardo 
	BCF	PORTD, 1
	call	retardo
	
	BSF	PORTD, 1
	call	retardo 
	BCF	PORTD, 1
	call	retardo
	
	BSF	PORTD, 1
	call	retardo
	
	BSF	PORTD, 2
	call	retardo 
	BCF	PORTD, 2
	call	retardo
	
	BSF	PORTD, 2
	call	retardo 
	BCF	PORTD, 2
	call	retardo
	
	BSF	PORTD, 2
	call	retardo 
	BCF	PORTD, 2
	call	retardo
	
	BSF	PORTD, 2
	call	retardo
	
	BSF	PORTD, 3
	call	retardo 
	BCF	PORTD, 3
	call	retardo
	
	BSF	PORTD, 3
	call	retardo 
	BCF	PORTD, 3
	call	retardo
	
	BSF	PORTD, 3
	call	retardo 
	BCF	PORTD, 3
	call	retardo
	
	BSF	PORTD, 3
	
	call retardo
	
	BCF	PORTD, 0
	BCF	PORTD, 1
	BCF	PORTD, 2
	BCF	PORTD, 3
	
	call retardo
	
	goto codigo 
	
retardo: 
	movlw	D'187'
	movwf	contador
	movlw	D'223'
	movwf	contador2
    bandera:
	DECFSZ	contador, 1
	goto	bandera
	DECFSZ	contador2, 1
	goto	bandera
	return
end

