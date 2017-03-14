## Time 2

Først hadde vi noen diskusjonsoppgaver, som vi først prøvde å svare på i par/grupper, og deretter gikk vi gjennom svaret i plenum. Deretter snakket jeg litt om prosedyrer og prosesser, hva som er definisjonen på disse.

### Oppgaver
Bytt på å forklare for hverandre. Si pass og gå til nestemann hvis man ikke vet, bruk Ctrl+F i foilene hvis ingen vet.

**Forklar/definer for hverandre**
1. Hva er primitive / atomære uttrykk?
2. Hva er høyereordens prosedyrer?
3. Hva er en special form? (Hint: Det har å gjøre med hvordan uttrykk evalueres.)
4. (+ 2 3) utgjør et prosedyrekall på prosedyren +. Hva kalles + i dette kallet / denne listen, og hva kalles tallene 2 og 3? (Hint: Begge begrepene begynner på “o”.)
5. Hva er et predikat?
6. Hva må man alltid ha med i en rekursiv prosedyre for at den skal terminere?
7. Hva er rekursjon?

Fasit finner du nederst her!

### Prosedyre vs prosess

#### Prosedyre
En prosedyre kan være ikke-rekursiv, eller den kan være rekursiv.

En prosedyre er en oppskrift. Det er det vi ville kalt en funksjon i C eller Python. En prosess er det som skjer når prosedyren kalles.

#### Prosess
En prosess kan være rekursiv eller iterativ.

I en rekursiv prosess får vi en kjede med ventende kall.

En iterativ prosess vil ikke ha en kjede med ventende kall; den vil “bytte på” variablene i funksjonen underveis, slik at den returnerer “med en gang” når den når basistilfellet.

For å få laget en iterativ prosess, må vi ha en halerekursiv prosedyre. Det vil si at det rekursive kallet er det siste prosedyren utfører.

### Fasit

1. De som evaluerer til seg selv. Byggesteinene. (Eksempler: Tall, strings, booleans.)
2. Prosedyrer som tar funksjoner som argument og/eller returnerer en prosedyre
3. Følger ikke de vanlige evalueringsreglene.
4. `+` er operator; verdiene er operander
5. En prosedyre som returnerer `#t` eller `#f`
6. Basistilfelle. Det er viktig å ha et basistilfelle når man har en rekursiv prosedyre. Ellers vil den ikke terminere. Så vi beveger oss stadig nærmere basistilfellet. Vi så på et kall med dette der vi brukte substitusjonsmodellen.
7. Det er når noe er definert ved hjelp av seg selv. Kalle på seg selv.
For eksempel: Fakultet i matematikk. Fakultetet til et tall er lik tallet selv ganger fakultetet til tallet minus 1:

```
f(0) = 1
f(n) = n*f(n-1)
```
