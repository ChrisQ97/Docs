list p=18f4550
#include <p18f4550.inc>
	
	org		0x00
	goto		inicio
	org		0x20		    
	contador 	EQU 0xFF    ;declaracion de variable 
	contador2	EQU 0xFF    ;declaracion de segunda variable

inicio:	
	setf				ADCON1;
	CLRF	PORTB		    ;PORTB = 0. Lo inicializamos
	CLRF	TRISB		    ;Se coloca el puerto D como salida
	setf	ADCON1		    ;Ponemos digitales las salidas del inicio
	
codigo: 
	BSF	PORTB, 0
	call	retardo 
	BCF	PORTB, 0
	call	retardo
	
	BSF	PORTB, 0
	call	retardo 
	BCF	PORTB, 0
	call	retardo
	
	BSF	PORTB, 0
	call	retardo 
	BCF	PORTB, 0
	call	retardo
	
	BSF	PORTB, 0
	call	retardo
	
	BSF	PORTB, 1
	call	retardo 
	BCF	PORTB, 1
	call	retardo
	
	BSF	PORTB, 1
	call	retardo 
	BCF	PORTB, 1
	call	retardo
	
	BSF	PORTB, 1
	call	retardo 
	BCF	PORTB, 1
	call	retardo
	
	BSF	PORTB, 1
	call	retardo
	
	BSF	PORTB, 2
	call	retardo 
	BCF	PORTB, 2
	call	retardo
	
	BSF	PORTB, 2
	call	retardo 
	BCF	PORTB, 2
	call	retardo
	
	BSF	PORTB, 2
	call	retardo 
	BCF	PORTB, 2
	call	retardo
	
	BSF	PORTB, 2
	call	retardo
	
	BSF	PORTB, 3
	call	retardo 
	BCF	PORTB, 3
	call	retardo
	
	BSF	PORTB, 3
	call	retardo 
	BCF	PORTB, 3
	call	retardo
	
	BSF	PORTB, 3
	call	retardo 
	BCF	PORTB, 3
	call	retardo
	
	BSF	PORTB, 3
	
	call retardo
	
	BCF	PORTB, 0
	BCF	PORTB, 1
	BCF	PORTB, 2
	BCF	PORTB, 3
	
	call retardo
	
	goto codigo 
	
retardo: 
	movlw	D'187'
	movwf	contador
	movlw	D'223'
	movwf	contador2
bandera:
	
	DECFSZ	contador2, 1
	goto	bandera
	return
end



