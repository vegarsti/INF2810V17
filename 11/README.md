## Time 11

Vi snakka om forskjellige evalueringsformer og om strømmer. Mye repetisjon av [forelesningen](foils.pdf).

Med strømoperasjoner får vi elegansen ved høyereordens sekvensoperasjoner, minus den potensielle sløsingen av beregning!

Strømmer er late lister. For å få "lathet" (_laziness_) må vi endre hvordan ting evalueres i Scheme. Først en liten repetisjon av forskjellige former for evaluering.

### Applicative order vs normal order

#### Applicative order

- Evaluerer argumentene, altså vi kaller prosedyren med verdiene
- Standard i Scheme!
- Også kjent som call-by-value, strict/eager evaluation
- Kan tenke på det som at vi starter "innerst" når vi evaluerer

#### Normal order

- Prosedyren kalles med argumentuttrykkene: Disse evalueres først ved behov
- Også kjent som call-by-name, call-by-need, non-strict/lazy evaluation
- Kan tenke på at vi starter "ytterst" når vi evaluerer

#### Eksempel

```scheme
(define (f x y)
  (+ (* x x) (* y y)))
```
Vi kaller på

```scheme
(f (f 1 2) (f 2 3))
```

##### Applicative order

```scheme
=> (f (+ (* 1 1) (* 2 2)) (+ (* 2 2) (* 3 3))
=> (f (+ 1 4) (+ 4 9))
=> (f 5 13)
=> (+ (* 5 5) (* 13 13))
=> (+ 25 169)
=> 194
```
##### Normal order

```scheme
=> (+ (* (f 1 2) (f 1 2)) (* (f 2 3) (f 2 3)))
=> (+ (* (+ (* 1 1) (* 2 2)) (+ (* 1 1) (* 2 2)))
      (* (+ (* 2 2) (* 3 3)) (+ (* 2 2) (* 3 3))

osv
```

Vi ser at med **normal order** kan vi ende opp med å måtte evaluere ting flere ganger. Så vi kan se nytten av å memoisere her.

Merk at disse evalueringsformene gir samme resultat så lenge vi holder oss til ren funksjonell kode, men kan gi forskjell i effektivitet.


### `delay` og `force`
Den innebygde prosedyren `delay` gir oss kontroll til å velge selv når uttrykk evalueres. Den brukes i `cons-stream`.

`force` er “motsetningen” til delay: Vi bruker det på et promise (et uttrykk vi har kalt `delay` på) for å tvinge evaluering av dette.

Vi kan tenke på disse som at de er evaluert slik:

```scheme
(define (delay exp)
    (lambda ()
        exp))
(define (force promise)
    (promise))
```

I [forelesningen](foils.pdf) ble et grensesnitt for strømmer definert. Vi definerer `car`, `cdr` og `cons` for strømmer:

```scheme
(define (cons-stream a b)
  (cons a (delay b)))

(define (stream-car stream)
  (car stream))

(define (stream-cdr stream)
  (force (cdr stream)))
```

Merk her at `cons-stream` ikke egentlig kan definerer slik! Vi kan tenke på det som at det er slik, men vi må gjøre `cons-stream` til en special form, slik: (Ikke tenk så nøye på hvordan denne er implementert, det er utenfor skopet av faget vårt.)

```scheme
(define-syntax
  cons-stream
  (syntax-rules ()
    ((cons-stream head tail) (cons head (delay tail)))))
```

Nå kan vi gjøre

```scheme
(stream-cdr (cons-stream 1 (cons-stream 2 3)))
=> ; (2 . #promise)
```


Vi definerer `stream-ref`, som gir oss det n'te elementet i strømmen `s`:

```scheme
(define (stream-ref s n)
  (if (zero? n)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))
```

I forelesningen ble også `stream-interval` definert: `(stream-interval low upper)` gir en strøm med tallene fra `low` til `upper`.

Vi går gjennom et kall med `(stream-interval 1 10)`, for å se litt nøyere på hvordan `stream-cdr` fungerer:

```scheme
   (stream-interval 1 10)
=> (cons-stream 1 (stream-interval 2 10))
=> (cons 1 (delay (stream-interval 2 10)))
=> (1 . (delay (stream-interval 2 10))
```

Vi tar `stream-cdr` av dette:

```scheme
   (stream-cdr (1 . (delay (stream-interval 2 10))))
=> (force (cdr (1 . (delay (stream-interval 2 10))))
=> ((lambda () (stream-interval 2 10)))
=> (stream-interval 2 10)
=> (cons-stream 2 (stream-interval 3 10))
=> ... ; som tidligere
=> (2 . (delay (stream-interval 3 10)))
```

Nå kan vi også definere uendelige strømmer (!):

```scheme
(define (integers-from n)
    (cons-stream n (integers-from (+ n 1))))

(define nats
  (integers-starting-from 0))

nats                   ; (1 . #promise)
(stream-ref nats 1000) ; 1000
```