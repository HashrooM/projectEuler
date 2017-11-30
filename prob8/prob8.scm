(use numbers)

(define *max* 0)
(define (fileI-number file-name)
  (define (loop ite vec)
    (let ((num ite)
	  (ch (string->number (string (read-char))))
	  (next-ch (peek-char)))
      (if (eof-object? next-ch)
	  (print "")
	  (begin (vector-set! vec (modulo num 13) ch)
		 (is-max vec)
		 (loop (+ num 1) vec)))))
  (let ((vec (make-vector 13 0)))
    (with-input-from-file file-name 
      (lambda ()
	(loop 0 vec))))
  (print *max*))


(define (is-max vec)
  (let ((num (apply * (vector->list vec))))
    (if (> num *max*)
	(set! *max* num)
	(set! *max* *max*))))

(fileI-number "number.txt")

;;23514624000
