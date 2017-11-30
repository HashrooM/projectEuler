(use srfi-1)

(define (fibonacci-below-x x lst)
  (let ((new-number (+ (car lst) (cadr lst))))
    (if (< x new-number)
	lst
	(fibonacci-below-x x (append (list new-number) lst)))))

(print (apply +
	      (filter even? ;; filter is in srfi-1
		      (reverse (fibonacci-below-x 4000000 '(1 1))))))
