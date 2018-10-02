dato1			dw			001FFh
dato2			dw			00001h




mov 			al,[dato1]
mov 			ah,[dato+1]
mov 			bl,[dato2]
mov 			bh,[dato2+1]
add 			al,bl ; al = 0
adc 			ah,bh ;	ah = 2



dato1 			0000	0001	

dato1				F	F
					0	1
					0	0
					0	0