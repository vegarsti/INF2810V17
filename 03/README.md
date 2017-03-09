## Time 3

I forrige forelesning var det en del stoff. Vi tok litt repetisjon av dette.

### Par
Et par, eller en `cons`-celle, det er en datastruktur som er satt sammen av to ting, ved hjelp av `cons`. Vi tegner f. eks. lista `'(47 11)` sånn:

```
   +-------+-------+
   |       |       |
   |   o   |   o   |
   |   |   |   |   |
   +---+---+---+---+
       |       |    
       |       |    
       |       |    
       V       v    
 
       47      11   
```

Dette kaller vi et boks-og-peker-diagram.

I Scheme representerer vi disse med `(a . b)`

For å ta tak i det første elementet i et par så kan vi si `car`. For å få tak i det andre sier vi `cdr` (kudder)

Så har vi medfølgende predikat `pair?`

Og så har vi noe vi kommer til å bruke spesielt mye, og det er lister.

Definisjonen av en liste: Enten den tomme lista eller et par der det høyre elementet er en liste. Altså en rekursiv definisjon.

En liste representeres `'(a b c)`, egentlig `(a . b . c . ())`.

Lista `'(47 11)`:

```
   +-------+-------+        +-------+-------+ 
   |       |       |        |       |    /  | 
   |   o   |   o---+------> |   o   |   /   |
   |   |   |       |        |   |   |  /    | 
   +---+---+-------+        +---+---+-------+ 
       |                        |
       |                        |
       |                        |
       V                        V
 
       47                   11
```

### Oppgaver om par og lister og sånn
Hva returneres fra følgende uttrykk?

- `(car '(1 2 3))`
- `(cdr '(1 2 3))`
- `(car (cdr '(1 2 3)))`
- `(cdr (cdr (cdr '(1 2 3))))`
- `(car '((1 2) 2 3 4)`

Tegn boks-og-peker-diagram for disse:

- `'(1 2 3)`
- `'((1 2) 2 3 4)`

Spørsmål

-   Hva er definisjonen av en liste?
-   Hva er en høyereordens prosedyre?


### Mer stoff

**Anonym prosedyre:** En lambda; et prosedyreobjekt.
Hvis vi ikke gir det et navn kaller vi det en anonym prosedyre.

[Oppgaver fra gruppelærer Håkon](http://folk.uio.no/haakomol/inf2810/gruppetimer/3.html)

- Oppgave 2: Lag prosedyren `every-other` som tar en liste `items` og returnerer en liste med annenhvert element fra denne lista.
- Oppgave 3: Lag prosedyren `increase-by` som tar en liste `items` og et tall `n` og returnerer en liste hvor hvert element er det samme pluss `n`.

Bruk `list-copy` som et utgangspunkt.

```scheme
(define (list-copy items)
  (if (null? items)
      ‘()
      (cons (car items)
            (list-copy (cdr items)))))
```


[Løsninger.](solutions.scm)
