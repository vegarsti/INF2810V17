;; Hjelpeprosedyrer

(define (take l n)
  "Returns the first N elements of a given list L."
  (if (zero? n)
      '()
      (cons (car l) (take (cdr l) (- n 1)))))

(define (drop l n)
  "Returns the list with the N first elements removed."
  (if (zero? n)
      l
      (drop (cdr l) (- n 1))))


;; Grensesnitt

(define (top r)
  (r 'top))

(define (left-rotate! r)
  (r 'left-rotate!))

(define (right-rotate! r)
  (r 'right-rotate!))

(define (insert! r e)
  (r 'insert! e))

(define (delete! r)
  (r 'delete!))


;; Hovedprosedyre

(define (make-ring lst)
  (let* ((ring (append lst '()))
         (len (length lst))
         (tail (drop ring (- len 1))))
    (set-cdr! tail ring)
    (lambda (msg . e)
      (case msg
        ((left-rotate!)  (set! tail ring)
                         (set! ring (cdr ring)))
        ((right-rotate!) (set! ring tail)
                         (set! tail (drop ring (- len 1))))
        ((insert!) (set! ring (cons (car e) ring))
                   (set-cdr! tail ring)
                   (set! len (+ len 1)))
        ((delete!) (set! ring (cdr ring))
                   (set-cdr! tail ring)
                   (set! len (- len 1))))
      (car ring))))
