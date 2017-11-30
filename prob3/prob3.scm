(define (is-prime lis num)
  (cond ((null? lis) #t)
	((= 0 (modulo num (car lis))) #f)
	(else (is-prime (cdr lis) num))))

(define (add-prime-lis lis num)
  (if (is-prime lis num)
      (append (list num) lis)
      lis))

(define (divide-prime num prime)
  (if (integer? (/ num prime))
      (divide-prime (/ num prime) prime)
      num))

(define (prime-below-x x init-num init-lis)
  (let* ((prime-lis (add-prime-lis init-lis init-num))
	(x-new (divide-prime x (car prime-lis))))
    (if (= x-new 1)
	(car prime-lis)
	(prime-below-x x-new (+ init-num 1) prime-lis))))

;;600851475143
;;ans = 6857?
