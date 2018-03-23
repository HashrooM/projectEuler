(use srfi-1)

(define maxn 2000000)
(define lis-under-maxn (list->vector (iota (+ 1 maxn) 0)))

(define (sieve vec num)
  (do ((n (* 2 num) (+ n num)))
      ((> n maxn))
    (when (not (= 0 (vector-ref vec n)))
      (vector-set! vec n 0))))

(define (main)
  (do ((n 2 (+ 1 n)))
      ((> n (round (sqrt maxn))))
    (sieve lis-under-maxn n))
  (let ((prime-lis (filter (lambda (x) (not (zero? x)))
			   (vector->list lis-under-maxn))))
    (- (fold + 0 prime-lis) 1)))
