## Time 14

Vi snakket om **makroer**!

Makroer er en måte å få brukerdefinert syntaks på. Altså vi kan endre språket!

En makro er en transformasjon av kode.
Koden blir transformert før den blir evaluert.
Prosedyren fortsetter som om det sto slik på forhånd.

Altså: Vi forteller interpreteren hvordan evaluere et uttrykk.

Makroer brukes ofte i implementasjonen av Scheme:
`or`, for eksempel, kan lages ved makroer. En makro ser slik ut:

```scheme
(define-syntax macro
    <syntax-transformer>)
```

For å få til dette, denne transformasjonen, bruker vi `syntax-rules`. (Det finnes også andre muligheter i Scheme, men dette er enklest.) Dette er noe som ser helt ut som Scheme. Men det er ikke det! Det er ikke kode som evalueres slik som vi er vant til. Det er en transformasjon som kjenner igjen mønstre som vi definerer, og gjør om til "standard" Scheme-kode. Det er på formen:

```scheme
(define-syntax macro
    (syntax-rules (<keywords>)
        ((<pattern_1>) <template_1>)
        . . .
        ((<pattern_N>) <template_N>)))
```

**Eksempel:**
Noen ganger kan vi ha behov for å bytte verdiene på to variable. Altså vi vil gjerne ha en prosedyre `swap`.

Hvordan vil vi definere den? Vel, vi må ha en midlertidig variabel `tmp`, som vi bruker for å mellomlagre en av verdiene. Konseptuelt:

```scheme
(define (swap a b)
    (let ((tmp a))
        (set! a b)
        (set! b tmp)))
```

Men dette funker ikke:

```scheme
(define a 1)
(define b 2)
a ; 1
b ; 2
(swap a b)
a ; 1
b ; 2
```

Hvis vi kan bruke en makro, derimot:

```scheme
(define-syntax swap
  (syntax-rules ()
    ((swap a b)
     (let ((tmp a))
       (set! a b)
       (set! b tmp)))))
```

Her betyr `syntax-rules ()` at det ikke er noen nøkkelord i mønsteret. Vi skal straks se hva det vil si i praksis.

Så har vi det første uttrykket, `<pattern>`, det er `(swap a b)`. Og `<template>` er da

```scheme
(let ((tmp a))
    (set! a b)
    (set! b tmp)
```

Altså det vi definerte `swap` som i stad.

Nå funker det!!

**Oppgave:**
Lag en makro `++`, som tar et tall og øker verdien til tallet med en. Vi vil bruke den slik:

```scheme
(define a 10)
(++ a)
a ; 11
```


**Løsning:**
```
(define-syntax ++
    (syntax-rules ()
      ((++ n) (set! n (+ n 1)))))
```
Merk også at navnet til makroen (som vi sier helt øverst ved `define-syntax`) kan byttes ut med `_`. Men for lesbarhets skyld kan det være fordelaktig å skrive navnet helt ut.

Med makroer kan vi nå introdusere `for`-løkker! På obligen skal dere implementere `while`, så dette kan være litt nyttig for dere..!

Vi vil ha `(for element in list <do stuff>)`.

```scheme
(define-syntax for
    (syntax-rules ()
        ((for element in list
                         body)
          (for-each (lambda (element)
                               body)
                             list))))
```

**Bruk:**

```scheme
(for i in ‘(1 2 3 4) (display i))
(newline)
(for i abcdefghihs ‘(1 2 3 4) (display i)) ;; Hæ??
```

For å unngå dette benytter vi oss av `<keywords>` i `syntax-rules`:

```scheme
(define-syntax for
    (syntax-rules (in)
        ((for element in list
                         body)
          (for-each (lambda (element)
                               body)
                             list))))
```

Nå får vi feilmelding for det uttrykket vi brukte i stad, altså vi tvinges til å bruke `in`, slik vi ville.

**Annen oppgave:**
Lag `when`. Den skal funke slik:

```scheme
(when predicate body)
```
Det er altså en `if` der du ikke trenger else-alternativ/konsekvens, og du kan ha flere enn ett uttrykk i kroppen. (Altså du skal ikke trenge å ha `begin` rundt.)

**Løsning:**

```scheme
(define-syntax when
    (syntax-rules ()
        ((when condition . body)
            (if condition (begin . body) #f))))
```
