#=========================================================       
#=========================================================
#=========================================================
#=========================================================
#=========================================================
#PHAN I: KHAI BAO
.data
#Days
daydefault: .asciiz "01/01/0001"
Day_2: .asciiz "la thu 2"
Day_3: .asciiz "la thu 3"
Day_4: .asciiz "la thu 4"
Day_5: .asciiz "la thu 5"
Day_6: .asciiz "la thu 6"
Day_7: .asciiz "la thu 7"
Day_CN: .asciiz "la CNhat"
#Months
Month_1: .asciiz "January"
Month_2: .asciiz "February"
Month_3: .asciiz "March"
Month_4: .asciiz "April"
Month_5: .asciiz "May"
Month_6: .asciiz "June"
Month_7: .asciiz "July"
Month_8: .asciiz "August"
Month_9: .asciiz "September"
Month_10: .asciiz "October"
Month_11: .asciiz "November"
Month_12: .asciiz "December"
#Thong bao nhap Day/Month/Year
msg_input_day: .asciiz "\nNhap ngay DAY: "
msg_input_month: .asciiz "\nNhap thang MONTH: "
msg_input_year: .asciiz "\nNhap nam YEAR: "
msg_loop: .asciiz "\n===========MOI BAN TIEP TUC SU DUNG CHUONG TRINH============"
#Cap phat vung nho
TIME_1: .space 1000 
TIME_2: .space 1000
str_temp: .space 1000
str_temp1: .space 1000
str_temp2: .space 1000
TEMP_1: .space 1000
TEMP_2: .space 1000
buffer: .space 1000
str_cpy: .space 1000
year_temp: .space 1000
year_temp1: .space 1000
year_temp2: .space 1000
revstring: .space 1000
revstring1: .space 1000
#Menu
menu_head: .asciiz "\n\n----------Ban hay chon 1 trong cac thao tac duoi day----------\n"
option_1: .asciiz "1. Xuat chuoi TIME theo dinh dang DD/MM/YYYY\n"
option_2: .asciiz "2. Chuyen doi chuoi TIME thanh mot trong cac dinh dang sau:\n   \tA. MM/DD/YYYY\n   \tB. Month DD, YYYY\n   \tC. DD Month, YYYY\n"
option_2_type: .asciiz "Dinh dang kieu (A/B/C): "
option_3: .asciiz "3. Kiem tra nam trong chuoi TIME co phai la nam nhuan khong\n"
option_4: .asciiz "4. Cho biet ngay vua nhap la ngay thu may trong tuan:\n"
option_5: .asciiz "5. Cho biet ngay vua nhap la ngay may ke tu ngay 1/1/1.\n"
option_6: .asciiz "6. Cho biet can chi cua nam vua nhap. Vi du nam 2019 la Ky Hoi.\n"
option_7: .asciiz "7. Cho biet khoang thoi gian giua chuoi TIME_1 va TIME_2\n"
option_8: .asciiz "8. Cho biet 2 nam nhuan gan nhat voi nam trong chuoi time\n"
option_9: .asciiz "9. Nhap input tu file input.txt xuat ket qua toan bo cac chuc nang tren ra file output.txt\n"
option_10: .asciiz "10. Thoat\n"
menu_tail: .asciiz	"---------------------------------------------------------------\n"
option: .asciiz	"Lua chon: "
result: .asciiz "\nKet qua: "
#thong bao
fin: .asciiz "input.txt" 
fout: .asciiz "output.txt" 
msg_continue: .asciiz "\n1. Tiep tuc thao tac.\n2. Exit.  "
trueData: .asciiz "Du lieu dung"
msg_convert_invalid: .asciiz "Type khong phai A, B, C\n"
msg_option_invalid: .asciiz "Yeu cau nhap vao khong phai 1-9\n"
msg_leap_year: .asciiz "La nam nhuan"
msg_not_leap_year: .asciiz "La nam thuong"
msg_input_valid: .asciiz "Hop le\n"
msg_input_invalid: .asciiz "Khong hop le\n"
msg_2_leap_year_next: .asciiz "Hai nam nhuan tiep theo la \n"
msg_file_invalid1: .asciiz "Chuoi Time_1 khong hop le"
msg_file_invalid2: .asciiz "Chuoi Time_2 khong hop le"
#Can
Giap: .asciiz "Giap"
At: .asciiz "At"
Binh: .asciiz "Binh"
Dinh: .asciiz "Dinh"
Mau: .asciiz "mau"
Ky: .asciiz "Ky"
Canh: .asciiz "Canh"
Tan: .asciiz "Tan"
Nham: .asciiz "Nham"
Quy: .asciiz "Quy"
#Chi
Ty: .asciiz "Ty"
Suu: .asciiz "Suu"
Dan: .asciiz "Dan"
Meo: .asciiz "Meo"
Thin: .asciiz "Thin"
_Ty: .asciiz "Ty"
Ngo: .asciiz "Ngo"
Mao: .asciiz "Mao"
Than: .asciiz "Than"
Dau: .asciiz "Dau"
Tuat: .asciiz "Tuat"
Hoi: .asciiz "Hoi"
#File
Cau1: .asciiz "1. "
Cau2A: .asciiz "2A. "
Cau2B: .asciiz "2B. "
Cau2C: .asciiz "2C. "
Cau3: .asciiz "3. "
Cau4: .asciiz "4. "
Cau5: .asciiz "5. Khoang cach tu ngay 01/01/0001 den ngay "
Cau5_mid: .asciiz "la"
Cau5_tail: .asciiz "ngay"
Cau6: .asciiz "6. "
Cau6_mid: .asciiz "la nam"
Cau7: .asciiz "7. Khoang cach tu ngay "
Cau7_mid: .asciiz "den ngay"
Cau8: .asciiz "8. Hai nam nhuan gan voi"
Cau8_mid: .asciiz "nhat la"
Cau8_tail: .asciiz "va"
XuongDong: .asciiz "\n"

#=========================================================       
#=========================================================
#=========================================================
#=========================================================
#=========================================================
#PHAN II: CHUONG TRINH CHINH
.text
main:
#Ham main nhap time
main_input_time:
	la $a0, TIME_1
	la $a1, str_temp
	jal input_time
	move $s0,$v0
	move $s1,$v1	
	beq $s1, $0, main_input_time_again 	
	j main_print_option
#Ham main nhap lai time khi khong hop le
main_input_time_again:
	la $a0, msg_input_invalid
	li $v0, 4	
	syscall
	j main_input_time

# Ham main in ra toan bo option
main_print_option:
	la $a0, menu_head
	li $v0, 4	
	syscall
	
	la $a0, option_1
	li $v0, 4	
	syscall
	
	la $a0, option_2
	li $v0, 4	
	syscall
	
	la $a0, option_3
	li $v0, 4	
	syscall
	
	la $a0, option_4
	li $v0, 4	
	syscall
	
	la $a0, option_5
	li $v0, 4	
	syscall
	
	la $a0, option_6
	li $v0, 4	
	syscall
	
	la $a0, option_7
	li $v0, 4	
	syscall
	
	la $a0, option_8
	li $v0, 4	
	syscall
	
	la $a0, option_9
	li $v0, 4	
	syscall
	
	la $a0, option_10
	li $v0, 4	
	syscall
	
	la $a0, menu_tail
	li $v0, 4	
	syscall
	
	# Doc option cua nguoi dung, luu vao $s2
	la $a0, option
	addi $v0, $zero, 4	
	syscall
	
	addi $v0, $zero, 5	
	syscall
	add $s2, $zero, $v0

	#In thong bao ket qua
        la $a0, result
	addi $v0, $zero, 4	
	syscall
	
	# option 1
	li $t0, 1	
	beq $s2, $t0, main_opt_1
	# option 2
   	li $t0, 2	
	beq $s2, $t0, main_opt_2
	# option 3
	li $t0, 3	
	beq $s2, $t0, main_opt_3
	# option 4
	li $t0, 4	
	beq $s2, $t0, main_opt_4
	# option 5
	li $t0, 5	
	beq $s2, $t0, main_opt_5
	# option 6
	li $t0, 6	
        beq $s2, $t0, main_opt_6
	# option 7
	li $t0, 7	
	beq $s2, $t0, main_opt_7
   	# option 8
	li $t0, 8	
	beq $s2, $t0, main_opt_8
	# option 9
	li $t0, 9	
	beq $s2, $t0, main_opt_9
	# option 10
	li $t0, 10	
	beq $s2, $t0, main_opt_10
	    
	j main_opt_invalid 
# Cau 1: Xuat chuoi TIME theo ?inh dang DD/MM/YYYY  
main_opt_1:
	move $a0, $s0
	addi $v0, $zero, 4	
	syscall
	j main_loop
# Cau 2: Chuyen doi chuoi TIME thanh cac dinh dang khac nhau
main_opt_2:
	#In thong bao chon loai dinh dang A, B, C
	la $a0, option_2_type
	addi $v0, $zero, 4	
	syscall
	
	#Nhap ki tu dai dien cho loai dinh dang
	li $v0, 12	
	syscall
	
	#$s2 = type
	move $s2, $v0	

	#In ki tu xuong dong
	add $a0, $zero, 10	
	addi $v0, $zero, 11	
	syscall

	#Doi dinh dang
	move $a0, $s0	
	move $a1, $s2
	jal Convert

	# In dinh dang da chuyen doi
	move $a0, $s0
	li $v0, 4	
	syscall
	j main_loop

# Cau 3: Kiem tra nam trong chuoi TIME co phai la nam nhuan hay khong
main_opt_3:
	move $a0, $s0
	jal LeapYear
	beq $v0, $0, main_opt_3_not_leap_year
	la $a0, msg_leap_year
	li $v0, 4	
	syscall
	jal main_opt_3_exit
main_opt_3_not_leap_year:
	la $a0, msg_not_leap_year
	li $v0, 4	
	syscall
	jal main_opt_3_exit
main_opt_3_exit:
	j main_loop

# Cau 4: Cho biet ngay vua nhap la ngay thu may trong tuan
main_opt_4:
	move $a0, $s0
	jal define_day
	move $a0, $v0
	li $v0, 4	
	syscall
	j main_loop

# Cau 5: Cho biet ngay vua nhap la ngay thu may ke tu ngay 1/1/1
main_opt_5:
	#In ki tu xuong dong
	li $a0, 10	
	addi $v0, $zero, 11	
	syscall

	# Tinh khoang cach
	la $a0, daydefault
	move $a1, $s0
	jal GetTime
	
	#In ket qua
	move $a0, $v0	
	li $v0, 1
	syscall
	j main_loop

# Cau 6: Cho biet can chi cua nam vua nhap.
main_opt_6:
	move $a0,$s0
	jal CanChi
	
	#In can
	move $a0,$v0
	li $v0,4
	syscall
	
	#In dau cach
	li $a0,32
	li $v0,11
	syscall
	
	#In chi
	move $a0,$v1
	li $v0,4
	syscall
	
	j main_loop
	
# Cau 7: Cho biet khoang thoi gian giua chuoi TIME1 va TIME2
main_opt_7:
	# Nhap chuoi time thu 2
	la $a0, TIME_2
	la $a1, str_temp
	jal input_time

	# Tinh khoang cach
	la $a0, TIME_1
	la $a1, TIME_2
	jal GetTime
	
	#Chuyen ket qua vao $v1 de su dung $v0 in ki tu xuong dong
	move $v1,$v0
	
	#In ki tu xuong dong
	add $a0, $zero, 10	
	addi $v0, $zero, 11	
	syscall
	
	#In ket qua
	move $a0, $v1
	li $v0, 1
	syscall
	j main_loop
	
# Cau 8: Cho biet 2 nam nhuan gan nhat voi nam trong chuoi TIME
main_opt_8:
	#In thong bao
	la $a0, msg_2_leap_year_next
	Li $v0, 4	
	syscall

	#In nam nhuan thu nhat
	move $a0, $s0	
	jal leap_year_closer
	move $a0, $v0	
	move $s3, $v1	
	li $v0, 1 	
	syscall

	#In ki tu xuong dong
	li $a0, 10	
	li $v0, 11
	syscall

	#In nam nhaun thu hai
	move $a0, $s3
	li $v0, 1
	syscall
	j main_loop
	
# Cau 9: Nhap input tu file input.txt xuat ket qua toan bo cac chuc nang tren ra file output.txt
main_opt_9:
	la $a0, TIME_1
	la $a1, TIME_2
	la $a2, buffer
	
	jal read_file
	
	move $a0,$v0
	jal convert_space
	move $t0,$v0

	move $a0,$v1
	jal convert_space
	move $a1,$v0
	move $a0,$t0
	
	jal write_file
	j main_loop
main_opt_10:
	j main_exit
main_opt_invalid:
	la $a0, msg_option_invalid
	li $v0, 4	
	syscall
	j main_print_option
        j main_exit
main_loop:
	la $a0, msg_loop
	li $v0,4
	syscall
	j main_input_time	
main_exit:
        li $v0, 10
        syscall
        
#=========================================================       
#=========================================================
#=========================================================
#=========================================================
#=========================================================
#PHAN III: CAC HAM CHUC NANG
        
# ===================HAM SO 1===================
# Chuc nang: Ham tra ve chuoi TIME theo dinh dang DD/MM/YYYY
# Tham so:
#	$a0 DAY
#	$a1 MONTH
#	$a2 YEAR
#	$a3 address of TIME
# Ket qua tra ve:
#	$v0 address of TIME

#Dau thu tuc:
Date:
	#Khai bao stack
	addi $sp,$sp,-24
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	sw $t3,16($sp)
	sw $t4,20($sp)
	
	#int(DAY) -> string(DD)
	li $t1,10
	div $a0, $t1
	mflo $t2		
	mfhi $t3		
	addi $t2, $t2, 48	
	addi $t3, $t3, 48	
	sb $t2, 0($a3)		
	sb $t3, 1($a3)		
	addi $t4, $zero, 47	#47 = '/'
	sb $t4, 2($a3)		

	#int(MONTH) -> string(MM) 
	li $t1, 10
	div $a1, $t1
	mflo $t2		
	mfhi $t3		
	addi $t2, $t2, 48	
	addi $t3, $t3, 48	
	sb $t2, 3($a3)		
	sb $t3, 4($a3)		
	addi $t4, $zero, 47	
	sb $t4, 5($a3)		

	# int(YEAR) -> string(YYYY)
	move $t0, $a2	
	li $t1, 1000
	div $t0, $t1
	mflo $t2		
	mfhi $t0		
	addi $t2, $t2, 48	
	sb $t2, 6($a3)		

	li $t1, 100
	div $t0, $t1
	mflo $t2		
	mfhi $t0		
	addi $t2, $t2, 48	
	sb $t2, 7($a3)		

	li $t1, 10
	div $t0, $t1
	mflo $t2		
	mfhi $t0		
	addi $t2, $t2, 48	
	addi $t0, $t0, 48	
	sb $t2, 8($a3)		
	sb $t0, 9($a3)		

#Cuoi thu tuc:
	sb $zero, 10($a3)	
	move $v0, $a3	
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	lw $t3,16($sp)
	lw $t4,20($sp)
	#Xoa stack
	addi $sp,$sp,24
	#Tra ve 
	jr $ra

# ===================HAM SO 2===================
# Chuc nang: Ham tra ve chuoi TIME theo dinh dang do nguoi dung quy dinh
# Tham so:
#	$a0 TIME
#	$a1 type
#	type 'A': MM/DD/YYYY
#	type 'B': Month DD, YYYY
#	type 'C': DD Month, YYYY
# Ket qua tra ve:
#	$v0 address of TIME

#Dau thu tuc:
Convert:
	#Khai bao stack:
	addi $sp,$sp,-48
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $s0,12($sp)
	sw $t0,16($sp)
	sw $t1,20($sp)
	sw $t2,24($sp)
	sw $t3,28($sp)
	sw $t4,32($sp)
	sw $t5,36($sp)
	sw $t6,40($sp)
	sw $t7,44($sp)
#Than thu tuc:
	move $s0,$a0
	#Xac dinh type
	li $t0, 65			
	beq $a1, $t0, Convert_A

	li $t0, 66			
	beq $a1, $t0, Convert_B
	
	li $t0, 67			
	beq $a1, $t0, Convert_C
	
	j Convert_invalid
Convert_A:
	# DD/MM/YYYY -> MM/DD/YYYY
	# only swap day <-> month
	lb $t0, 0($a0)		# $t0 = TIME[0]
	lb $t1, 1($a0)		# $t1 = TIME[1]
	lb $t3, 3($a0)		# $t3 = TIME[3]
	lb $t4, 4($a0)		# $t4 = TIME[4]
	# swap
	sb $t3, 0($a0)		# TIME[0] = $t3
	sb $t4, 1($a0)		# TIME[1] = $t4
	sb $t0, 3($a0)		# TIME[3] = $t0
	sb $t1, 4($a0)		# TIME[4] = $t1
	j Convert_exit
Convert_B:
	# DD/MM/YYYY -> Month DD, YYYY
	# Month 1 -> January
	jal Month
	move $a0, $v0		# $a0 = month (int)
	jal Month_in_String
	move $t5,$v0		# save month (string)

	move $a0,$s0		# $a0 = TIME

	# Copy " DD, " from TIME[0-1] to TEMP_1
	la $t0, TEMP_1
	li $t1, 32		# 32 is ' '
	sb $t1, 0($t0)		# TEMP_1[0] = ' '

	lb $t1, 0($a0)		# D1 = TIME[0]
	sb $t1, 1($t0)		# TEMP_1[1] = D1
	lb $t1, 1($a0)		# D2 = TIME[1]
	sb $t1, 2($t0)		# TEMP_1[2] = D2

	li $t1, 44		# 44 is ','
	sb $t1, 3($t0)		# TEMP_1[3] = ','
	li $t1, 32	# 32 is ' '
	sb $t1, 4($t0)		# TEMP_1[4] = ' '
	sb $zero, 5($t0)	# TEMP_1[5] = '\0'
	move $t6,$t0		# save TEMP_1

	# Copy "YYYY" from TIME[6:9] to TEMP_2
	la $t0, TEMP_2
	lb $t1, 6($a0) 		# Y1 = TIME[6]
	sb $t1, 0($t0)		# TEMP_2[0] = Y1
	lb $t1, 7($a0) 		# Y2 = TIME[7]
	sb $t1, 1($t0)		# TEMP_2[1] = Y2
	lb $t1, 8($a0) 		# Y3 = TIME[8]
	sb $t1, 2($t0)		# TEMP_2[2] = Y3
	lb $t1, 9($a0) 		# Y4 = TIME[9]
	sb $t1, 3($t0)		# TEMP_2[3] = Y4
	sb $zero, 4($t0)	# TIME_2[4] = '\0'
	move $t7, $t0 		# save TEMP_2

	# Copy month (string) to TIME
	move $a0,$s0
	move $a1, $t5		# $a1 = month (string)
	jal strcpy

	# Noi " DD, " luu trong TEMP_1 vao TIME
	move $a0,$s0
	move $a1, $t6		# $a1 = TEMP_1
	jal strcat

	# Noi "YYYY" luu trong TEMP_2 vao TIME
	move $a0,$s0
	move $a1, $t7		# $a1 = TEMP_2
	jal strcat

	j Convert_exit
Convert_C:
	# DD/MM/YYYY -> DD Month, YYYY
	
	# Month 1 -> January
	jal Month
	add $a0, $zero, $v0	# $a0 = month (int)
	jal Month_in_String
	move $t5, $v0		# save month (string)

	move $a0, $s0		# $a0 = TIME

	# Copy "DD " from TIME[0-1] to TEMP_1
	la $t0, TEMP_1
	lb $t1, 0($a0)		# D1 = TIME[0]
	sb $t1, 0($t0)		# TEMP_1[0] = D1
	lb $t1, 1($a0)		# D2 = TIME[1]
	sb $t1, 1($t0)		# TEMP_1[1] = D2

	addi $t1, $zero, 32	# 32 is ' '
	sb $t1, 2($t0)		# TEMP_1[2] = ' '
	sb $zero, 3($t0)	# TEMP_1[3] = '\0'
	move $t6,$t0		# save TEMP_1

	# Copy ", YYYY" from TIME[6:9] to TEMP_2
	la $t0, TEMP_2
	addi $t1, $zero, 44	# 44 is ','
	sb $t1, 0($t0)		# TEMP_2[0] = ','
	addi $t1, $zero, 32	# 32 is ' '
	sb $t1, 1($t0)		# TEMP_2[1] = ' '

	lb $t1, 6($a0) 		# Y1 = TIME[6]
	sb $t1, 2($t0)		# TEMP_2[2] = Y1
	lb $t1, 7($a0) 		# Y2 = TIME[7]
	sb $t1, 3($t0)		# TEMP_2[3] = Y2
	lb $t1, 8($a0) 		# Y3 = TIME[8]
	sb $t1, 4($t0)		# TEMP_2[4] = Y3
	lb $t1, 9($a0) 		# Y4 = TIME[9]
	sb $t1, 5($t0)		# TEMP_2[5] = Y4
	sb $zero, 6($t0)	# TIME_2[6] = '\0'
	move $t7, $t0 		# save TEMP_2

	# Copy "DD " luu trong TEMP_1 vao TIME
	move $a0,$s0
	move $a1, $t6		# $a1 = TEMP_1
	jal strcpy

	# Noi month (string) vao TIME
	move $a0,$s0
	move $a1, $t5		# $a1 = month (string)
	jal strcat

	# Noi ", YYYY" luu trong TEMP_2 vao TIME
	move $a0,$s0
	move $a1, $t7		# $a1 = TEMP_2
	jal strcat

	j Convert_exit
Convert_invalid:
	la $a0, msg_convert_invalid
	addi $v0, $zero, 4	# syscall print string
	syscall

	j Convert_exit
Convert_exit:
	add $v0, $zero, $s0	# tra ve $a0 giu dia chi TIME
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $s0,12($sp)
	lw $t0,16($sp)
	lw $t1,20($sp)
	lw $t2,24($sp)
	lw $t3,28($sp)
	lw $t4,32($sp)
	lw $t5,36($sp)
	lw $t6,40($sp)
	lw $t7,44($sp)
	#Xoa stack:
	addi $sp,$sp,48
	#Tra ve:
	jr $ra

# ===================HAM SO 3===================
# Chuc nang: Ham tra ve ngay trong TIME: DD/MM/YYYY
# Tham so:
#	$a0 TIME
# Ket qua tra ve:
#	$v0 day in TIME (int)

#Dau thu tuc:
Day:
	#Khai bao stack
	addi $sp, $sp, -4
	#Backup thanh ghi
	sw $ra, 0($sp)
#Than thu tuc:
	# Day is TIME[0:1]
	li $a1, 0
	li $a2, 1
	jal atoi
#Cuoi thu tuc:
	#Restore thanh ghi
	lw $ra, 0($sp)
	#Xoa stack
	addi $sp, $sp, 4
	#Tra ve
	jr $ra

# ===================HAM SO 4===================
# Chuc nang: Ham tra ve thang trong TIME: DD/MM/YYYY
# Tham so:
#	$a0 TIME
# Ket qua tra ve:
# 	$v0 month in TIME (int)

#Dau thu tuc:
Month:
	#Khai bao stack
	addi $sp, $sp, -4
	#Backup thanh ghi
	sw $ra, 0($sp)
#Than thu tuc:
	# Month is TIME[3:4]
	li $a1, 3
	li $a2, 4
	jal atoi
#Cuoi thu tuc:
	#Restore thanh ghi
	lw $ra, 0($sp)
	#Xoa stack
	addi $sp, $sp, 4
	#Tra ve
	jr $ra

# ===================HAM SO 5===================
# Chuc nang: Ham tra ve nam trong TIME: DD/MM/YYYY
# Tham so:
#	$a0 TIME
# Ket qua tra ve:
# 	$v0 year in TIME (int)

#Dau thu tuc:
Year:
	#Khai bao stack
	addi $sp, $sp, -4
	#Backup thanh ghi
	sw $ra, 0($sp)
#Than thu tuc:
	# Year is TIME[6:9]
	li $a1, 6
	li $a2, 9
	jal atoi
#Cuoi thu tuc:
	#Restore thanh ghi
	lw $ra, 0($sp)
	#Xoa stack
	addi $sp, $sp, 4
	#Tra ve
	jr $ra

# ===================HAM SO 6===================
# Ham kiem tra nam nhuan chi voi nam
# Tham so: 
# 	$a0 year(int)
# Ket qua tra ve:
	#$v0: 1 - nam nhuan, 0 - nam khong nhuan
	
#Dau thu tuc:
only_year_is_leap:
	#Khai bao stack
	addi $sp,$sp,-12
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t1,4($sp)
	sw $t2,8($sp)
	
#Than thu tuc
	li $t1, 400
	div $a0, $t1
	mfhi $t2 				# $t2 = year % 400
	beq $t2, $zero, only_year_is_leap_true	# neu year chia het cho 400

	li $t1, 4
	div $a0, $t1
	mfhi $t2 				# $t2 = year % 4
	bne $t2, $zero, only_year_is_leap_false # neu year khong chia het cho 4

	li $t1, 100
	div $a0, $t1
	mfhi $t2 				# $t2 = year % 100
	beq $t2, $zero, only_year_is_leap_false # neu year chia het cho 4 va 100
only_year_is_leap_true:
	li $v0, 1
	j only_year_is_leap_exit
only_year_is_leap_false:
	li $v0, 0
only_year_is_leap_exit:
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t1,4($sp)
	lw $t2,8($sp)
	#Xoa stack
	addi $sp,$sp,12
	#Tra ve
	jr $ra

# ===================HAM SO 7===================
# Ham kiem tra nam nhuan voi input la TIME
# Tham so:
#	$a0 TIME
# Ket qua tra ve:
# 	$v0 tra ve 	1 - nam nhuan, 0 - khong phai

#Dau thu tuc:
LeapYear:
	#Khai bao stack
	addi $sp, $sp, -4
	#Backup thanh ghi
	sw $ra, 0($sp)

	jal Year
	move $a0, $v0
	jal only_year_is_leap
#Cuoi thu tuc:
	#Restore thanh ghi
	lw $ra, 0($sp)
	#Xoa stack
	addi $sp, $sp, 4
	#Tra ve
	jr $ra
	
# ===================HAM SO 8===================
# Chuc nang: Chuyen tu ki tu x den ki tu y chuoi thanh so
# Tham so:
#	$a0 str
#	$a1 from
# 	$a2 to
#Ket qua tra ve:
#	$v0 int

#Dau thu tuc:
atoi:
	#Khai bao stack
	addi $sp,$sp,-20
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	sw $t3,16($sp)
#Than thu tuc:
	#Khoi tao cac gia tri
	li $v0, 0		# Khoi tao $v0 = 0, $v0 chua ket qua
	add $t0, $a0, $a1	# Vi tri ki tu dau tien 
	add $t1, $a0, $a2	# Vi tri ki tu cuoi cung
	addi $t1, $t1, 1	# $t1 = $t1 + 1 de xet dieu kien <=
atoi_sum_loop:
	slt $t2, $t0, $t1
	beq $t2, $zero, atoi_exit	

	li $t3, 10
	mult $v0, $t3
	mflo $v0		# $v0 = $v0*10
	lb $t3, 0($t0)		# $t3 chua ki tu chu so dang xet
	addi $t3, $t3, -48	# Chuyen ki tu so -> ki so
	add $v0, $v0, $t3	 
	addi $t0, $t0, 1	
	j atoi_sum_loop
atoi_exit:
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	lw $t3,16($sp)
	#Xoa stack
	addi $sp,$sp,20
	#Tra ve
	jr $ra
	
# ===================HAM SO 9===================
# Chuc nang: atoi cho truong hop nguyen chuoi (doc den '\0')
# Tham so: 
# 	$a0 str
# Ket qua tra ve:
# 	$v0 int

#Dau thu tuc:
atoi_whole:
	#Khai bao stack
	addi $sp,$sp,-16
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
#Than thu tuc:
	li $v0, 0
	move $t0, $a0
atoi_whole_loop:
	#Kiem tra truong hop chuoi rong
	lb $t1, 0($t0)				
	beq $t1, $zero, atoi_whole_exit		
	
	li $t2, 10
	beq $t1, $t2, atoi_whole_exit		
	mult $v0, $t2
	mflo $v0		
	addi $t1, $t1, -48	
	add $v0, $v0, $t1	
	add $t0, $t0, 1		
	j atoi_whole_loop
#Cuoi thu tuc:
atoi_whole_exit:
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	#Xoa stack
	addi $sp,$sp,16
	#Tra ve
	jr $ra
	
# ===================HAM SO 10===================
# Chuc nang: Ham kiem tra tinh hop le logic cua ngay, thang, nam vua nhap
# Tham so:
# 	$a0 TIME
# Ket qua tra ve:
# 	$v0 tinh hop le 	1 - hop le, 0 - khong hop le

#Dau thu tuc:
check_valid:
	# Khai bao stack
	addi $sp, $sp, -36
	#Backup thanh ghi
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $t0, 8($sp)
	sw $t1, 12($sp)
	sw $t2, 16($sp)
	sw $t3, 20($sp)
	sw $t4, 24($sp)
	sw $t5, 28($sp)
	sw $t6, 32($sp)
		
#Than thu tuc:
	move $s0,$a0
	jal Month				
	move $t1, $v0			# $t1 = month
	slti $t0, $t1, 1
	bne $t0, $zero, check_valid_0 	# neu month < 1
	slti $t0, $t1, 13
	beq $t0, $zero , check_valid_0 	# neu month >= 13
	move $t6,$t1

	# Check day in month
	move $a0,$s0
	jal Day
	move $t2, $v0			# $t2 = day
	move $t1, $t6			

	li $t3, 1			# $t3 = thang 1
	beq $t1, $t3, check_31_day
	li $t3, 2			# $t3 = thang 2
	beq $t1, $t3, check_month_2
	li $t3, 3
	beq $t1, $t3, check_31_day
	addi $t3, $zero, 4
	beq $t1, $t3, check_30_day
	addi $t3, $zero, 5
	beq $t1, $t3, check_31_day
	addi $t3, $zero, 6
	beq $t1, $t3, check_30_day
	addi $t3, $zero, 7
	beq $t1, $t3, check_31_day
	addi $t3, $zero, 8
	beq $t1, $t3, check_31_day
	addi $t3, $zero, 9
	beq $t1, $t3, check_30_day
	addi $t3, $zero, 10
	beq $t1, $t3, check_31_day
	addi $t3, $zero, 11
	beq $t1, $t3, check_30_day
	addi $t3, $zero, 12
	beq $t1, $t3, check_31_day
check_31_day:
	slti $t0, $t2, 1
	bne $t0, $zero, check_valid_0	# neu day < 1
	slti $t0, $t2, 32
	beq $t0, $zero, check_valid_0	# neu day >= 32
	j check_valid_1
check_30_day:
	slti $t0, $t2, 1
	bne $t0, $zero, check_valid_0	# neu day < 1
	slti $t0, $t2, 31
	beq $t0, $zero, check_valid_0	# neu day >= 31
	j check_valid_1
check_month_2:
	slti $t0, $t2, 1
	bne $t0, $zero, check_valid_0	# neu day <1
	slti $t0, $t2, 30
	beq $t0, $zero, check_valid_0	# neu day >= 30
	
	move $a0,$s0
	jal LeapYear
	beq $v0, $zero, check_month_2_not_leap_year	# neu nam khong nhuan
	j check_valid_1
check_month_2_not_leap_year:
	li $t5, 29
	beq $t2, $t5, check_valid_0	# neu day = 29
	j check_valid_1
check_valid_1:
	li $v0, 1			# $v0 = 1, hop le
	j check_valid_exit
check_valid_0:
	li $v0, 0			# $v0 = 0, khong hop le
	j check_valid_exit
check_valid_exit:
	#Restore thanh ghi
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $t0, 8($sp)
	lw $t1, 12($sp)
	lw $t2, 16($sp)
	lw $t3, 20($sp)
	lw $t4, 24($sp)
	lw $t5, 28($sp)
	lw $t6, 32($sp)
	#Xoa stack
	addi $sp, $sp, 36
	#Tra ve
	jr $ra

# ===================HAM SO 11===================
# Chuc nang:  Ham tra ve khoang cach thoi gian, tinh bang ngay
# Tham so:
#	$a0 TIME_1
#	$a1 TIME_2
# Ket qua tra ve:
#	$v0: number of day (int)
	
#Dau thu tuc:
GetTime:
	# Khai bao stack
	addi $sp, $sp, -48
	#Backup thanh ghi
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $t0, 12($sp)
	sw $t1, 16($sp)
	sw $t2, 20($sp)
	sw $t3, 24($sp)
	sw $t4, 28($sp)
	sw $t5, 32($sp)
	sw $t6, 36($sp)
	sw $t7, 40($sp)
	sw $t8, 44($sp)
	
#Than thu tuc:
	move $s0,$a0
	move $s1,$a1
	
	# save TIME_1
	jal Year
	move $t2,$v0
	jal Month
	move $t3,$v0
	jal Day
	move $t4,$v0

	# save TIME_2
	move $a0,$s1
	jal Year
	move $t5,$v0
	jal Month
	move $t6,$v0
	jal Day
	move $t7,$v0

	# ngay tuyet doi TIME_1
	move $a0, $t2		# get Year(TIME_1)
	move $a1, $t3		# get Month(TIME_1)
	move $a2, $t4		# get Day(TIME_1)
	jal absolute_day
	move $t8,$v0		# save ngay tuyet doi TIME_1

	# ngay tuyet doi TIME_2
	move $a0, $t5		# get Year(TIME_2)
	move $a1, $t6		# get Month(TIME_2)
	move $a2, $t7		# get Day(TIME_2)
	jal absolute_day
	move $t0, $t8		# get ngay tuyet doi TIME_1
	sub $v0, $v0, $t0	# tru 2 ngay tuyet doi

	# Kiem tra ket qua < 0 hay khong
	slt $t1, $v0, $zero
	beq $t1, $zero, GetTime_exit
	sub $v0, $zero, $v0
#Cuoi thu tuc:
GetTime_exit:
	#Restore from stack
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $t0, 12($sp)
	lw $t1, 16($sp)
	lw $t2, 20($sp)
	lw $t3, 24($sp)
	lw $t4, 28($sp)
	lw $t5, 32($sp)
	lw $t6, 36($sp)
	lw $t7, 40($sp)
	lw $t8, 44($sp)
	#Xoa stack
	addi $sp, $sp, 48
	#Tra ve
	jr $ra

# ===================HAM SO 12===================
# Chuc nang: Ham nhap TIME
# Tham so: 
#	$a0 TIME 		luu DD/MM/YYYY
#	$a1 str_temp		bien tam
# Ket qua tra ve:
# 	$v0 TIME 		address of TIME
#	$v1 tinh hop le 	1 - hop le, 0 - khong hop le

#Dau thu tuc:
input_time:
	# Khai bao stack
	addi $sp, $sp, -32
	#Backup thanh ghi
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	sw $t0, 16($sp)
	sw $t1, 20($sp)
	sw $t2, 24($sp)
	sw $t3, 28($sp)
	
#Than thu tuc:
	move $s1,$a0
	move $s2,$a1
	
	# $s0 kiem tra hop le bang cach
	# tinh tong hop le ngay thang nam
	# neu $s0 == 3, ngay thang nam deu hop le
	# Khoi tao $s0 = 0
	li $s0, 0

	# Nhap chuoi ngay
	addi $v0, $zero, 4	
	la $a0, msg_input_day
	syscall
	
	addi $v0, $zero, 8	
	move $a0, $s2
	addi $a1, $zero, 3	
	syscall
	
	jal is_only_digits	
	add $s0, $s0, $v0 	# $s0 += hop le ngay
	
	# Chuyen ngay string -> int
	move $a0, $s2		# $a0 save str_temp
	jal atoi_whole
	move $t1, $v0		# luu ngay dang int vao $t1

	# Nhap chuoi thang
	addi $v0, $zero, 4	
	la $a0, msg_input_month
	syscall
	
	addi $v0, $zero, 8	
	move $a0, $s2		
	addi $a1, $zero, 3 	
	syscall
	jal is_only_digits 	
	add $s0, $s0, $v0	# $s0 += hop le thang
	
	# Chuyen thang string -> int
	move $a0, $s2		# $a0 save str_temp
	jal atoi_whole
	move $t2,$v0	 	# luu thang dang int vao $t2

	# Nhap chuoi nam
	addi $v0, $zero, 4	
	la $a0, msg_input_year
	syscall
	
	addi $v0, $zero, 8 	
	move $a0, $s2	
	addi $a1, $zero, 5 	
	syscall
	
	jal is_only_digits 	
	add $s0, $s0, $v0	# $s0 += hop le nam
	
	# Chuyen nam string -> int
	move $a0, $s2	 	# $a0 save str_temp
	jal atoi_whole
	move $t3, $v0 		# luu nam dang int vao $t3

	# Nhap vao TIME theo chuan DD/MM/YYYY
	move $a0, $t1		# ngay dang int
	move $a1, $t2 		# thang dang int
	move $a2, $t3 		# nam dang int
	move $a3, $s1	 	# dia chi luu TIME
	jal Date

	# Kiem tra TIME hop le syntax
	li $t0, 3	# tong hop le ngay thang nam
	bne $s0, $t0, input_time_non_valid

	# Kiem tra TIME hop le logic
	move $a0, $s1
	jal check_valid
	beq $v0, $zero, input_time_non_valid

	addi $v1, $zero, 1	# $v1 = 1, hop le
	j input_time_exit
input_time_non_valid:
	li $v1, 0		# $v1 = 0, khong hop le
#Cuoi thu tuc:
input_time_exit:
	#Tra dia chi chuoi ve $v0
	move $v0,$s1
	# restore from stack
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $t0, 16($sp)
	lw $t1, 20($sp)
	lw $t2, 24($sp)
	lw $t3, 28($sp)
	#Xoa stack
	addi $sp, $sp, 32
	#Tra ve:
	jr $ra

# ===================HAM SO 13===================
# Chuc nang: Ham kiem tra tinh hop le syntax cua chuoi ngay(thang, nam) nhap vao. Hop le nghia la chuoi chi chua digits [0-9]
# Tham so:
#	$a0 string
# Ket qua tra ve:
#	$v0 tinh hop le 	1 - hop le, 0 - khong hop le

#Dau thu tuc:
is_only_digits:
	#Khai bao stack
	addi $sp,$sp,-16
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)

#Than thu tuc:
	move $t0, $a0		# $t0 la con tro p, p = string
	li $v0, 1		# $v0 = 1, mac dinh la hop le
is_only_digits_loop:
	lb $t1, 0($t0)				# $t1 = *p
	beq $t1, $zero, is_only_digits_exit 	# neu *p == '\0'
	addi $t2, $zero, 10
	beq $t1, $t2, is_only_digits_exit 	# neu *p == '\n'
	slti $t2, $t1, 48			# 48 la '0'
	bne $t2, $zero, is_only_digits_non	# neu *p < '0'
	slti $t2, $t1, 58			# 57 la '9'
	beq $t2, $zero, is_only_digits_non	# neu *p > '9'
	addi $t0, $t0, 1			# p += 1
	j is_only_digits_loop
is_only_digits_non:
	li $v0, 0		# $v0 = 0, khong hop le
is_only_digits_exit:
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	#Xoa stack
	addi $sp,$sp,16
	#Tra ve:
	jr $ra

# ===================HAM SO 14===================
# Chuc nang: Ham dem so nam nhuan tu nam 0 den nam hien tai theo cong thuc
# 	Neu thang < 3, nam tru di 1 don vi
# 	Ket qua = nam / 4 - nam / 100 + nam / 400
# Tham so: 
# 	$a0 nam hien tai
#	$a1 thang hien tai
# Ket qua tra ve:
# 	$v0 so nam nhuan 0 -> year

#Dau thu tuc:
count_leapYear:
	#Khai bao stack
	addi $sp,$sp,-20
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	sw $t3,16($sp)
	
#Than thu tuc:
	move $t0, $a0	 		# $t0 = nam
	slti $t2, $a1, 3		
	beq $t2, $zero, count_skip 	# neu thang >= 3
	addi $t0, $t0, -1		# nam -= 1
count_skip:
	move $t2, $t0	 		# $t2 = nam
	li $t3, 4 			# So chia $t3 = 4
	div $t2, $t3			# nam / 4
	mflo $v0   			# $v0 = nam / 4

	move $t2, $t0	 		# $t2 = nam
	li $t3, 100 			# So chia $t3 = 100
	div $t2, $t3 			# nam / 100
	mflo $t2 			# $t2 = nam / 100
	sub $v0, $v0, $t2 		# $v0 = nam / 4 - nam / 100

	move $t2, $t0	 		# $t2 = nam
	li $t3, 400	 		# So chia t3 = 400
	div $t2, $t3 			# nam / 400
	mflo $t2 			# $t2 = nam / 400
	add $v0, $v0, $t2 		# $v0 = nam / 4 - nam / 100 + nam / 400
#Cuoi thu tuc:
	#Restore thanh ghi	
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	sw $t3,16($sp)
	#Xoa stack
	addi $sp,$sp,20
	#Tra ve
	jr $ra
	
# ===================HAM SO 15===================
# Chuc nang: Ham copy string y -> string x
# Tham so: 
# 	$a0: string x
#	$a1: string y
# Ket qua tra ve: 
#	$v0: string x
#Dau thu tuc:
strcpy:
	#Khai bao stack
	addi $sp, $sp, -16
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	
#Than thu tuc:
	move $t0,$a1
	move $t2,$a0
strcpy_loop:
	lb $t1, 0($t0) 			
	sb $t1, 0($t2) 			
	beq $t1, $0, strcpy_exit	# Neu x[i] == '\0'
	addi $t0, $t0, 1		
	addi $t2, $t2, 1		
	j strcpy_loop
strcpy_exit:
	move $v0,$a0
	# restore from stack
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	#Xoa stack
	addi $sp, $sp, 16
	#Tra ve:
	jr $ra
	

# ===================HAM SO 16===================
# Chuc nang: Ham noi chuoi y vao chuoi x
# 	x la "aa", y la "b" ket qua x la "aab"
# Tham so: 
# 	$a0 string x
#	$a1 string y
# Ket qua tra ve:
# 	$v0 string x

#Dau thu tuc:
strcat:
	#Khai bao stack
	addi $sp, $sp, -44
	#Backup thanh ghi
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 12($sp)
	sw $t0, 16($sp)
	sw $t1, 20($sp)
	sw $t2, 24($sp)
	sw $t3, 28($sp)
	sw $t4, 32($sp)
	sw $t5, 36($sp)
	sw $t6, 40($sp)
	
#Than thu tuc:
	move $t3, $a0		
	move $t6, $a1
strcat_findEndLoop:
	lb $t4, 0($t3) 			
	beq $t4, $zero, appendLoop	
	addi $t3,$t3,1  		
	j strcat_findEndLoop
appendLoop:
	lb $t5, 0($t6) 			
	sb $t5, 0($t3) 			
	beq $t5, $0, strcat_exit	
	addi $t3, $t3, 1		
	addi $t6, $t6, 1		
	j appendLoop
strcat_exit:
	#Restore from stack
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $ra, 12($sp)
	lw $t0, 16($sp)
	lw $t1, 20($sp)
	lw $t2, 24($sp)
	lw $t3, 28($sp)
	lw $t4, 32($sp)
	lw $t5, 36($sp)
	lw $t6, 40($sp)
	#Xoa stack
	addi $sp, $sp, 44
	#Tra ve
	jr $ra

# ===================HAM SO 17===================
# Chuc nang: Ham tra ve ten thang trong nam
# Tham so:
#	$a0 month (integer)
# Ket qua tra ve:
# 	$v0 month (string)

#Dau thu tuc:
Month_in_String:
	#Khai bao stack
	addi $sp,$sp,-8
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
#Than thu tuc:
	slti $t0, $a0, 2 	# if month < 2 => month == 1
	bne $t0, $zero, Jan 	# jump to January

	slti $t0, $a0, 3 	# if month < 3 => month == 2
	bne $t0, $zero, Feb 	# jump to February

	slti $t0, $a0, 4	# if month < 4 => month == 3
	bne $t0, $zero, Mar 	# jump to March

	slti $t0, $a0, 5 	# if month < 5 => month == 4
	bne $t0, $zero, Apr 	# jump to April

	slti $t0, $a0, 6 	# if month < 6 => month == 5
	bne $t0, $zero, May 	# jump to May

	slti $t0, $a0, 7 	# if month < 7 => month == 6
	bne $t0, $zero, Jun 	# jump to June

	slti $t0, $a0, 8 	# if month < 8 => month == 7
	bne $t0, $zero, Jul 	# jump to July

	slti $t0, $a0, 9 	# if month < 9 => month == 8
	bne $t0, $zero, Aug 	# jump to August

	slti $t0, $a0, 10 	# if month < 10 => month == 9
	bne $t0, $zero, Sep 	# jump to September

	slti $t0, $a0, 11 	# if month < 11 => month == 10
	bne $t0, $zero, Oct 	# jump to October

	slti $t0, $a0, 12 	# if month < 12 => month == 11
	bne $t0, $zero, Nov 	# jump to November

	j Dec 			# jump to December
Jan:
	la $v0, Month_1
	j Month_in_Year_exit
Feb:
	la $v0, Month_2
	j Month_in_Year_exit
Mar:
	la $v0, Month_3
	j Month_in_Year_exit
Apr:
	la $v0, Month_4
	j Month_in_Year_exit
May:
	la $v0, Month_5
	j Month_in_Year_exit
Jun:
	la $v0, Month_6
	j Month_in_Year_exit
Jul:
	la $v0, Month_7
	j Month_in_Year_exit
Aug:
	la $v0, Month_8
	j Month_in_Year_exit
Sep:
	la $v0, Month_9
	j Month_in_Year_exit
Oct:
	la $v0, Month_10
	j Month_in_Year_exit
Nov:
	la $v0, Month_11
	j Month_in_Year_exit
Dec:
	la $v0, Month_12
	
#Cuoi thu tuc:
Month_in_Year_exit:
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t0,4($sp)
	#Xoa stack
	addi $sp,$sp,8
	#Tra ve
	jr $ra

# ===================HAM SO 18===================
# Chuc nang: Ham dem so ngay tuyet doi theo cong thuc
# 	ngayTuyetDoi = nam * 365 + ngayTuyetDoiTrongNam + soNamNhuan
# 	soNamNhuan la so nam nhuan tu nam 0 den nam hien tai
# 	ngayTuyetDoiTrongNam duoc tinh theo nam thuong, khong xet truong hop nam nhuan
# Tham so:
# 	$a0 nam (int)
# 	$a1 thang (int)
#	$a2 ngay (int)
# Ket qua tra ve:
#	$v0: So ngay tuyet doi (int)

#Dau thu tuc:
absolute_day:
	#Khai bao stack
	addi $sp,$sp,-12
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)

#Than thu tuc:
	# Ket qua += nam * 365
	move $v0, $a0 		# Ket qua = nam
	li $t0, 365	 	# Gan bien tam t0 = 365
	mult $v0, $t0 		# Thuc hien phep nhan nam * 365
	mflo $v0 		# Ket qua = nam * 365

	# Ket qua += ngay
	add $v0, $v0, $a2 	# Ket qua = nam * 365 + ngay

	# Ket qua += ngay trong thang truoc do
	li $t0, 1 		# Gan bien tam t0 = 1 (thang 1)
	bne $t0, $a1, absolute_day_t2
	j absolute_day_next
absolute_day_t2:
	li $t0, 2	 	# Gan bien tam t0 = 2 (thang 2)
	bne $t0, $a1, absolute_day_t3
	addi $v0, $v0, 31 	# Ket qua = nam * 365 + ngayTuyetDoiTrongNam
	j absolute_day_next
absolute_day_t3:
	li $t0, 3 		# Gan bien tam t0 = 3 (thang 3)
	bne $t0, $a1, absolute_day_t4
	addi $v0, $v0, 59 	# Ket qua = nam * 365 + ngayTuyetDoiTrongNam
	j absolute_day_next
absolute_day_t4:
	li $t0, 4	 	# Gan bien tam t0 = 4 (thang 4)
	bne $t0, $a1, absolute_day_t5
	addi $v0, $v0, 90 	# Ket qua = nam * 365 + ngayTuyetDoiTrongNam
	j absolute_day_next
absolute_day_t5:
	li $t0, 5	 	# Gan bien tam t0 = 5 (thang 5)
	bne $t0, $a1, absolute_day_t6
	addi $v0, $v0, 120 	# Ket qua = nam * 365 + ngayTuyetDoiTrongNam
	j absolute_day_next
absolute_day_t6:
	li $t0, 6 		# Gan bien tam t0 = 6 (thang 6)
	bne $t0, $a1, absolute_day_t7
	addi $v0, $v0, 151 	# Ket qua = nam * 365 + ngayTuyetDoiTrongNam
	j absolute_day_next
absolute_day_t7:
	li $t0, 7	 	# Gan bien tam t0 = 7 (thang 7)
	bne $t0, $a1, absolute_day_t8
	addi $v0, $v0, 181 	# Ket qua = nam * 365 + ngayTuyetDoiTrongNam
	j absolute_day_next
absolute_day_t8:
	li $t0, 8	 	# Gan bien tam t0 = 8 (thang 8)
	bne $t0, $a1, absolute_day_t9
	addi $v0, $v0, 212 	#Ket qua = nam * 365 + ngayTuyetDoiTrongNam
	j absolute_day_next
absolute_day_t9:
	li $t0, 9	 	# Gan bien tam t0 = 9 (thang 9)
	bne $t0, $a1, absolute_day_t10
	addi $v0, $v0, 243	# Ket qua = nam * 365 + ngayTuyetDoiTrongNam
	j absolute_day_next
absolute_day_t10:
	li $t0, 10	 	# Gan bien tam t0 = 10 (thang 10)
	bne $t0, $a1, absolute_day_t11
	addi $v0, $v0, 273 	# Ket qua = nam * 365 + ngayTuyetDoiTrongNam
	j absolute_day_next
absolute_day_t11:
	li $t0, 11	 	# Gan bien tam t0 = 11 (thang 11)
	bne $t0, $a1, absolute_day_t12
	addi $v0, $v0, 304 	# Ket qua = nam * 365 + ngayTuyetDoiTrongNam
	j absolute_day_next
absolute_day_t12:
	addi $v0, $v0, 334 	# Ket qua = nam * 365 + ngayTuyetDoiTrongNam
absolute_day_next:
	move $t1,$v0
	jal count_leapYear	#$a0, $a1 ban dau van giu nguyen gia tri vi cha goi ham
	add $v0, $v0, $t1 	# ketqua = nam * 365 + ngayTuyetDoiTrongNam + soNamNhuan
absolute_day_exit:
	#Restore
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	#Xoa stack
		addi $sp,$sp,12
	#Tra ve
	jr $ra

# ===================HAM SO 19===================
# Chuc nang: Ham tinh thu cua 1 ngay
# 	so nguyen 1 -> 7 tuong ung chu nhat -> thu 7
# 	Xac dinh ngay 31/12/1 TCN la thu 7 -> bieu dien boi thu 7
# 	Khoang cach giua mot ngay bat ki voi ngay 31/12/1 TCN chinh la gia tri ngay tuyet doi cua no
# 	Cong thuc xac dinh thu cua ngay bat ki
# 	thuNgayBatKi = (thuNgayCuoiTCN + giaTriNgayTuyetDoi mod 7) mod 7 = (7 + giaTriNgayTuyetDoi mod 7) mod 7
# 	Neu thu duoc ket qua la 0, ta cong ket qua them cho 7
# Tham so:
#	$a0 TIME
# Ket qua tra ve
#	$v0: Dia chi chuoi bieu dien thu

#Dau thu tuc:
define_day:

	#Khai bao stack
	addi $sp, $sp, -24
	#Backup thanh ghi
	sw $ra, 0($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $t0, 12($sp)
	sw $t1, 16($sp)
	sw $t2, 20($sp)
	

	jal Year
	move $t0, $v0		# save Year(TIME)
	jal Month
	move $t1,$v0		# save Month(TIME)
	jal Day
	move $t2, $v0		# save Day(TIME)

	move $a0, $t0		# get Year(TIME)
	move $a1, $t1		# get Month(TIME)
	move $a2, $t2		# get Day(TIME)
	jal absolute_day	# Tinh gia tri tuyet doi cua ngay, ket qua luu trong $v0
	
	li $t0, 7 		# Gan bien tam t0 = 7
	div $v0, $t0
	mfhi $v0 		# $v0 = giaTriNgayTuyetDoi mod 7
	addi $v0, $v0, 7	# $v0 = giaTriNgayTuyetDoi mod 7 + 7
	div $v0, $t0
	mfhi $v0 		# $v0 = (7 + giaTriNgayTuyetDoi mod 7) mod 7
	bne $v0, $zero, define_day_next
	addi $v0, $zero, 7	# Neu ket qua bang 0 thi lay ket qua la 7
define_day_next:
	li $t0, 1 		# Gan bien tam t0 bang 1 (Chu nhat)
	bne $v0, $t0, define_day_2
	la $v0, Day_CN
	j define_day_end
define_day_2:
	li $t0, 2	 	# Gan bien tam t0 bang 2 (Thu 2)
	bne $v0, $t0, define_day_3
	la $v0, Day_2
	j define_day_end
define_day_3:
	li $t0, 3	 	# Gan bien tam t0 bang 3 (Thu 3)
	bne $v0, $t0, define_day_4
	la $v0, Day_3
	j define_day_end
define_day_4:
	li $t0, 4	 	# Gan bien tam t0 bang 4 (Thu 4)
	bne $v0, $t0, define_day_5
	la $v0, Day_4
	j define_day_end
define_day_5:
	li $t0, 5 		# Gan bien tam t0 bang 5 (Thu 5)
	bne $v0, $t0, define_day_6
	la $v0, Day_5
	j define_day_end
define_day_6:
	li $t0, 6	 	# Gan bien tam t0 bang 6 (Thu 6)
	bne $v0, $t0, define_day_7
	la $v0, Day_6
	j define_day_end
define_day_7:
	la $v0, Day_7
define_day_end:
	# restore from stack
	lw $ra, 0($sp)
	lw $a1, 4($sp)
	lw $a2, 8($sp)
	lw $t0, 12($sp)
	lw $t1, 16($sp)
	lw $t2, 20($sp)
	#Xoa stack
	addi $sp, $sp, 24
	#Tra ve
	jr $ra

# ===================HAM SO 20===================
# Chuc nang: Ham tra ve hai nam nhuan gan TIME nhat
# Tham so:
# 	$a0 TIME
# Ket qua tra ve:
#	$v0 nam nhuan 1
#	$v1 nam nhuan 2

#Dau thu tuc:
leap_year_closer:
	#Khai bao stack
	addi $sp, $sp, -16
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	
#Than thu tuc:
	move $s0,$a0
	jal Year
	move $a0,$v0
	move $t3,$v0
	jal only_year_is_leap
	bne $v0,$0,inputleap		#Kiem tra nam nay co nhuan khong
	
	move $v0,$t3
	addi $v0, $v0, 1
	move $t1, $v0		# i = year + 1
leap_year_closer_loop:
	move $a0, $t1		# get i
	jal only_year_is_leap
	bne $v0, $zero, leap_year_closer_next
	addi $t1, $t1, 1	# i += 1
	j leap_year_closer_loop
leap_year_closer_next:
	move $a0, $t1		# get i
	addi $a0, $a0, -4	# i += 4 (may be leap year ?)
	move $t2, $a0
	jal only_year_is_leap
	bne $v0, $zero, leap_year_closer_exit
	move $t0, $t1
	addi $t0, $t0, -8	# i += 8 make sure leap year
inputleap:
	addi $t2,$t3,-4
	addi $t1,$t3,4
#Cuoi thu tuc:	
leap_year_closer_exit:
	move $v0, $t2
	move $v1, $t1
	#Restore from stack
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	#Xoa stack
	addi $sp, $sp, 16
	#Tra ve
	jr $ra

# ===================HAM SO 21===================
#Chuc nang: Tinh nam can chi
#Tham so: 
#	$a0: TIME
#Ket qua tra ve:
#	$v0: Dia chi chuoi bieu dien Can
#	$v1: Dia chi chuoi bieu dien Chi

#Dau thu tuc:
CanChi:
	#Khai bao stack
	addi $sp,$sp,-20
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $t0,8($sp)
	sw $t1,12($sp)
	sw $t2,16($sp)
		
#Than thu tuc:
	#Lay nam trong chuoi 
	jal Year
	move $t0, $v0
	move $t1, $v0
SetCan:		
	addi $t0,$t0,6
	li $t2,10
	div $t0,$t2
	mfhi $t0
	
	li $t2,0
	beq $t2,$t0,Set1
	
	li $t2,1
	beq $t2,$t0,Set2
	
	li $t2,2
	beq $t2,$t0,Set3
	
	li $t2,3
	beq $t2,$t0,Set4
	
	li $t2,4
	beq $t2,$t0,Set5
	
	li $t2,5
	beq $t2,$t0,Set6
	
	li $t2,6
	beq $t2,$t0,Set7
	
	li $t2,7
	beq $t2,$t0,Set8
	
	li $t2,8
	beq $t2,$t0,Set9
	
	li $t2,9
	beq $t2,$t0,Set10
	
Set1:
	la $a0,Giap
	move $v0,$a0
	j SetChi
Set2:
	la $a0,At
	move $v0,$a0
	j SetChi
Set3:
	la $a0,Binh
	move $v0,$a0
	j SetChi
Set4:
	la $a0,Dinh
	move $v0,$a0
	j SetChi
Set5:
	la $a0,Mau
	move $v0,$a0
	j SetChi
Set6:
	la $a0,Ky
	move $v0,$a0
	j SetChi
Set7:
	la $a0,Canh
	move $v0,$a0
	j SetChi
Set8:
	la $a0,Tan
	move $v0,$a0
	j SetChi
Set9:
	la $a0,Nham
	move $v0,$a0
	j SetChi
Set10:
	la $a0,Quy
	move $v0,$a0
	j SetChi
SetChi:
	addi $t1,$t1,8
	li $t2,12
	div $t1,$t2
	mfhi $t1
	
	li $t2,0
	beq $t2,$t1,Set_1
	
	li $t2,1
	beq $t2,$t1,Set_2
	
	li $t2,2
	beq $t2,$t1,Set_3
	
	li $t2,3
	beq $t2,$t1,Set_4
	
	li $t2,4
	beq $t2,$t1,Set_5
	
	li $t2,5
	beq $t2,$t1,Set_6
	
	li $t2,6
	beq $t2,$t1,Set_7
	
	li $t2,7
	beq $t2,$t1,Set_8
	
	li $t2,8
	beq $t2,$t1,Set_9
	
	li $t2,9
	beq $t2,$t1,Set_10
	
	li $t2,10
	beq $t2,$t1,Set_11
	
	li $t2,11
	beq $t2,$t1,Set_12
	
Set_1:
	la $a0,Ty
	move $v1,$a0
	j CanChi_exit
Set_2:
	la $a0,Suu
	move $v1,$a0
	j CanChi_exit
Set_3:
	la $a0,Dan
	move $v1,$a0
	j CanChi_exit
Set_4:
	la $a0,Meo
	move $v1,$a0
	j CanChi_exit
Set_5:
	la $a0,Thin
	move $v1,$a0
	j CanChi_exit
Set_6:
	la $a0,Ty
	move $v1,$a0
	j CanChi_exit
Set_7:
	la $a0,Ngo
	move $v1,$a0
	j CanChi_exit
Set_8:
	la $a0,Mao
	move $v1,$a0
	j CanChi_exit
Set_9:
	la $a0,Than
	move $v1,$a0
	j CanChi_exit
Set_10:
	la $a0,Dau
	move $v1,$a0
	j CanChi_exit
Set_11:
	la $a0,Tuat
	move $v1,$a0
	j CanChi_exit
Set_12:
	la $a0,Hoi
	move $v1,$a0
	j CanChi_exit
	
#Cuoi thu tuc:
CanChi_exit:
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $t0,8($sp)
	lw $t1,12($sp)
	lw $t2,16($sp)
	#Xoa stack
	addi $sp,$sp,20
	#Tra ve
	jr $ra
	
# ===================HAM SO 22===================
#Chuc nang: Doc chuoi trong file vao TIME1, TIME2
#Tham so:
#	$a0: TIME1
#	$a1: TIME2
# 	$a2: buffer
#Ket qua tra ve:
# 	$v0: TIME1
# 	$v1: TIME2

#Dau thu tuc:
read_file:
	#Khai bao stack
	addi $sp,$sp,-48
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $a0,4($sp)
	sw $a1,8($sp)
	sw $a2,12($sp)
	sw $t0,16($sp)
	sw $t1,20($sp)
	sw $t2,24($sp)
	sw $t3,28($sp)
	sw $s0,32($sp)
	sw $s1,36($sp)
	sw $s2,40($sp)
	sw $t7,44($sp)
#Than thu tuc:
	move $s0,$a0
	move $s1,$a1
	move $s2,$a2

	#Mo file
 	li $v0, 13 # system call for open file
	la $a0, fin # output file name
	li $a1, 0 # flags
 	syscall # open a file (file descriptor returned in $v0)
 	
 	move $t7, $v0 # save file descriptor in $t7
 	 
 	# Read to file just opened
	li $v0, 14 # system call for read to file
	la $a1, buffer # address of buffer from which to write
	li $a2, 22 # hardcoded buffer length
	move $a0, $t7 
	syscall # read to file
	
	move $t0,$s2
	move $t3,$s0
read_file_loop:

	li $t2,13 		# 13 = '/r'
	lb $t1,0($t0)
	beq $t1,$t2,read_file_time2

	lb $t1,0($t0)
	sb $t1,0($t3)
	addi $t0,$t0,1
	addi $t3,$t3,1
	j read_file_loop

read_file_time2:
	move $t0,$s2
	move $t3,$s1
	addi $t0,$t0,12
read_file_time2_loop:	
	li $t2,0
	lb $t1,0($t0)
	beq $t1,$t2,read_file_exit
	
	lb $t1,0($t0)
	sb $t1,0($t3)
	addi $t0,$t0,1
	addi $t3,$t3,1
	j read_file_time2_loop

read_file_exit:
#Cuoi thu tuc:
	#Dong File: 
	move $a0,$t7
	li $v0,16
	syscall
	
	move $v0,$s0
	move $v1,$s1
		
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $a0,4($sp)
	lw $a1,8($sp)
	lw $a2,12($sp)
	lw $t0,16($sp)
	lw $t1,20($sp)
	lw $t2,24($sp)
	lw $t3,28($sp)
	lw $s0,32($sp)
	lw $s1,36($sp)
	lw $s2,40($sp)
	lw $t7,44($sp)

	#Xoa stack
	addi $sp,$sp,48
	#Tra ve
	jr $ra

# ===================HAM SO 23===================
#Chuc nang: Chuyen doi chuoi "DD MM YYYY" thanh "DD/MM/YYYY"
#Tham so: 
# 	$a0: TIME
#Ket qua tra ve:
# 	$v0: address of TIME

#Dau thu tuc:
convert_space:
	#Khai bao stack
	addi $sp,$sp,-12
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $s0,8($sp)
	
#Than thu tuc:
	move $s0,$a0
	li $t0,47
	sb $t0,2($s0)
	sb $t0,5($s0)
	move $v0,$s0

#Cuoi thu tuc:
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $s0,8($sp)
	
	#Xoa stack
	addi $sp,$sp,12
	
	#Tra ve
	jr $ra
	
# ===================HAM SO 24===================
#Chuc nang: Ghi ket qua ra file output
#Tham so:
# 	$a0: TIME1
# 	$a1: TIME2
#Ket qua tra ve:
#	$v0: file descriptor

#Dau thu tuc:
write_file:
	#Khai bao stack
	addi $sp,$sp,-36
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	sw $t3,16($sp)
	sw $a2,20($sp)
	sw $t7,24($sp)
	sw $s0,28($sp)
	sw $s1,32($sp)
	
	
#Than thu tuc:
	move $s0,$a0
	move $s1,$a1
	
	# Open (for writing) a file that does not exist
	la $a0, fout # output file name
	li $a1, 1 # flagsf0
	li $v0, 13 # system call for open file
	syscall # open a file (file descriptor returned in $v0)
	move $t7, $v0 # save file descriptor in $t7
	
check_time1:
	move $a0,$s0
	jal check_syntax
	beq $v0,$0,write_non1
	
	move $a0,$s0
	jal check_valid
	beq $v0,$0,write_non1
check_time2:	
	move $a0,$s1
	jal check_syntax
	beq $v0,$0,write_non2
	  
	move $a0,$s1  
	jal check_valid
	beq $v0,$0,write_non2
	
	move $a0,$s0
	move $a1,$s1
	jal check_date_in_file
	beq $v0,$0,write_file_exit
write_result:	
	# Ghi ket qua cau 1
	li $v0, 15 # system call for write to file
	la $a1, Cau1 # address of buffer from which to write
	li $a2, 3 # hardcoded buffer length
	move $a0, $t7 # put the file descriptor in $a0
	syscall # write to file
	
	li $v0, 15 # system call for write to file
	move $a1, $s0 # address of buffer from which to write
	li $a2, 10 # hardcoded buffer length
	move $a0, $t7 # put the file descriptor in $a0
	syscall # write to file
	
	li $v0, 15 # system call for write to file
	la $a1, XuongDong # address of buffer from which to write
	li $a2, 1 # hardcoded buffer length
	move $a0, $t7 # put the file descriptor in $a0
	syscall # write to file
	
	# Ghi ket qua cau 2A
	li $v0, 15 
	la $a1, Cau2A 
	li $a2, 4 
	move $a0, $t7 
	syscall 
	
	la $a0,str_cpy
	move $a1,$s0
	jal strcpy
	move $t4,$v0 
	
	
	move $a0, $t4
	li $a1,65
	jal Convert
	move $t1, $v0
		
	li $v0, 15 
	move $a1, $t1
	li $a2, 11 
	move $a0, $t7
	syscall 
	
	li $v0, 15 
	la $a1, XuongDong 
	li $a2, 1 
	move $a0, $t7 
	syscall 

	# Ghi ket qua cau 2B
	li $v0, 15 
	la $a1, Cau2B 
	li $a2, 4 
	move $a0, $t7 
	syscall 
	
	la $a0,str_cpy
	move $a1,$s0
	jal strcpy
	move $t4,$v0 
	
	
	move $a0, $t4
	li $a1,66
	jal Convert
	move $t1, $v0
		
	li $v0, 15 
	move $a1, $t1
	li $a2, 20 
	move $a0, $t7
	syscall 
	
	li $v0, 15 
	la $a1, XuongDong 
	li $a2, 1 
	move $a0, $t7 
	syscall 
	
	# Ghi ket qua cau 2C
		li $v0, 15 
	la $a1, Cau2B 
	li $a2, 4 
	move $a0, $t7 
	syscall 
	
	la $a0,str_cpy
	move $a1,$s0
	jal strcpy
	move $t4,$v0 
	
	move $a0, $t4
	li $a1,67
	jal Convert
	move $t1, $v0
		
	li $v0, 15 
	move $a1, $t1
	li $a2, 20 
	move $a0, $t7
	syscall 
	
	li $v0, 15 
	la $a1, XuongDong 
	li $a2, 1 
	move $a0, $t7 
	syscall
	
	# Ghi ket qua cau 3
	li $v0, 15 
	la $a1, Cau3 
	li $a2, 3 
	move $a0, $t7 
	syscall
	
	#Lay nam va ghi vao file
	la $t2, year_temp
	move $t0, $s0
	addi $t0,$t0,6 
	

	lb $t1, 0($t0)
	sb $t1, 0($t2)
	lb $t1, 1($t0)
	sb $t1, 1($t2)
	lb $t1, 2($t0)
	sb $t1, 2($t2)
	lb $t1, 3($t0)
	sb $t1, 3($t2)
	
	li $v0, 15 
	move $a1, $t2
	li $a2, 5 
	move $a0, $t7 
	syscall 
	
	#Xet nam nhuan hay khong nhuan
	move $a0,$s0
	jal LeapYear
	beq $v0,$0,notleap
	j leap
leap:
	la $a1,msg_leap_year
	j write_c3	
notleap:
	la $a1,msg_not_leap_year
write_c3:
	li $v0, 15 
	li $a2, 13
	move $a0, $t7 
	syscall
	
	li $v0, 15 
	la $a1, XuongDong 
	li $a2, 1 
	move $a0, $t7 
	syscall 
	
	# Ghi ket qua cau 4
	li $v0, 15 
	la $a1, Cau4
	li $a2, 3 
	move $a0, $t7 
	syscall
	
	li $v0, 15
	move $a1, $s0
	li $a2, 11
	move $a0, $t7
	syscall
	
	move $a0, $s0
	jal define_day
	move $a1, $v0
	li $v0, 15
	li $a2, 9
	move $a0, $t7
	syscall
	
	li $v0, 15 
	la $a1, XuongDong 
	li $a2, 1 
	move $a0, $t7 
	syscall
	
	# Ghi ket qua cau 5
	li $v0, 15 
	la $a1, Cau5
	li $a2, 43 
	move $a0, $t7 
	syscall
	
	li $v0, 15
	move $a1, $s0
	li $a2, 11
	move $a0, $t7
	syscall
	
	li $v0, 15 
	la $a1, Cau5_mid
	li $a2, 3 
	move $a0, $t7 
	syscall
	
	la $a0, daydefault
	move $a1, $s0
	jal GetTime
	
	move $a0,$v0
	la $a1,str_temp1
	jal ItoA
	
	move $a0,$v0
	la $a1,revstring
	jal strrev

	move $a1,$v0 	#Chuoi dao nguoc
	move $a0,$a1
	jal count
	addi $v0,$v0,1
	move $a2,$v0	#So ki tu
	li $v0, 15 
	move $a0, $t7 
	syscall
	
	li $v0, 15 
	la $a1, Cau5_tail
	li $a2, 5 
	move $a0, $t7 
	syscall
	
	li $v0, 15 
	la $a1, XuongDong 
	li $a2, 1 
	move $a0, $t7 
	syscall
	
	# Ghi ket qua cau 6
	li $v0, 15 
	la $a1, Cau6
	li $a2, 3
	move $a0, $t7 
	syscall
	
	# Ghi nam
	la $t2, year_temp
	move $t0, $s0
	addi $t0,$t0,6 
	

	lb $t1, 0($t0)
	sb $t1, 0($t2)
	lb $t1, 1($t0)
	sb $t1, 1($t2)
	lb $t1, 2($t0)
	sb $t1, 2($t2)
	lb $t1, 3($t0)
	sb $t1, 3($t2)
	
	li $v0, 15 
	move $a1, $t2
	li $a2, 5 
	move $a0, $t7 
	syscall
	
	li $v0, 15 
	la $a1, Cau6_mid
	li $a2, 7
	move $a0, $t7 
	syscall
	
	move $a0,$s0
	jal CanChi
	move $a0,$v0
	jal count
	move $t1,$v0
	addi $t1,$t1,1
	
	li $v0, 15 
	move $a1, $a0
	move $a2, $t1
	move $a0, $t7 
	syscall
	
	move $a0,$v1
	jal count
	move $t1,$v0
	addi $t1,$t1,1
	
	li $v0, 15 
	move $a1, $v1
	move $a2, $t1
	move $a0, $t7 
	syscall
	
	li $v0, 15 
	la $a1, XuongDong 
	li $a2, 1 
	move $a0, $t7 
	syscall

	# Ghi ket qua cau 7
	li $v0, 15 
	la $a1, Cau7
	li $a2, 23
	move $a0, $t7 
	syscall
	
	li $v0, 15
	move $a1, $s0
	li $a2, 11
	move $a0, $t7
	syscall 
	
	li $v0, 15
	la $a1, Cau7_mid
	li $a2, 9
	move $a0, $t7
	syscall 
	
	li $v0, 15
	move $a1, $s1
	li $a2, 11
	move $a0, $t7
	syscall
	
	li $v0, 15
	la $a1, Cau5_mid
	li $a2, 3
	move $a0, $t7
	syscall
	
	move $a0, $s0
	move $a1, $s1
	jal GetTime
	
	move $a0,$v0
	la $a1,str_temp2
	jal ItoA
	
	move $a0,$v0
	la $a1,revstring1
	jal strrev

	move $a1,$v0 	#Chuoi dao nguoc
	move $a0,$a1
	jal count
	addi $v0,$v0,1
	move $a2,$v0	#So ki tu
	li $v0, 15 
	move $a0, $t7 
	syscall
	
	li $v0, 15 
	la $a1, Cau5_tail
	li $a2, 5 
	move $a0, $t7 
	syscall
	
	li $v0, 15 
	la $a1, XuongDong 
	li $a2, 1 
	move $a0, $t7 
	syscall
	
	# Ghi ket qua cau 8
	li $v0, 15 
	la $a1, Cau8
	li $a2, 25
	move $a0, $t7 
	syscall
	
	#Ghi nam
	la $t2, year_temp
	move $t0, $s0
	addi $t0,$t0,6 

	lb $t1, 0($t0)
	sb $t1, 0($t2)
	lb $t1, 1($t0)
	sb $t1, 1($t2)
	lb $t1, 2($t0)
	sb $t1, 2($t2)
	lb $t1, 3($t0)
	sb $t1, 3($t2)
	
	li $v0, 15 
	move $a1, $t2
	li $a2, 5 
	move $a0, $t7 
	syscall 
	
	li $v0, 15 
	la $a1, Cau8_mid
	li $a2, 8
	move $a0, $t7 
	syscall
	
	move $a0,$s0
	jal leap_year_closer

	move $a0,$v0
	la $a1,year_temp1
	jal ItoA
	

	move $a0,$v0
	la $a1,year_temp2
	jal strrev
	
	move $a1, $v0
	li $v0, 15 
	li $a2, 5 
	move $a0, $t7 
	syscall
	
	li $v0, 15 
	la $a1, Cau8_tail
	li $a2, 3
	move $a0, $t7 
	syscall
	
	move $a0,$v1
	la $a1,year_temp1
	jal ItoA
	

	move $a0,$v0
	la $a1,year_temp2
	jal strrev
	
	move $a1, $v0
	li $v0, 15 
	li $a2, 5 
	move $a0, $t7 
	syscall
	j write_file_exit
write_non1:	
	li $v0, 15 
	la $a1, msg_file_invalid1
	li $a2, 26
	move $a0, $t7 
	syscall	
	
	li $v0, 15 
	la $a1, XuongDong 
	li $a2, 1 
	move $a0, $t7 
	syscall
	j check_time2
write_non2:	
	li $v0, 15 
	la $a1, msg_file_invalid2
	li $a2, 26
	move $a0, $t7 
	syscall	
write_file_exit:
#Cuoi thu tuc:
	#Dong File: 
	li $v0, 16 # system call for close file
	move $a0, $t7 # Restore fd
	syscall # close file

	move $v0, $t7
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	lw $t3,16($sp)
	lw $a2,20($sp)
	lw $t7,24($sp)
	lw $s0,28($sp)
	lw $s1,32($sp)
	
	#Xoa stack
	addi $sp,$sp,36
	#Tra ve
	jr $ra
	
# ===================HAM SO 25===================
#Chuc nang: length(string)
#Tham so: 
# 	$a0: string
#Ket qua tra ve:
#	$v0: int

#Dau thu tuc:
count:
	#Khai bao stack:
	addi $sp,$sp,-16
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
#Than thu tuc:
	#khoi tao gia tri	
	move $t0,$a0
	li $t1, 0
count_loop:
	lb $t2,0($t0)
	beq $t2,$0,count_exit
	
	addi $t1,$t1,1
	addi $t0,$t0,1
	j count_loop
#Cuoi thu tuc:
count_exit:
	move $v0,$t1
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	#Xoa stack
	addi $sp,$sp,16
	#Tra ve
	jr $ra
	

# ===================HAM SO 26===================
#Chuc nang: int to string rev
#Tham so:
# 	$a0: int
# 	$a1: address save string
#Ket qua tra ve:
# 	$v0: address save string

#Dau thu tuc:
ItoA:
	#Khai bao stack
	addi $sp,$sp,-20
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $s0,12($sp)
	sw $s1,16($sp)
#Than thu tuc:
	move $s2,$a1
	#Xet TH so 0
	bnez $a0, ItoA.non_zero  
	li   $t0, '0'
	sb   $t0, 0($s2)
	sb   $zero, 1($s2)
	j ItoA.exit
ItoA.non_zero:
	addi $t0, $zero, 10     
	move $t1, $s2
	move $s0,$a0
ItoA.non_zero_loop:
	div  $s0, $t0       # $a0/10
	mflo $s0            # $s0 = quotient
	mfhi $s1            # s1 = remainder  
	addi $s1,$s1,48
	sb $s1,0($t1)
	addi $t1,$t1,1
	beq $s0,$0,ItoA.exit
	j ItoA.non_zero_loop

#Cuoi thu tuc:
ItoA.exit:
	move $v0,$a1
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $s0,12($sp)
	lw $s1,16($sp)
	#Xoa stack
	addi $sp,$sp,20
	#Tra ve:	
	jr $ra
	
# ===================HAM SO 27===================
#Chuc nang: Dao nguoc chuoi
#Tham so:
# 	$a0: address string
# 	$a1: address string result
#Ket qua tra ve:
# 	$v0: address string

#Dau thu tuc:
strrev:
	#Khai bao stack:
	addi $sp,$sp,-20
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	sw $t3,16($sp)
#Than thu tuc:
	jal count
	move $t0,$v0 #so ki tu
	move $t1,$a0
	move $t2,$a1
	add  $t2,$t2,$t0
	addi $t2,$t2,-1
strrev_loop:
	lb $t3,0($t1)
	beq $t3,$0,strrev_exit
	
	sb $t3,0($t2)
	addi $t1,$t1,1
	addi $t2,$t2,-1
	j strrev_loop
#Cuoi thu tuc:
strrev_exit:
	move $v0,$a1
	#Restore thanh ghi:
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	lw $t3,16($sp)
	#Xoa stack
	addi $sp,$sp,20
	#Tra ve	
	jr $ra
	
# ===================HAM SO 28===================
#Chuc nang: Kiem tra tinh hop le cua chuoi ngay thang nam ve cu phap
#Tham so:
# 	$a0: TIME
#Ket qua tra ve:
# 	$v0: 1 - hople, 0 - khonghople

#Dau thu tuc:
check_syntax:
	#Khai bao stack
	addi $sp,$sp,-20
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	sw $t3,16($sp)
	
#Than thu tuc:
	move $t0,$a0
	li $v0, 1
check_syntax_loop:	
	li $t3,47
	lb $t1, 0($t0)				
	beq $t1, $zero, check_syntax_exit
	beq $t1, $t3, check_syntax_cotinue
	
	slti $t2, $t1, 48			
	bne $t2, $zero, check_syntax_non
		
	slti $t2, $t1, 58			
	beq $t2, $zero, check_syntax_non
	addi $t0, $t0, 1	
	j check_syntax_loop
check_syntax_cotinue:		
	addi $t0, $t0, 1			
	j check_syntax_loop
check_syntax_non:
	li $v0,0
	
#Cuoi thu tuc:
check_syntax_exit:	
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $t1,8($sp)
	lw $t2,12($sp)
	lw $t3,16($sp)
	#Xoa stack
	addi $sp,$sp,20
	#Tra ve
	jr $ra
	
# ===================HAM SO 29===================
#Chuc nang: Kiem tra tinh hop le syntax và logic cua 1 chuoi date
#Tham so: 
# 	$a0: TIME1
# 	$a1: TIME2
#Ket qua tra ve:
# 	$v0: 1 - hople, 0 - khonghople

#Dau thu tuc:
check_date_in_file:
	#Khai bao stack
	addi $sp,$sp,-16
	#Backup thanh ghi
	sw $ra,0($sp)
	sw $t0,4($sp)
	sw $s0,8($sp)
	sw $s1,12($sp)
#Than thu tuc:
	move $s0,$a0
	move $s1,$a1
	li $t0,1

	jal check_syntax
	beq $v0,$0,check_date_in_file_non
	
	move $a0,$s0
	jal check_valid
	beq $v0,$0,check_date_in_file_non
	
	move $a0,$s1
	jal check_syntax
	beq $v0,$0,check_date_in_file_non
	
	move $a0,$s1
	jal check_valid
	beq $v0,$0,check_date_in_file_non

	j check_date_in_file_exit
check_date_in_file_non:
	li $t0,0

#Cuoi thu tuc:
check_date_in_file_exit:
	move $v0,$t0
	#Restore thanh ghi
	lw $ra,0($sp)
	lw $t0,4($sp)
	lw $s0,8($sp)
	lw $s1,12($sp)
	#Xoa stack
	addi $sp,$sp,16
	#Tra ve
	jr $ra
