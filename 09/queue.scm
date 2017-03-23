(define (make-queue)
  (cons '() '()))

(define (queue-empty? queue)
  (null? (car queue)))

(define (queue-insert! object queue)
  (let ((new (cons object '())))
    (if (queue-empty? queue)
        (set-car! queue new)
        (set-cdr! (cdr queue) new))
    (set-cdr! queue new)))

(define (queue-delete! queue)
  (if (queue-empty? queue)
      "Error: Empty queue."
      (let ((object (caar queue)))
        (set-car! queue (cdar queue))
        object)))

(define q1 (make-queue))

(queue-insert! "Vegard" q1)

(define (front queue)
  (caar queue))

(define (rear queue)
  (cadr queue))

(front q1)

(define (print-queue queue)
  (car queue))

(define (queue-length queue)
  (length (print-queue queue)))

(print-queue q1)

(queue-insert! "Erik" q1)
(queue-insert! "Stephan" q1)
(queue-insert! "Håkon" q1)
(queue-insert! "Benedikte" q1)

(print-queue q1)
(front q1)
(rear q1)
(queue-length q1)


(define (make-queue2 . queue)
  (if (null? queue)
      (make-queue)
      (cons (car queue)
            (list (caar queue)))))

(define q2 (make-queue2))
(define q3 (make-queue2 '("Vegard" "Erik")))