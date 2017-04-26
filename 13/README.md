## Time 13

Jeg hadde gjort klart et opplegg på makroer, men jeg utsatte makroer til neste uke på grunn av at mange trengte mye tid til å jobbe med oblig.

### Oblighjelp 3a

Først sa jeg litt om obligen, før vi jobbet med den.

Jeg har et par tips, triks, whatever. Hvis dere har starta med implementasjon med binærtre med en gang fordi det er krav på sisteoppgave, men dere sliter med det, så synes jeg at dere burde prøve med en annen implementasjon. Jeg veit ikke helt hvordan poengfordelinga på oppgavene er, men jeg tror du kan få en del poeng med en “naiv” (altså treig) implementasjon. Husk at dere bare trenger 12 poeng til sammen på denne og neste!

Binære søketrær er trær der enhver node har maks to barn, et venstre- og et høyrebarn. Disse barna er selv trær. I tillegg er de ordnet slik at man kan sammenligne "nøklene" (verdien i nodene). Dersom du skal sette inn eller slå opp noe som er _mindre enn_ den noden du ser på, så vil denne være å finne i det _venstre_ treet. Tilsvarende for _større enn_ til _høyre_. Dette halverer søketiden i hvert steg, og følgelig får vi søketid på `O(log n)` i stedet for `O(n)` ved en vanlig lineær tabell.

La oss si at vi skal bygge et tre. Vi starter med `c` som er rotnoden. Så skal vi sette inn `z`. Da vet vi at siden `z` er "større enn" `c`, så skal vi sette denne inn som det høyre barnet til `c`. I Scheme bruker vi `string<=?`, `string>=?` og `string=?` som `<`, `>` og likhetssjekk, respektivt, for strenger. Så `(string<=? c z) --> #t`. Så setter vi inn `a` og `b` etterpå, og vi får følgende tre.

```
     ( c )
     /    \
    /      \
 ( a )     ( z )
     \
      \
     ( b )
```

Gruppelærer Håkon posta [et notat](https://piazza.com/class/ixvq39smczm4l?cid=53) på mandag som kan være til hjelp. Et par punkter derfra:

1. Det er helt OK at `jury` og `Jury` (liten vs stor bokstav) behandles som _forskjellige_ ord, slik som skjer når vi leser inn med `read-corpus`. Poenget her er ikke språkanalysen.
2. Konseptuelt så kan vi se på en språkmodell som en tabell der nøklene er strenger (altså et ord) og verdiene er nye tabeller. Hvis vi vil sjekke frekvensen til `<jury, said>`, så slår vi opp i tabellen på `jury`. Da får vi tilbake en tabell. Og så vil vi slå opp i denne tabellen på `said`.
3. `<s>` bør være en av nøklene i hovedtabellen. `</s>` bør ikke være det, men den bør finnes i (mange av) undertabellene.

Resten av timen jobba vi med obligen.
