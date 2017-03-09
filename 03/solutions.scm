;; Oppgave 2

(define (every-other items)
  (cond ((null? items) '())
        ((null? (cdr items)) items)
        (else (cons (car items)
                    (every-other (cdr (cdr items)))))))

;; Oppgave 3

(define (increase-by n items)
  (if (null? items)
      '()
      (cons (+ (car items) n)
            (increase-by n (cdr items)))))

;; Med map:

(define (increase-by n items)
  (map (lambda (x) (+ x n)) items))

;; Med make-increaser:

(define (make-increaser n)
  (lambda (x) (+ x n)))

(define (increase-by n items)
  (map (make-increaser n) items))