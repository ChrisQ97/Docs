list p = 18f4550
#include <p18f4550.inc>
	org					0x00
	goto				inicio
	org					0x20
	contador			EQU 0x25
inicio:
	setf				ADCON1;
	clrf				TRISB; tris b = 0
	clrf				PORTB; 
	goto				prendercero

;///////////////////////////////////////////////////////////////////
;prendemos el led cero
prendercero:
	bsf 				PORTB, 0 ; encendemos primer led
	goto				retardocero
;retardo led cero
retardocero:
	decfsz		contador,0x25	;
	goto		retardocero		;vuelve ciclicamente a retardocero
	movlw		0xFF		;w= 0xFF
	movwf		contador	; contador = w
	goto		apagarcero	; vamos a apagarcero

;apagamos led cero
apagarcero:
	bcf			PORTB, 0
	goto 		prenderuno



;////////////////////////////////////////////////////////////////////
;prendemos led uno
prenderuno:
	bsf 				PORTB, 1 ; encendemos segundo led
	goto				retardouno

retardouno:
	decfsz		contador,0x25	;
	goto		retardouno	;vuelve ciclicamente a retardocero
	movlw		0xFF		;w= 0xFF
	movwf		contador	; contador = w
	goto		apagaruno	; vamos a apagarcero

apagaruno:
	bcf			PORTB, 1
	goto		prenderdos

;/////////////////////////////////////////////////////////////////////
;prendemos led dos

prenderdos:
	bsf 				PORTB, 2 ; encendemos tercer led
	goto				retardodos

retardodos:
	decfsz		contador,0x25	;
	goto		retardodos	;vuelve ciclicamente a retardocero
	movlw		0xFF		;w= 0xFF
	movwf		contador	; contador = w
	goto		apagardos	; vamos a apagarcero

apagardos:
	bcf			PORTB, 2
	goto		prendertres

;///////////////////////////////////////////////////////////////
;prender el led 3
prendertres:
	bsf 				PORTB, 3 ; encendemos cuarto led
	goto				retardotres

retardotres:
	decfsz		contador,0x25	;
	goto		retardotres	;vuelve ciclicamente a retardocero
	movlw		0xFF		;w= 0xFF
	movwf		contador	; contador = w
	goto		apagartres	; vamos a apagarcero

apagartres:
	bcf			PORTB, 3
	goto		prendercuatro

;////////////////////////////////////////////////////////////////
;prender led cuatro

prendercuatro:
	bsf 				PORTB, 4 ; encendemos quinto led
	goto				retardocuatro

retardocuatro:
	decfsz		contador,0x25	;
	goto		retardocuatro	;vuelve ciclicamente a retardocero
	movlw		0xFF		;w= 0xFF
	movwf		contador	; contador = w
	goto		apagarcuatro	; vamos a apagarcero

apagarcuatro:
	bcf			PORTB, 4
	goto		prendercinco

;//////////////////////////////////////////////////////////////////
;prender led cinco

prendercinco:
	bsf 				PORTB, 5 ; encendemos sexto led
	goto				retardocinco

retardocinco:
	decfsz		contador,0x25	;
	goto		retardocinco	;vuelve ciclicamente a retardocero
	movlw		0xFF		;w= 0xFF
	movwf		contador	; contador = w
	goto		apagarcinco	; vamos a apagarcero

apagarcinco:
	bcf			PORTB, 5
	goto		prenderseis

;/////////////////////////////////////////////////////////////////////
;prender led seis

prenderseis:
	bsf                 PORTB, 6 ; encendemos septimo led
	goto				retardoseis

retardoseis:
	decfsz		contador,0x25	;
	goto		retardoseis	;vuelve ciclicamente a retardocero
	movlw		0xFF		;w= 0xFF
	movwf		contador	; contador = w
	goto		apagarseis	; vamos a apagarcero

apagarseis:
	bcf			PORTB, 6
	goto		prendersiete

;///////////////////////////////////////////////////////////////
;prender led siete

prendersiete:
	bsf 				PORTB, 7 ; encendmos octavo led
	goto				retardosiete

retardosiete:
	decfsz		contador,0x25	;
	goto		retardosiete	;vuelve ciclicamente a retardocero
	movlw		0xFF		;w= 0xFF
	movwf		contador	; contador = w
	goto		apagarsiete	; vamos a apagarcero

apagarsiete:
	bcf			PORTB, 7
	goto		prendercero





	end 		


