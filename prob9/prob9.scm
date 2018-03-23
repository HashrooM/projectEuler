(define n 1000)
(define a-first 1)
(define a-final 497)
(define b-first 2)
(define b-final 498)

;;from my calculation on a paper
(define (is-answer x y)
  (= (+ (* n n) (* 2 x y)) (* (* 2 n) (+ x y))))

;; test function for search-loop
(define (is-test x y)
  (= 5 (+ x y)))

(define (search-loop a b)
  (call/cc
   (lambda (break)
     (do ((x a-first (+ x 1)))
	 ((= x a-final))
       (do ((y b-first (+ y 1)))
	   ((= y b-final))
	 (when (is-answer x y)
	   (break (list x y)))))
     (print "no answer"))))

(define (main)
  (let* ((a (car (search-loop a-first b-first)))
	 (b (cadr (search-loop a-first b-first)))
	 (c (- 1000 a b)))
    (print (* a b c))))

;;>(main)
;;>31875000
