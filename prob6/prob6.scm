(define (sum-of-list lis)
  (apply + lis))

(define (square-list lis)
  (map (lambda (x) (* x x)) lis))

(define (main)
  (let* ((lis (iota 100 1))
	 (x (sum-of-list lis))
	 (y (sum-of-list (square-list lis))))
    (- (* x x) y)))
;;25164150
