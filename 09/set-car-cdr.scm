;; 1
(define x (list 1 2))
x ; (1 2)

;; 2
(set-cdr! x (list 3 4))
x ; (1 3 4)

;; 3
(define y (list "hei" "dere"))
y ; ("hei" "dere")

;; 4
(set-cdr! (cdr y)
          x)
y ; ("hei" "dere" 1 3 4)

;; 5
(set-cdr! x '())
x ; (1)
;; Hva er nå y?


;; 6
y ; ("hei" "dere" 1)