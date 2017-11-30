(use srfi-1)

(define (is-prime lis num)
  (cond ((null? lis) #t)
	((= 0 (modulo num (car lis))) #f)
	(else (is-prime (cdr lis) num))))

(define (add-prime-lis lis num)
  (if (is-prime lis num)
      (append (list num) lis)
      lis))

(define (main)
  (define (find-primes init-num init-lis)
    (let ((prime-lis (add-prime-lis init-lis init-num)))
      (if (= (length prime-lis) 10001)
	  (print (car prime-lis))
	  (find-primes (+ 1 init-num) prime-lis))))
  (find-primes 2 '()))

(main)

;; 104743
;; takes too much time...
;; compile -> 30s. O.K.!! ...?
