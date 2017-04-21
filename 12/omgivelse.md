# Detaljert løsningsforslag av 1b fra Oblig 2b

Først minner vi oss på reglene for tegning av omgivelsesdiagram:

1. `define` legger til bindinger i en ramme (i «gjeldende ramme»), mens `set!` endrer dem (i «nærmeste» ramme).
2. Når et `lambda`-uttrykk evalueres i en gitt omgivelse opprettes en prosedyre. Prosedyren representeres som et «par» med en peker til parameterliste og prosedyrekropp, og en annen peker til omgivelsen der den ble opprettet.
3. Når en prosedyre anvendes (eller kalles), utvides prosedyrens omgivelse med en ny ramme der parametrene bindes til argumentverdiene.

Vi starter med den "tomme" globale omgivelsen. (Den inneholder fortsatt alle de innebygde prosedyrene, men de gidder vi ikke tegne.)
![](img/02.JPG)
Vi definerer `count` til å være 42.
![](img/03.JPG)
Vi definerer `make-counter`-prosedyren.
![](img/04.JPG)
Vi ser først på hva som skjer når vi evaluerer uttrykket som vi binder til `make-counter`: Prosedyreobjektet opprettes, med en peker til prosedyrekroppen og parametrene den tar, samt en peker til omgivelsen den hører til.
![](img/06.JPG)
Siden vi har definert denne prosedyren til å være bundet til `make-counter`, legger vi til en binding mellom disse.
![](img/07.JPG)
Vi definerer så `c1` til å være resultatet av et kall på `make-counter`.
![](img/08.JPG)
Vi evaluerer prosedyrekroppen til `make-counter`. Først utvider vi `make-counter`s omgivelse med en ny ramme der vi binder `count` til å være 0. (Siden vi har `(let ((count 0)) ...)`.) 
![](img/09.JPG)
Deretter evalueres `lambda`-kroppen. Vi følger vanlig evalueringsregel her, som vil si at vi oppretter et prosedyreobjekt med en peker til omgivelsen `lambda`-uttrykket evalueres i, altså rammen med `count: 0`, og en peker til prosedyrekroppen og parametrene.
![](img/10.JPG)
Til slutt, siden vi har sagt `(define c1 (make-counter))`, må vi jo opprette en binding mellom `c1` og prosedyreobjektet.
![](img/11.JPG)
Tilsvarende opprettes `c2` ved `(define c2 (make-counter))`.
![](img/12.JPG)
Så har vi et kall på `c1`. Da følger vi regel 3, og utvider prosedyrens omgivelse med en ny ramme der parametrene bindes til argumentverdiene. Men prosedyren `c1` tar ingen parametre, så denne rammen er tom. I denne omgivelsen evaluerer vi kroppen til `c1`.
![](img/13.JPG)
Kroppen til `c1` innebærer å øke den nærmeste `count` med 1, og dette gjør vi.
![](img/14.JPG)
Etter evalueringen blir denne rammen borte.
![](img/15.JPG)
Tilsvarende økes `c1` en gang til.
![](img/16.JPG)
Og en gang til.
![](img/17.JPG)
Til slutt har vi et kall på `c2`.
![](img/18.JPG)
Oppgaven ber oss tegne hva som skjer _idet_ dette kallet evalueres. Det er det vi ser her.
![](img/19.JPG)
