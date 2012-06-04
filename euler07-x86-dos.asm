; nth prime to be found, n < 2^16
%define n 10001

; how many numbers have to be tested approximately, limit < 2^32
; manually calculated from: x/ln(x)*(1+1/ln(x)) = n
; see https://en.wikipedia.org/wiki/Prime_number_theorem#Bounds_on_the_prime-counting_function
%define limit 106571

org 100h

	call main

	; the result stands in eax at this point
	; shift to see high part of eax in debug.com
	shr eax, 16

	ret

main:

	mov esi, sieve

	; current number to be tested if prime or not
	mov eax, 2 ; low

	; how many primes have we found
	mov cx, 0
	push cx


mainloop:
	
	; sieve of eratosthenes
	call readbit

	; if it's not a prime, go on
	jc continue

	; otherwise set all multiples of this number
	mov edi, eax

setloop:

	add eax, edi

	call setbit

	cmp eax, limit
	jb setloop

	mov eax, edi

	pop cx
	inc cx

	; have we found the nth prime ?
	cmp cx, n

	; yes, return
	jz done

	push cx

continue:
	; next number to test
	inc eax

	jmp mainloop


done:
	ret


readbit:
	; read bit # eax from offset esi
	; return bit set in carry flag
	; destroys ebx, cx, dx

	; which byte
	mov ebx, eax
	shr ebx, 3

	mov bl, [ebx + esi]

	; which bit in a byte
	mov cl, al
	and cl, 7

	; by shifting one more, the bit is automatically written to cf
	inc cl
	shr bl, cl

	ret

setbit:
	; set bit # eax from offset esi to 1
	; destroys ebx, cx, dx

	; which byte
	mov ebx, eax
	shr ebx, 3

	; create bitmask
	mov cl, al
	and cl, 7
	mov dl, 1
	shl dl, cl
	
	; set bit
	or [ebx + esi], dl

	ret

sieve:
	times limit / 8 db 0


