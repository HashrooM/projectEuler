(use srfi-1)

(define num1 999)
(define num2 999)

(define (same-charcter? index1 index2 vec)
  (eq? (vector-ref vec index1) (vector-ref vec index2))

(define (is-palindrome num)
  (let* ((list-from-num
	  (list->vector (string->list (number->string num))))
	 (vec-len (vector-length list-from-num)))
    
