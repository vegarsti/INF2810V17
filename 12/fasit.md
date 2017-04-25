## Fasit på oppgave 2 fra 2015-eksamen - `replace`

### **b):** Vanlig rekursiv `replace`:

```scheme
(define (replace x y seq)
  (cond ((null? seq) '())
        ((eq? (car seq) x)
         (cons y
               (replace x y (cdr seq))))
        (else
         (cons (car seq)
               (replace x y (cdr seq))))))
```


### **e):** Skrive om til strømversjon:

```scheme
(define (stream-replace x y stream)
  (cond ((stream-null? stream) '())
        ((eq? (stream-car stream) x)
         (cons-stream y
                      (stream-replace x y (stream-cdr stream))))
        (else
         (cons (stream-car stream)
               (stream-replace x y (stream-cdr stream))))))
```
Lite endringer, altså.

### **d):** Destruktiv `replace!`

```scheme
(define (replace! x y seq)
  (define (iter in)
    (cond ((null? in) seq)
          ((eq? (car in) x)
           (set-car! in y)
           (iter (cdr in)))
          (else
           (iter (cdr in)))))
  (iter seq))
```

### **f):** Antall `cons`-operasjoner ved evaluering av kode

```scheme
(define foo '(a b b a))
(replace 'a 'c foo)
```

- **b)**: Like mange som antall elementer i lista, altså 4. (Sjekk selv!)
- **e)**: Husk at `(cons-stream x y)` innebærer at vi `delay`'er `y`, altså det evalueres ikke. Dermed vil selve kallet på `replace` her kun innebære ett kall på `cons`.
- **d)**: Ingen! Siden vi endrer på lista destruktivt.
