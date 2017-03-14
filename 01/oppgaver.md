### Oppgave 1 – Funksjonell programmering

Hva er (ren) funksjonell programmering? Hva er forskjellen på funksjonell programmering og imperativ programmering (Java, C…)?

Begreper fra forelesningen dere kan bruke:

- Sideeffekter
- Tilstandsendring
- Gjennomsiktig semantikk (referential transparency)
- Destruktive operasjoner
- Funksjonelle transformasjoner
- Sekvensielle endringer


### Oppgave 2 – Schemes evalueringsregel

#### a)

Hvordan evalueres det sammensatte uttrykket (+ 3 (- 9 5)), og hvilken verdi evaluerer det til?

#### b)

Generelt, hvordan evalueres sammensatte uttrykk i Scheme (som ikke er special forms)? 
Begreper fra forelesningen dere kan bruke:

Parentesbasert prefiksnotasjon
Operator og operand
Primitive / atomære uttrykk

#### c)

Hva evaluerer det siste uttrykket her til? (Uttrykket bruker 3 linjer.)

```scheme
(define foo 4)

(* (+ foo 3)
   (- (/ 25 5)
      2))
```

#### d)

**Utfordring**: Hva med dette uttrykket? (Denne syntaksen forklares først i 3. forelesning, men dere kan kanskje gjette hva som skjer her? Hva evaluerer det første `lambda`-uttrykket til?)

```scheme
((lambda (x) (+ x 4)) (* 2 3))
```

### Oppgave 3 – Å definere en prosedyre

#### a)

Gi eksempler på de to hovedsyntaksene for å definere en prosedyre. (Den ene syntaksen er en forkortelse / syntaktisk sukker for den andre.)

#### b)

Definer en prosedyre som tar to tall som argumenter og returnerer gjennomsnittet av dem. Definer prosedyren på begge formene. (Så det blir to prosedyrer som gjør det samme).
