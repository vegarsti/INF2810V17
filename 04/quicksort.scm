;; Filter -- "hjelpefunksjon"
(define (filter pred lst)
  (cond ((null? lst) '())
        ((pred (car lst))
         (filter pred (cdr lst)))
        (else
         (cons (car lst) (filter pred (cdr lst))))))

;; Bruk:
(filter negative? '(-2 -1 0 1 2)) ; => (0 1 2)


;; Lager hjelpeprosedyrer
(define (less-than-or-equal x)
  (lambda (y)
    (if (<= x y)
        #t
        #f)))

((less-than-or-equal 2) 1)

(define (greater-than x)
  (lambda (y)
    (if (> x y)
        #t
        #f)))

(define (quicksort lst)
  (if (null? lst)
      lst
      (let ((pivot (car lst)) (rest (cdr lst))) ; mer leselig
        (append
          (quicksort (filter (less-than-or-equal pivot) rest))
          (list pivot)
          (quicksort (filter (greater-than pivot) rest))))))

(quicksort '(3 9 3 2 97 0 72 6 8 52 3))
; => (0 2 3 3 3 6 8 9 52 72 97)