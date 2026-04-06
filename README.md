# Osteria Bellavista New

Sito web multilingua per **Osteria Bellavista**, ristorante a Bissone sul Lago di Lugano.

Il progetto e' pensato come una presenza digitale moderna e veloce per il ristorante: atmosfera visiva curata, contenuti chiari, menu navigabile, prenotazioni e struttura ottimizzata per mobile, SEO e performance.

![Screenshot del sito](src/assets/images/image.png)

## Obiettivo

Creare una versione piu' contemporanea del sito del ristorante, con una base tecnica pulita e facilmente estendibile.

Focus del progetto:

- presentazione del locale e della sua identita'
- esperienza bilingue `IT/EN`
- menu e contenuti aggiornabili
- call to action chiare per prenotazioni e contatto
- performance elevate con rendering statico

## Stack

- `Astro 5`
- `React 19`
- `Tailwind CSS 4`
- `TypeScript`
- `i18next`
- `Playwright`

## Funzionalita' principali

- homepage multisezione con hero, storia, menu, gallery, eventi, recensioni e location
- versione italiana e inglese
- componenti React per parti interattive come menu e modali
- immagini ottimizzate e attenzione al caricamento mobile
- metadati SEO, schema markup e manifest PWA
- struttura pronta per deploy statico

## Sviluppo locale

Prerequisiti:

- `bun` consigliato, oppure `npm`

Comandi principali:

```bash
bun install
bun dev
```

Oppure:

```bash
npm install
npm run dev
```

Build produzione:

```bash
bun run build
```

## Struttura essenziale

```text
src/
├── components/       Componenti Astro e React
├── data/             Contenuti del ristorante
├── layouts/          Layout pagina
├── lib/              i18n, analytics e utility
├── locales/          Traduzioni IT/EN
├── pages/            Routing Astro
└── styles/           Stili globali
```

## Note

Questo repository contiene la versione nuova del sito Osteria Bellavista. La versione precedente e' stata mantenuta separata durante la fase di transizione, mentre questo progetto rappresenta la base attuale da usare per deploy e iterazioni future.
