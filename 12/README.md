## Time 12

Vi gikk gjennom løsningsforslaget for oppgave 1b fra oblig 2b.

Deretter så vi på noen oppgaver fra [en tidligere eksamen (2015)](http://www.uio.no/studier/emner/matnat/ifi/INF2810/v16/oppgaver/eksamen_inf2810_2015_bm.pdf), spesifikt 2: b), d), e) og f):

Vi skal definere en prosedyre `replace` som har signaturen `(replace x y seq)`. `seq` er en liste av symboler, og vi skal erstatte alle forekomster av symbolet `x` med symbolet `y`.

- **b)** går ut på å gjøre dette rent funksjonelt, med _vanlig_ rekursjon.
- **e)** går ut på å lage en strømbasert versjon av prosedyren fra b).
- **d)** går ut på å gjøre dette _destruktivt_, altså modifisere den originale lista.
- **f)**: Hvor mange `cons`-operasjoner utløses i følgende kodeeksempel ved de forskjellige implementasjonene våre?

```scheme
(define foo '(a b b a))
(replace 'a 'c foo)
```

### [Min fasit her!](fasit.md)
