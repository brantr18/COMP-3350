; Author: Brantley Robertson
; Last Modified: 2/24/2022
; Project 3
; This program reads a value from an array, then places this value in another array with the location shifted.


.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	
	; Create a BYTE array with the label ‘input’.
	input byte 1,2,3,4,5,6,7,8

	; Create a BYTE array with the label ‘output’. This array should be the same length as  ‘input’.
	output byte lengthof input dup(?)
	
	; Create a DWORD variable with the label ‘shift’.
	shift dword 4


.code
	
	main proc
		
		mov ecx, lengthof input			;This loop will iterate length - shift times.
		sub ecx, shift					;(this loop will place the 'non-wrapped' values)
		mov edi, shift					;Start writing from input at shift
		mov esi, 0						;Start reading at 0

		L1:
			mov al, input[esi]			;Move the value from input into al
			mov output[edi], al			;Move the value from al into output
			inc esi						;Increment the input index
			inc edi						;Increment the output index
		loop L1

		mov ecx, shift					;This loop will iterate shift times
		mov esi, lengthof input			;Start reading at index length - shift
		sub esi, shift					;Start writing at index 0
		mov edi, 0						;(this loop will place the 'wrapped' values)

		L2:
			mov al, input[esi]			;Move the value from input into al
			mov output[edi], al			;Move the value from al into output
			inc esi						;Increment the input index
			inc edi						;Increment the output index
		loop L2
		
		invoke ExitProcess, 0
	main endp
end main