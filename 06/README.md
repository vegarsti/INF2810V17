## Time 6

### Oblig 2a -- info og prekode

Nå er oblig 2a ute. Info

- Foretrekker at dere jobber i grupper på to eller tre! Større læringsutbytte, og det er gøy!
- Hvordan lage gruppe i Devilry?
    - **Gå inn på obligen > Project Group > Invite Students**
- OK å jobbe alene
- OK å bytte grupper (f. eks fra gruppe til aleine) mellom oblig 2 og 3, men ikke mellom 2a og 2b.

Vi så på prekoden til oblig 2a (`huffman.scm`).

Her definerer vi en abstraksjonsbarriere (et lag som skjuler implementasjonen) som gjør at vi ikke trenger å tenke på trær som lister av lister, men som trær. Denne forventes at dere bruker for alt det er verdt i obligen. (Ikke gjør noe manuelt dersom det finnes en prosedyre for det i prekoden..!)

Hvordan laste prekoden i en annen fil?

```scheme
(load “huffman.scm”)
```

Lag et tre ut av to løvnoder:

```scheme
(define leaf1 (make-leaf 'a 10))
(define leaf2 (make-leaf 'b 20))
(make-code-tree leaf1 leaf2)
```

Vi ser nå at vi får et tre der vi som første element - `car` - har venstre undertre (subtree), og som `cadr` har vi høyre undertre, og de to neste er så 1) en liste over symbolene (ord, bokstaver) som brukes i treet, og det siste elementet er den totale vekten i treet.
For å få tak i venstre undertre - venstre grein - kan vi si
`(left-branch tree)`
Det er tilsvarende for de andre elementene:

```scheme
(right-branch tree)
(symbols tree)
(weight tree)
```

Vi har også et predikat `leaf?` som sjekker om et tre er en løvnode. Dette er jo da typisk grunntilfellet i rekursjonen. Også på en løvnode kan vi hente ut symbolene og vekten med de tilhørende _aksessorene_ vi så over.

Vi har også prosedyren `decode`, som dekoder en Huffman-kode, gitt koden og det tilsvarende treet:

```scheme
(decode sample-code sample-tree)
```

`make-leaf-set` lager et, vel, "leaf-set" (en mengde av løvnoder) av en liste med par av symboler og vekter.

```scheme
(make-leaf-set '((a 1) (b 2) (c 3)))
```

Håper det hjelper dere å komme litt i gang!


### Variadiske prosedyrer (prikknotasjon)

Nå tenkte jeg å plukke opp en greie om hvordan definere prosedyrer med variabel lengde argumenter: Variadiske prosedyrer

Fra forelesning:

```scheme
(define (sum . args)
  (define (recurse list)
    (if (null? list)
        0
        (+ (car list)
           (recurse (cdr list)))))
  (recurse args))

(sum 1 2 3 4 5 6) ; gir 21
```

Parametrene etter prikken er valgfrie, og samles i listen `args`.

Med `lambda`: (Merk ingen parentes rundt parametrene.)

```scheme
(define sum2
  (lambda args
    (define (recurse list)
      (if (null? list)
          0
          (+ (car list)
             (recurse (cdr list)))))
    (recurse args)))
```

Hvis vi skal ha flere må vi her si `(x . args)`, mens i den uten `lambda` må vi si `(sum x . args)`

En annen kul ting: Den innebygde prosedyren `list` har en utrolig kul og lett implementasjon som benytter seg av dette:

```scheme
(define my-list
  (lambda x x))
```

####Oppgave####
Prøv å lag en funksjon `my-max`, som er en implementasjon av den innebygde `max`, som er en variadisk prosedyre! Da kan det også være verdt å se på den innebygde `max`, og om den for eksempel takler null argumenter. +, for eksempel, takler null argumenter: Det blir 0!

###[Løsning](max.scm)
