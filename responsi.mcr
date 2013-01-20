;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
;           Pustaka Makro             ;
;       Program: pustaka.mcr          ;
;        Oleh: Eko Yunianto           ;
;          NIM : 12100816             ;
;=====================================;

;=============Cetak Kalimat===========;
komparasi MACRO A,L1,L2,L3,K
LEA BX,A+2	
	CMP byte ptr [BX],'1'
	JE L1
	CMP byte ptr [BX],'2'
	JE L2
	CMP byte ptr [BX],'3'
	JE L3
	cetak_kal salah
	JNE K
ENDM

;=============Cetak Kalimat===========;
cetak_kal MACRO kal
	MOV AH,09h
	LEA DX,kal
	INT 21h
ENDM

;=============Catat Angka===========;
catat_angka MACRO A
	MOV AH,01h
	INT 21h			; catat
	MOV BL,AL
	SUB BL,30h
	MOV A,BL
ENDM

;=============Tampil Angka===========;
cetak_angka MACRO A
	MOV AH,02h
	mov DL,A
	ADD DL,30h
	INT 21h
ENDM

;=============Catat Huruf===========;
catat_huruf MACRO A
	MOV AH,0Ah
	LEA DX,A
	INT 21h	
ENDM

;=============Tampil Huruf===========;
cetak_huruf MACRO A
local ulang,terus
	LEA BX,A+2		
ulang:	
	CMP byte ptr [BX],tbl_enter	
	JE terus
	MOV DL,[BX]
	MOV AH,02h
	INT 21h		
	INC BX
	JMP ulang
terus:
ENDM	 
		
;=============Pejumlahan===========;
tambah MACRO A,B
	MOV Al,A
	ADD Al,B
	MOV C,AL
ENDM

;=============Pengurangan===========;
kurang MACRO A,B
	MOV AL,A
	SUB AL,B
	MOV C,AL
ENDM
