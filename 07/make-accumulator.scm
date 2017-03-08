(define make-accumulator
  (lambda (sum)
    (lambda (increment)
      (set! sum (+ sum increment))
      sum)))