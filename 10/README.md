## Time 10

Vi så på tabellgrensesnittet fra oblig 2b, og den innebygde prosedyren `apply`.

### Enkelt eksempel med tabell

```scheme
(load "prekode2b.scm")
(define fag (make-table))
fag
(insert! 'INF2810 "Funksjonell programmering" fag)
fag
(lookup 'inf2810 fag)
(insert! 'INF1080 "Logiske metoder for informatikk" fag)
(insert! 'INF1000 "Introduksjon til objektorientert programmering" fag)
(insert! 'INF1010 "Objektorientert programmering" fag)
```

### Memoisering av `square`

```scheme
(define (square x) (* x x))
```

Vi lager en global tabell der vi lagrer par av nøkler og verdier der argumentet til `square` er nøkkelen og resultatet er verdien.

```scheme
(define arg-table (make-table))
(define mem-square
  (lambda (x)
    (let ((record (lookup x arg-table)))
      (if record
          record
          (let ((result (* x x)))
            (insert! x result arg-table)
            (display "calculating... ")
            (newline)
            result)))))
```

Vi kan nå kjøre:

```scheme
(mem-square 2)
> calculating... 2
> 4
(mem-square 2)
> 4
```

Vi kan forenkle koden litt ved å bruke `or`:

```scheme
(define mem-square
  (lambda (x)
    (or (lookup x arg-table)
        (let ((result (* x x)))
          (insert! x result arg-table)
          (display "calculating... ")
          (display x)
          (newline)
          result))))
```

Men det er bedre å innkapsle tabellen i prosedyren:

```scheme
(define mem-square
  (let ((arg-table (make-table)))
    (lambda (x)
      (or (lookup x arg-table)
          (let ((result (* x x)))
            (insert! x result arg-table)
            (display "calculating... ")
            (display x)
            (newline)
            result)))))
```

Dette kan være et godt utgangspunkt eller inspirasjon som dere kan generalisere for å bruke i obligen.

### `apply`
Det er en nyttig innebygd prosedyre jeg vil vise dere. (Jeg tror ikke jeg lærte den da jeg tok kurset, faktisk..!)

Sånn den funker er at den utvider, eller pakker ut, det siste argumentet, som er en liste. Alle andre tidligere argumenter blir brukt _as is_. Så vi ender opp med å "pakke ut" den siste lista, og fjerner `apply`. Disse er like:

```scheme
(apply + 1 2 3 (list 4 5 6))   ; 21
(apply + (list 1 2 3 4 5 6))   ; 21
(apply + 1 2 3 4 5 '(6))       ; 21
(+ 1 2 3 4 5 6)                ; 21
```

Vi kan f. eks. lage en funksjon som tar inn en prosedyre og argumenter, og anvender helt generelt. Denne er ikke særlig nyttig i seg selv, men den kan muligens gi litt inspirasjon, noe lignende av dette trengs i obligen!

```scheme
(define (do-f f . args)
  (apply f args))
```

```scheme
(do-f (lambda (x y) (+ x y)) 1 2)  ; 3
(do-f cons 1 2)                    ; 1 .2
(do-f + 1 2 3)                     ; 6
```


Til slutt tok vi [denne Kahooten](https://play.kahoot.it/#/?quizId=ad6722bf-5377-4c39-997c-63d24a8cf5ad&user=V3gas1&token=16762179-be6b-4001-9e85-5512698e47aa)!
