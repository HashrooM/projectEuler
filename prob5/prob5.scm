(define prime-product (* 2 3 5 7 11 13 17 19))

(define divisor (iota 20 1))

(define (is-multiple num lis)
  (cond ((null? lis) #t)
	((= 0 (modulo num (car lis))) (is-multiple num (cdr lis)))
	(else #f)))

(define (main)
  (define (loop x lis)
    (if (is-multiple x lis)
	(print x)
	(loop (+ x prime-product) lis)))
  (loop (* 20 prime-product) divisor))

;;232792560
