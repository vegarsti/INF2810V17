(define my-max
  (lambda (x . args)
    (define (recurse list max-so-far)
      (cond ((null? list) max-so-far)
            ((> (car list) max-so-far)
             (recurse (cdr list) (car list)))
            (else ; max-so-far biggest
             (recurse (cdr list) max-so-far))))
    (recurse args x)))

;; alternativ, ved hjelp av reduce:
;; Takk til Espen!

(define (my-max2 x . args)
  (reduce x (lambda (x y)
              (if (< x y) ; x < y
                  y
                  x))
          args))

;; "Hjelpeprosedyre"
(define (reduce init proc lst)
  (if (null? lst)
      init
      (proc (car lst)
            (reduce init proc (cdr lst)))))