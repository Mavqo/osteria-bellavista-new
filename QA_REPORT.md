# QA Report - Osteria Bellavista

## Footer

### Contenuto

| # | Verifica | Stato | Note |
|---|----------|-------|------|
| 1 | Nome "Osteria Bellavista" presente | ✅ PASS | Visualizzato tramite `t('site.title')` |
| 2 | Indirizzo completo | ⚠️ PARTIAL | "Via Pessina 12, 6900 Lugano" presente; manca "Ticino" nel footer (presente solo in `location.address`) |
| 3 | Telefono: +41 91 123 45 67 | ✅ PASS | Link `tel:+41911234567` corretto |
| 4 | Email: info@osteriabellavista.ch | ✅ PASS | Link `mailto:info@osteriabellavista.ch` corretto |
| 5 | Link Instagram e Facebook presenti | ✅ PASS | Entrambi con icone SVG, target="_blank", rel="noopener noreferrer" |

**Dettagli Social:**
- Instagram: `https://instagram.com/osteriabellavista`
- Facebook: `https://facebook.com/OsteriaBellavistaLugano`

### Orari

| # | Verifica | Stato | Valore Attuale |
|---|----------|-------|----------------|
| 1 | Orari pranzo | ✅ PASS | Mar - Dom: 12:00 - 14:30 |
| 2 | Orari cena | ✅ PASS | Mar - Sab: 19:00 - 22:30 |
| 3 | Chiusura indicata | ✅ PASS | Chiuso: Lun e Dom sera |

### Light/Dark Mode

| # | Verifica | Stato | Implementazione |
|---|----------|-------|-----------------|
| 1 | Adattamento tema scuro | ✅ PASS | `bg-primary dark:bg-charcoal-dark` |
| 2 | Link visibili e cliccabili | ✅ PASS | Tutti i link hanno `hover:text-secondary transition-colors` |
| 3 | Contrasto testo/sfondo | ✅ PASS | Testo `text-alabaster/70` su sfondo scuro, hover migliora leggibilità |

**Note implementazione:**
- Colori: `text-alabaster dark:text-alabaster` per testo principale
- Placeholder: `placeholder:text-alabaster/40 dark:placeholder:text-alabaster/40`
- Bordi: `border-alabaster/10 dark:border-alabaster/10`

### Responsive

| # | Verifica | Stato | Implementazione |
|---|----------|-------|-----------------|
| 1 | Colonne su mobile | ✅ PASS | `grid-cols-1 md:grid-cols-2 lg:grid-cols-4` - stack verticale corretto |
| 2 | Link social spaziati | ✅ PASS | `flex gap-4` con container `w-10 h-10` |

**Note responsive:**
- Newsletter: `flex-col md:flex-row` con adattamento
- Copyright: `flex-col md:flex-row` per stack su mobile
- Container sempre con `px-4` per margini laterali

### Struttura Componente

```
Footer
├── Newsletter Section (border-bottom)
│   ├── Heading + Description
│   └── Form (email + submit)
├── Main Grid (4 colonne)
│   ├── Brand (logo + description)
│   ├── Quick Links (navigazione)
│   ├── Contact & Hours
│   └── Social Links
└── Copyright Bar
    ├── Copyright text
    └── Legal links (Privacy, Terms)
```

### Issue Trovate

1. **MINOR**: L'indirizzo nel footer (`footer.contact.address`) mostra solo "Via Pessina 12, 6900 Lugano" senza "Ticino", mentre la location completa è disponibile solo in `location.address`.

### Checklist Finale

- [x] Testo tradotto correttamente (i18n)
- [x] Link telefono cliccabile
- [x] Link email cliccabile
- [x] Social link con security attributes (noopener noreferrer)
- [x] Form newsletter con validation HTML5 (`required`)
- [x] ARIA labels sui social
- [x] Copyright anno dinamico (`currentYear`)
- [x] Colori dark mode implementati
- [x] Responsive breakpoints corretti
