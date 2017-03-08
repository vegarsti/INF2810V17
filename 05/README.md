## Time 5

Nå har vi lært `let`. Det er syntaktisk sukker for et lambda-uttrykk. Når det evalueres, så gjøres `let` om til `lambda`. Det vi gjorde i denne timen var å gjøre om fra `let` til `lambda` og motsatt.

**Syntaktisk sukker**: Syntaks som er ment for å gjøre det lettere å lese og uttrykke ting. Egentlig er det bare “snarveier” for vanlig kode i språket.

`let`

- Rekkevidden til variablene er kroppen til `let`-uttrykket
- Verdiene beregnes ‘utenfor’ `let`-uttrykket
- Variablene har ikke tilgang til hverandre under bindingen

`let*`

- mens `let` binder parallelt, binder `let*` sekvensielt
- kortform for flere lets inni hverandre

###Fra `let*` til `let` til `lambda`
Vi starter med
```scheme
(let* ((x 1)
       (y 2)
       (z 3))
  (+ x y z))
```
som vi kan skrive om til

```scheme
(let ((x 1))
  (let ((y 2))
    (let ((z 3))
      (+ x y z))))
```

som igjen blir

```scheme
((lambda (x)
   ((lambda (y)
      ((lambda (z)
         (+ x y z))
       3))
    2))
 1)
```

###Trær

- Et tre er en type graf: Noder forbundet med kanter
- Den øverste noden kalles rot
- Løvnoder har ikke barn
- En rekursivt definert struktur
- Kantene kan ikke være sykliske (at man kan gå i “ring”)
- Lister av lister, basically, i Scheme

Tre tilfeller vi må tenke på ved rekursjon over trær:

- tom liste
- en cons-celle (et tre)
- løvnode

Så hvordan ser et tre ut?
En eller annen "nested list".

```scheme
(define some-tree
  '((1 (2 3) 3 4)))
```

```scheme
(define (sum-tree tree)
   (cond ((null? tree) 0)
         ((number? tree) tree) ; løvnode
         (else (+
                (sum-tree (car tree))
                (sum-tree (cdr tree))))))

(sum-tree some-tree) ; 13
```


###Ukesoppgaver som anbefales
- 2.28 — `fringe`: lag en flat liste av et tre (i “riktig rekkefølge”) (ble gjort i forelesning, men prøv først selv)
- 2.30 — `square-tree`
- 2.31 — `square-tree` (`tree-map`; kan bruke `map` her!) (ditto med denne; ble også gjort i forelesning)
- 2.27 — `deep-reverse` (!)

[Vi gjorde denne Kahooten av gruppelærer Matias til slutt.](https://play.kahoot.it/#/k/d57ecf81-e7bd-4e63-9e99-a44f17a5025b)

