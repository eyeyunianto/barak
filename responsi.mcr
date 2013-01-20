;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~;
;       Program: responsi.asm         ;
;        Oleh: Eko Yunianto           ;
;          NIM : 12100816             ;
;     Fungsi : Aritmatika dan Data    ;
;=====================================;

include responsi.mcr
.model small
.code
  org 100h
mulai:	jmp proses
	tbl_enter equ 0dh	
	utama     db 13,10,' ------> Menu Utama <------',13,10,'| 1. Aritmatik             |',13,10,'| 2. Input dan Tampil Data |',13,10,'| 3. Keluar                |',13,10,' --------------------------',13,10,'Pilihan = $'
	arit      db 13,10,' -----> Menu Aritmatika <----- ',13,10,'| 1. Penjumlahan 2 Bilangan   |',13,10,'| 2. Pengurangan 2 Bilangan   |',13,10,'| 3. Kembali ke Menu Utama    |',13,10,' -----------------------------',13,10,'Pilihan = $'
	data      db 13,10,' -----> Menu Input dan Tampil Data <----- ',13,10,'| 1. Input Data                          |',13,10,'| 2. Tampil Data                         |',13,10,'| 3. Kembali ke Menu Utama               | ',13,10,' ----------------------------------------',13,10,'Pilihan = $'
	salah     db 13,10,13,10,'Tidak ada pilihan yang di maksud, Silakan Ulangi Lagi $'
	Tdata     db 13,10,13,10,'Masukkan Data Anda $'
	Jdata     db 13,10,13,10,'Data Anda Adalah Sebagai Berikut $'
	Tnip	  db 13,10,'NIP           = $'
	Tnma	  db 13,10,'Nama          = $'
	Talm	  db 13,10,'Alamat        = $'
	Tlhr	  db 13,10,'Tempat Lahir  = $'
	Tkel	  db 13,10,'Jenis Kelamin = $'
	Tjab	  db 13,10,'Jabatan       = $'
	Tbil1	  db 13,10,13,10,'Masukkan data anda ',13,10,'Bil1 = $'
	Tbil2	  db 13,10,'Bil2 = $'
	Htmb	  db 13,10,'Hasil Bil1 + Bil2 = $'
	Hkrg	  db 13,10,'Hasil Bil1 - Bil2 = $'

	Jawab1	  db 26,?,26 dup(?)
	Jawab2	  db 26,?,26 dup(?)
	Jawab3	  db 26,?,26 dup(?)
	
	Jnip	  db 26,?,26 dup(?)
	Jnma	  db 26,?,26 dup(?)
	Jalm	  db 26,?,26 dup(?)
	Jlhr	  db 26,?,26 dup(?)
	Jkel	  db 26,?,26 dup(?)
	Jjab	  db 26,?,26 dup(?)
	
	a db 0
	b db 0
	c db 0
	
proses:
	cetak_kal utama
	catat_huruf Jawab1
	LEA BX,Jawab1+2	
	CMP byte ptr [BX],'1'
	je aritmatika
	CMP byte ptr [BX],'2'
	je pdata
	CMP byte ptr [BX],'3'
	je exit
	cetak_kal salah
	jne proses
pdata:
	jmp pendataan
exit:
	jmp keluar
aritmatika:
	cetak_kal arit
	catat_huruf Jawab2
	LEA BX,Jawab2+2	
	CMP byte ptr [BX],'1'
	je jumlah
	CMP byte ptr [BX],'2'
	je krng
	CMP byte ptr [BX],'3'
	je proses
	cetak_kal salah
	jne aritmatika
jumlah:
	cetak_kal Tbil1
	catat_angka a
	cetak_kal Tbil2
	catat_angka b
	tambah a,b
	cetak_kal Htmb
	cetak_angka c
	jmp aritmatika
krng:
	cetak_kal Tbil1
	catat_angka a
	cetak_kal Tbil2
	catat_angka b
	kurang a,b
	cetak_kal Hkrg
	cetak_angka c
	jmp aritmatika
pendataan:
	cetak_kal data
	catat_huruf Jawab3
	LEA BX,Jawab3+2	
	CMP byte ptr [BX],'1'
	je input
	CMP byte ptr [BX],'2'
	je output
	CMP byte ptr [BX],'3'
	je pproses
	cetak_kal salah
	jne pendataan
pproses:
	jmp proses
input:
	cetak_kal Tdata
	cetak_kal Tnip
	catat_huruf Jnip
	cetak_kal Tnma
	catat_huruf Jnma
	cetak_kal Talm
	catat_huruf Jalm
	cetak_kal Tlhr
	catat_huruf Jlhr
	cetak_kal Tkel
	catat_huruf Jkel
	cetak_kal Tjab
	catat_huruf Jjab
	jmp pendataan
output:
	cetak_kal Jdata
	cetak_kal Tnip
	cetak_huruf Jnip
	cetak_kal Tnma
	cetak_huruf Jnma
	cetak_kal Talm
	cetak_huruf Jalm
	cetak_kal Tlhr
	cetak_huruf Jlhr
	cetak_kal Tkel
	cetak_huruf Jkel
	cetak_kal Tjab
	cetak_huruf Jjab
	jmp pendataan
keluar:	
	int 20h
end mulai	
