## Time 7

Nå har vi lært `set!`. Dette er en destruktiv operasjon, fra et funksjonelt perspektiv: Vi endrer tilstanden til et objekt, og dermed “destruerer” vi det, siden det ikke lenger representerer samme verdi.

Til nå: Variabler har vært navn på verdier.
Nå: Variabler er steder man kan _lagre_ verdi.

Så nå kan vi få tilstand!

`set!` er en special form som lar oss modifisere variabelbindinger.

Det er konvensjon å bruke `!` i navnet til en destuktiv prosedyre; akkurat som `?` for predikater

`set!` endrer hvilken verdi symbolet er bundet til: selve verdien i seg selv endres ikke


Vise noen enkle eksempler i DrRacket.

```scheme
(define x 2)
(set! x 42)
x ;; => 42
```

```scheme
(define y (list x 1))
y
(set! x 100)
y
```

Her er `y` fortsatt lik! Men det er fordi verdien i seg selv endres ikke! Idet jeg sa at `y` var lista med `x` og `1`, så evaluerte Scheme "okay, hva er `x`? jo, det er `42` -- så da putter jeg det inn i lista"

Et eksempel som viser forskjellen mellom `set!` og `define`:

```scheme
(define x 2)

(define (foo)
  (define x 4)
  x)

(define (bar)
  (set! x 4)
  x)

x      ; 2

(foo)  ; 4
x      ; 2

(bar)  ; 4
x      ; 4
```

Det som skjer her er at i `foo` så binder vi en variabel `x` til verdien 4, men kun _i skopet til `foo`_. Altså er ikke `x` endret utenfor skopet. Men det skjer derimot i `bar`: Den finner skopet til `x`, som er globalt, og endrer bindingen til `x` fra 2 til 4. Dermed er `x` også endret globalt.

## Opplegg: Bankkontoobjekter
La oss se på et eksempel med bankkonto. Det er det samme eksemplet som vi så på i forelesning

```scheme
(define balance 100)

(define withdraw
  (lambda (amount)
    (if (>= balance amount)
        (begin
          (set! balance (- balance amount))
          balance) ; skriver ut saldo
        "Insufficient funds!")))
```

Hvorfor `begin`? (Jo, fordi if tillater kun ett uttrykk som konsekvens.)

I bruk:

```scheme
(withdraw 25) ; => 75
(withdraw 25) ; => 50
(withdraw 60) ; => Insufficient!

(withdraw 15) ; => 35
balance       ; => 35
```

Vi ser at vi bruker de samme argumentene, men får forskjellig verdi. Altså ikke ren funksjonell kode lenger.

Svakhet: `balance` er eksponert; kan endres av kode utenfor withdraw, f. eks. ved `(set! balance 1000)`

Først en liten forbedring:

```scheme
(define withdraw
  (lambda (amount)
    (cond ((>= balance amount)
           (set! balance (- balance amount))
           balance) ; skriver ut saldo
          (else "Insufficient funds!"))))
```

`cond` gjør det lettere, vi slipper `begin`

```scheme
(withdraw 100) ; => 900
```

Men vi kan innkapsle saldo sånn at vi ikke har tilgang på den utenfor, ved hjelp av let.

```scheme
(define withdraw2
  (let ((balance 100))
    (lambda (amount)
      (cond ((>= balance amount)
             (set! balance (- balance amount))
             balance)
            (else "Insufficient funds")))))
```
Vi innkapsler `balance` i `withdraw` med `let`: `let` etablerer en ny omgivelse med `balance` som lokal variabel

Det er kjipt med bare en bankkonto, så vi kan også lage en prosedyre som lager kontoobjekter:

```scheme
(define make-withdraw
  (lambda (balance)
    (lambda (amount)
      (cond ((>= balance amount)
             (set! balance (- balance amount))
             balance)
            (else "Insufficient funds!")))))
```

Nå kan vi gjøre

```scheme
(define mamma (make-withdraw 1000))
(define sønn (make-withdraw 100))
```


##Oppgaver

### `make-accumulator` (3.1 i SICP)
Lag en prosedyre `make-accumulator` som tar en startsum og skal deretter kunne kalles med navn og sum for å øke summen. Eksempel:

```scheme
(define acc (make-accumulator 100))
(acc 100) ; 200
(acc 10)  ; 210
```

[Løsning her!](make-accumulator.scm)

### Utfordring
Løs `member?` i obligen med høyereordens prosedyrer Hint: Den kan løses med et kall til enten `reduce`, `map` eller `filter`.

Ukesoppgaver i tillegg (fra uke 10 [her](http://folk.uio.no/esbenss/inf2810/gruppelaererenes-side.html)):

- 3.2
- 3.3
- 3.4
