(with-output-to-file "test.txt"
  (lambda ()
    (print "hello chicken IO port!!")))

(define (fileI)
  (define (loop)
    (let ((ch (read-char)))
      (if (eof-object? ch)
	  (print "")
	  (begin (display ch)
		 (loop)))))
  (with-input-from-file "test.txt" loop))

(define (fileI-number)
  (define (loop ite vec)
    (let ((num ite)
	  (ch (read-char))
	  (next-ch (peek-char)))
      (if (eof-object? next-ch)
	  (print "")
	  (begin (vector-set! vec (modulo num 3) ch)
		 (display vec)
		 (loop (+ num 1) vec)))))
  (let ((vec (make-vector 3 0)))
    (with-input-from-file "test_numbers.txt"
      (lambda ()
	(loop 0 vec)))))

