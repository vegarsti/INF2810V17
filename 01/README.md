## Time 1

Jeg ga noen formaninger/tips:

- Les boka
- Notér begreper som brukes i læretimen
- Test ut koden som blir gjort i forelesning -- sørg for at du forstår det

Jeg viste også kjapt hvordan DrRacket fungerer.

Deretter gjorde vi noen samarbeidsoppgaver [fra gruppelærer Håkon sitt opplegg](http://folk.uio.no/haakomol/inf2810/gruppetimer/1.html):

- 1
- 2 (ikke d)
- 3

Backup av oppgavene finnes også [her](oppgaver.md) (i dette repoet).

### Fasit

**1)** Ett aspekt er at det er programmering uten sideeffekter. En sideeffekt er at det er noe som endres; en funksjon har en sideeffekt hvis den endrer tilstand utenfor seg selv. Ren funksjonell kode vil alltid returnere det samme gitt de samme argumentene.

**2)**

- **a)** `(+ 3 (- 9 5)) => (+ 3 4) => 7`
- **b)** Scheme bruker en parentesbasert prefiksnotasjon. Det vil si at man for hver parentes har man en operator og evt. noen operander. Sammensatte uttrykk evalueres slik at operatoren anvendes på operandene til vi bare har  primitive datatyper igjen. De primitive er da tall, strenger (og karakterer) og booleans.
- **c)**

```scheme
(define foo 4)
(* (+ foo 3)
    (- (/ 25 5)
        2))
=> (* (+ 4 3) (- (/ 25 5) 2))
=> (* 7 (- (/ 25 5) 2))
=> (* 7 (- 5 2))
=> (* 7 3)
=> 21
```

**3)** Definere i Scheme

- **a)**

```scheme
(define double (lambda (x) (* x 2)))
(define (double x) (* x 2))
```
- **b**)

```scheme
(define avg (lambda x y) (/ (+ x y) 2))
(define (avg x y) (/ (+ x y) 2))
```


Helt til slutt tok vi [denne Kahooten](https://play.kahoot.it/#/?quizId=2276bf68-d24c-40c4-a9cc-94777bca3472), før vi jobbet med oblig.
