# 🎨 Design Specification - Osteria Bellavista

> **Template Base:** MasuRii (Astro + Tailwind)  
> **Brand:** Osteria Bellavista - Ristorante Tradizionale Italiano  
> **Posizione:** Via Pessina 12, 6900 Lugano, Svizzera  

---

## 1. 🎯 Brand Identity

### Atmosfera
- **Stile:** Tradizionale italiano, elegante ma accogliente
- **Vibe:** Caldo, familiare, vista lago e montagne
- **Target:** Clientela che cerca autenticità e qualità
- **Fondato:** 1987

### Keywords
`Tradizione` `Ticino` `Lago di Lugano` `Cucina italiana` `Accoglienza` `Terrazza panoramica`

---

## 2. 🎨 Palette Colori

### Colori Brand Originali (dal vecchio sito)

| Colore | Hex | Uso |
|--------|-----|-----|
| **Olive Deep** | `#1a3a2a` | Primary, bottoni principali, header |
| **Olive Light** | `#2d5a3f` | Hover states, varianti |
| **Terracotta** | `#c45c3e` | Accent, badge, elementi call-to-action |
| **Terracotta Light** | `#d97b5e` | Hover accent |
| **Cream** | `#f8f6f2` | Background chiaro |
| **Sand** | `#e8e2d9` | Secondary background, bordi |
| **Gold** | `#c9a961` | Highlights, decorazioni, dark mode accent |
| **Charcoal** | `#1a1a1a` | Testo principale |
| **Stone Warm** | `#8b8175` | Testo secondario |

### Colori Dark Mode

| Colore | Hex | Uso |
|--------|-----|-----|
| **Background Dark** | `#0f1410` | Sfondo principale dark |
| **Card Dark** | `#1a1f1b` | Card, popover dark |
| **Olive Bright** | `#3d8b5f` | Primary dark mode |
| **Terracotta Bright** | `#e07a5f` | Accent dark mode |
| **Gold Bright** | `#d4a853` | Secondary dark mode |

### Mappaggio Variabili CSS Tailwind

```css
/* src/styles/global.css - Variabili da modificare */

@theme {
  /* Fonts - GIÀ OK */
  --font-serif: 'Playfair Display', serif;
  --font-sans: 'DM Sans', sans-serif;

  /* Colors Brand Osteria Bellavista */
  --color-olive: #1a3a2a;
  --color-olive-light: #2d5a3f;
  --color-olive-bright: #3d8b5f;
  
  --color-terracotta: #c45c3e;
  --color-terracotta-light: #d97b5e;
  --color-terracotta-bright: #e07a5f;
  
  --color-cream: #f8f6f2;
  --color-sand: #e8e2d9;
  --color-gold: #c9a961;
  --color-gold-bright: #d4a853;
  
  --color-charcoal: #1a1a1a;
  --color-stone: #8b8175;

  /* Semantic Mapping */
  --color-background: var(--background);
  --color-foreground: var(--foreground);
  --color-primary: var(--primary);
  --color-secondary: var(--secondary);
  --color-accent: var(--accent);
  --color-muted: var(--muted);
}

/* Light Mode */
:root {
  --background: #f8f6f2;        /* Cream */
  --foreground: #1a1a1a;        /* Charcoal */
  --primary: #1a3a2a;           /* Olive Deep */
  --primary-foreground: #f8f6f2;
  --secondary: #c9a961;         /* Gold */
  --secondary-foreground: #1a1a1a;
  --accent: #c45c3e;            /* Terracotta */
  --accent-foreground: #ffffff;
  --muted: #8b8175;             /* Stone Warm */
}

/* Dark Mode */
.dark {
  --background: #0f1410;        /* Deep dark green-black */
  --foreground: #f8f6f2;        /* Cream */
  --primary: #3d8b5f;           /* Olive Bright */
  --primary-foreground: #0f1410;
  --secondary: #d4a853;         /* Gold Bright */
  --secondary-foreground: #0f1410;
  --accent: #e07a5f;            /* Terracotta Bright */
  --accent-foreground: #0f1410;
  --muted: #a8a29e;
}
```

---

## 3. 🔤 Tipografia

### Font Attuali (Template)
- **Serif:** Playfair Display ✅ Perfetto per ristorante italiano
- **Sans:** DM Sans ✅ Ottimo per leggibilità

### Scale Tipografica Consigliata

```css
/* H1 - Hero Title */
h1, .text-hero {
  font-family: var(--font-serif);
  font-size: clamp(3rem, 8vw, 6rem);
  font-weight: 700;
  line-height: 1.1;
  letter-spacing: -0.02em;
}

/* H2 - Section Titles */
h2, .text-section {
  font-family: var(--font-serif);
  font-size: clamp(2rem, 5vw, 3.5rem);
  font-weight: 600;
  line-height: 1.2;
}

/* H3 - Subsection */
h3, .text-subsection {
  font-family: var(--font-serif);
  font-size: clamp(1.5rem, 3vw, 2rem);
  font-weight: 600;
}

/* Body - Testo principale */
body, .text-body {
  font-family: var(--font-sans);
  font-size: 1rem;
  line-height: 1.7;
}

/* Caption - Menu items, metadati */
.text-caption {
  font-family: var(--font-sans);
  font-size: 0.875rem;
  letter-spacing: 0.05em;
  text-transform: uppercase;
}

/* Price - Prezzi menu */
.text-price {
  font-family: var(--font-serif);
  font-size: 1.125rem;
  font-weight: 600;
  color: var(--color-terracotta);
}
```

---

## 4. 🧩 Personalizzazioni Componenti

### 4.1 Hero (`src/components/Hero.astro`)

**Cambiamenti richiesti:**

```astro
---
import { useTranslations } from '../lib/i18n';
import OptimizedImage from './ui/OptimizedImage.astro';
// NUOVA IMMAGINE: sostituire con foto della terrazza/lago
import heroBg from '../assets/images/hero-osteria.jpg';

const t = useTranslations(Astro.currentLocale || 'it'); // Cambiare default in 'it'
---

<section id="hero" class="relative w-full h-[100dvh] flex items-end pb-20 sm:pb-32 overflow-hidden">
  <!-- Background con gradiente paesaggio (stile vecchio sito) -->
  <div class="absolute inset-0 z-0">
    <OptimizedImage
      src={heroBg}
      alt="Osteria Bellavista - Vista Lago di Lugano"
      class="w-full h-full object-cover"
      loading="eager"
      fetchpriority="high"
      sizes="100vw"
    />
    <!-- Overlay sfumato per leggibilità -->
    <div class="absolute inset-0 bg-gradient-to-t from-[#1a3a2a]/80 via-[#1a3a2a]/20 to-transparent z-10"></div>
  </div>

  <!-- Content -->
  <div class="relative z-20 w-full px-6 sm:px-12 lg:px-20 max-w-5xl">
    <!-- Badge tradizione -->
    <p class="text-[#c45c3e] dark:text-[#c9a961] text-sm tracking-[0.3em] uppercase mb-4">
      Dal 1987 • Lugano
    </p>
    
    <!-- Title -->
    <h1 class="text-5xl md:text-7xl lg:text-8xl font-serif font-bold text-[#f8f6f2] leading-[1.1] mb-6">
      Osteria<br />
      <span class="text-[#c9a961]">Bellavista</span>
    </h1>
    
    <!-- Subtitle -->
    <p class="text-lg sm:text-xl text-[#f8f6f2]/90 max-w-xl mb-10 leading-relaxed">
      Cucina tradizionale italiana con vista panoramica sul Lago di Lugano. 
      Un'esperienza gastronomica dal 1987.
    </p>

    <!-- CTAs -->
    <div class="flex flex-col sm:flex-row gap-4">
      <a
        href="#reservations"
        class="inline-flex items-center justify-center bg-[#1a3a2a] hover:bg-[#2d5a3f] text-white rounded-full px-8 sm:px-10 py-4 text-sm sm:text-base font-medium tracking-wide transition-all duration-300 hover:shadow-xl hover:shadow-[#1a3a2a]/20"
      >
        Prenota un tavolo
      </a>
      <a
        href="#menu"
        class="inline-flex items-center justify-center border border-[#f8f6f2]/40 text-[#f8f6f2] hover:bg-[#f8f6f2]/10 rounded-full px-8 sm:px-10 py-4 text-sm sm:text-base font-medium tracking-wide transition-all duration-300"
      >
        Scopri il menu
      </a>
    </div>
  </div>

  <!-- Scroll Indicator -->
  <div class="absolute bottom-8 left-1/2 -translate-x-1/2 z-20 animate-bounce">
    <svg class="h-8 w-8 text-[#f8f6f2]/80" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3" />
    </svg>
  </div>
</section>
```

**Assets necessari:**
- `src/assets/images/hero-osteria.jpg` - Foto terrazza/vista lago (ideale al tramonto)

---

### 4.2 Header (`src/components/Header.astro`)

**Cambiamenti richiesti:**

```astro
<!-- Logo -->
<a href="/" class="text-2xl font-serif font-bold tracking-tight z-10 hover:opacity-80 transition-opacity interactive-focus rounded-sm text-[#1a3a2a] dark:text-[#f8f6f2]">
  <!-- Sostituire con logo testuale o SVG -->
  <span class="flex items-center gap-2">
    <!-- Icona/logo stilizzato opzionale -->
    Osteria Bellavista
  </span>
</a>

<!-- Desktop Nav - Traduzioni IT -->
<nav class="hidden md:flex items-center gap-8 z-10">
  <a href="#story" class="desktop-nav-link text-sm font-medium hover:text-[#c45c3e] transition-colors">La nostra storia</a>
  <a href="#menu" class="text-sm font-medium hover:text-[#c45c3e] transition-colors">Menu</a>
  <a href="#events" class="desktop-nav-link text-sm font-medium hover:text-[#c45c3e] transition-colors">Esperienze</a>
  <a href="#location" class="desktop-nav-link text-sm font-medium hover:text-[#c45c3e] transition-colors">Dove siamo</a>
</nav>

<!-- CTA Button -->
<a href="#reservations" class="hidden md:inline-flex items-center justify-center px-6 py-2.5 text-sm font-medium text-[#f8f6f2] bg-[#1a3a2a] hover:bg-[#2d5a3f] rounded-full transition-colors">
  Prenota
</a>
```

**Note:**
- Rimuovere "Order Online" button (non necessario per ristorante tradizionale)
- Aggiungere logo SVG se disponibile
- Cambiare default locale in 'it'

---

### 4.3 Footer (`src/components/Footer.astro`)

**Cambiamenti richiesti:**

```astro
---
const currentYear = new Date().getFullYear();
const restaurantInfo = {
  name: "Osteria Bellavista",
  address: "Via Pessina 12, 6900 Lugano",
  phone: "+41 91 123 45 67",
  email: "info@osteriabellavista.ch",
  hours: {
    lunch: "12:00 - 14:30",
    dinner: "19:00 - 22:30",
    closed: "Domenica sera e Lunedì"
  },
  social: {
    instagram: "@osteriabellavista",
    facebook: "OsteriaBellavistaLugano"
  }
};
---

<footer id="contact" class="bg-[#1a3a2a] dark:bg-[#0f1410] text-[#f8f6f2] py-16">
  <div class="container mx-auto px-4">
    <!-- Newsletter -->
    <div class="flex flex-col md:flex-row items-center justify-between border-b border-[#f8f6f2]/10 pb-12 mb-12 gap-8">
      <div class="text-center md:text-left">
        <h3 class="font-serif text-2xl md:text-3xl mb-2">Resta aggiornato</h3>
        <p class="text-[#f8f6f2]/60 text-sm">Iscriviti per ricevere eventi speciali e novità.</p>
      </div>
      <form class="flex w-full md:w-auto max-w-md gap-2">
        <input 
          type="email" 
          placeholder="La tua email" 
          class="flex-1 px-4 py-3 bg-[#f8f6f2]/5 border border-[#f8f6f2]/10 rounded-sm text-[#f8f6f2] placeholder:text-[#f8f6f2]/40 focus:outline-none focus:border-[#c9a961]"
        />
        <button type="submit" class="px-6 py-3 bg-[#c9a961] text-[#1a1a1a] font-medium rounded-sm hover:bg-[#c9a961]/90">
          Iscriviti
        </button>
      </form>
    </div>

    <!-- Grid 4 colonne -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12 mb-12">
      <!-- Brand -->
      <div class="space-y-4">
        <h4 class="text-2xl font-serif font-bold">{restaurantInfo.name}</h4>
        <p class="text-[#f8f6f2]/60 text-sm leading-relaxed">
          Cucina tradizionale italiana con vista sul Lago di Lugano. Dal 1987.
        </p>
      </div>

      <!-- Link rapidi -->
      <div>
        <h4 class="font-serif text-lg mb-6">Navigazione</h4>
        <nav class="flex flex-col space-y-3">
          <a href="#story" class="text-[#f8f6f2]/70 hover:text-[#c9a961] transition-colors">La nostra storia</a>
          <a href="#menu" class="text-[#f8f6f2]/70 hover:text-[#c9a961] transition-colors">Menu</a>
          <a href="#events" class="text-[#f8f6f2]/70 hover:text-[#c9a961] transition-colors">Esperienze</a>
          <a href="#reservations" class="text-[#f8f6f2]/70 hover:text-[#c9a961] transition-colors">Prenota</a>
        </nav>
      </div>

      <!-- Contatti -->
      <div>
        <h4 class="font-serif text-lg mb-6">Contatti</h4>
        <div class="space-y-4 text-[#f8f6f2]/70 text-sm">
          <p>{restaurantInfo.address}</p>
          <p><a href={`tel:${restaurantInfo.phone.replace(/\s/g, '')}`} class="hover:text-[#c9a961] transition-colors">{restaurantInfo.phone}</a></p>
          <p><a href={`mailto:${restaurantInfo.email}`} class="hover:text-[#c9a961] transition-colors">{restaurantInfo.email}</a></p>
          <div class="pt-2 border-t border-[#f8f6f2]/10 mt-4">
            <p class="font-medium mt-4">Orari</p>
            <p>Pranzo: {restaurantInfo.hours.lunch}</p>
            <p>Cena: {restaurantInfo.hours.dinner}</p>
            <p class="text-[#c45c3e]">Chiuso: {restaurantInfo.hours.closed}</p>
          </div>
        </div>
      </div>

      <!-- Social -->
      <div>
        <h4 class="font-serif text-lg mb-6">Seguici</h4>
        <div class="flex gap-4">
          <a href={`https://instagram.com/${restaurantInfo.social.instagram.replace('@', '')}`} 
             target="_blank" rel="noopener" 
             class="w-10 h-10 flex items-center justify-center rounded-full bg-[#f8f6f2]/5 hover:bg-[#c9a961] hover:text-[#1a1a1a] transition-colors">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="2" width="20" height="20" rx="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path></svg>
          </a>
          <a href={`https://facebook.com/${restaurantInfo.social.facebook}`} 
             target="_blank" rel="noopener"
             class="w-10 h-10 flex items-center justify-center rounded-full bg-[#f8f6f2]/5 hover:bg-[#c9a961] hover:text-[#1a1a1a] transition-colors">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>
          </a>
        </div>
      </div>
    </div>

    <!-- Copyright -->
    <div class="pt-8 border-t border-[#f8f6f2]/10 flex flex-col md:flex-row justify-between items-center gap-4 text-xs text-[#f8f6f2]/40">
      <p>&copy; {currentYear} Osteria Bellavista. Tutti i diritti riservati.</p>
      <div class="flex gap-6">
        <a href="#" class="hover:text-[#f8f6f2] transition-colors">Privacy Policy</a>
        <a href="#" class="hover:text-[#f8f6f2] transition-colors">Termini di servizio</a>
      </div>
    </div>
  </div>
</footer>
```

---

### 4.4 Menu Component (`src/components/Menu.astro`)

**Categorie Menu da implementare:**
- Antipasti
- Primi Piatti
- Secondi Piatti
- Dolci
- Vini del Territorio

**Struttura dati (da creare in `src/lib/data.ts`):**

```typescript
export const menuCategories = [
  {
    id: "antipasti",
    name: "Antipasti",
    items: [
      {
        name: "Bresaola della Valtellina",
        description: "Carpaccio di bresaola, rucola, scaglie di grana, olio al limone",
        price: "24",
        tags: ["senza glutine"]
      },
      {
        name: "Tartare di Manzo",
        description: "Manzo ticinese, tuorlo marinato, capperi di Torricella, crostini",
        price: "28",
        tags: []
      },
      {
        name: "Risotto ai Funghi",
        description: "Risotto carnaroli, porcini e finferli, olio al tartufo nero",
        price: "26",
        tags: ["vegetariano"]
      }
    ]
  },
  // ... altre categorie
];

export const experiences = [
  {
    id: "cena-tramonto",
    title: "Cena al Tramonto",
    description: "Un'esperienza romantica sulla nostra terrazza panoramica mentre il sole calda sul Lago di Lugano.",
    duration: "3 ore",
    price: "180 CHF a persona",
    includes: ["Aperitivo di benvenuto", "Menu degustazione 4 portate", "Abbinamento vini", "Dolce e caffè"],
    image: "/images/esperienza-tramonto.jpg"
  },
  // ... altre esperienze
];
```

---

### 4.5 Global CSS Updates (`src/styles/global.css`)

**Aggiungere/Modificare:**

```css
@layer components {
  /* Bottoni brand Osteria */
  .btn-primary {
    @apply bg-[#1a3a2a] text-[#f8f6f2] px-8 py-3 rounded-full font-medium text-lg 
           hover:bg-[#2d5a3f] transition-transform duration-300 ease-out hover:-translate-y-0.5
           focus:outline-none focus-visible:ring-2 focus-visible:ring-[#c9a961]/50;
  }

  .btn-secondary {
    @apply border-2 border-[#1a3a2a] text-[#1a3a2a] px-8 py-3 rounded-full font-medium text-lg
           hover:bg-[#1a3a2a] hover:text-[#f8f6f2] transition-colors duration-300;
  }

  .btn-accent {
    @apply bg-[#c45c3e] text-white px-8 py-3 rounded-full font-medium text-lg
           hover:bg-[#d97b5e] transition-transform duration-300 ease-out hover:-translate-y-0.5;
  }

  /* Card menu */
  .menu-card {
    @apply bg-white dark:bg-[#1a1f1b] rounded-lg p-6 shadow-warm
           border border-[#e8e2d9] dark:border-[#2a2f2b];
  }

  /* Tag/Categorie */
  .tag-vegetarian {
    @apply inline-flex items-center px-2 py-1 rounded-full text-xs font-medium
           bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-100;
  }

  .tag-gluten-free {
    @apply inline-flex items-center px-2 py-1 rounded-full text-xs font-medium
           bg-amber-100 text-amber-800 dark:bg-amber-900 dark:text-amber-100;
  }

  /* Effetti */
  .shadow-warm {
    box-shadow: 0 10px 40px -10px rgba(196, 92, 62, 0.12), 0 4px 12px rgba(0, 0, 0, 0.04);
  }

  .text-shadow {
    text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
  }
}
```

---

## 5. 🖼️ Assets Necessari

### Immagini da recuperare/recuperabili

| Asset | Tipo | Priorità | Note |
|-------|------|----------|------|
| `hero-osteria.jpg` | Background Hero | Alta | Vista terrazza/lago, ideale al tramonto |
| `logo.svg` | Logo vettoriale | Media | Se disponibile, altrimenti testo Playfair Display |
| `favicon.ico` | Favicon | Media | Icona ristorante/stelle |
| `about-storia.jpg` | Sezione About | Alta | Interno ristorante/chef |
| `esperienza-tramonto.jpg` | Card esperienza | Media | Tavola al tramonto |
| `esperienza-vini.jpg` | Card esperienza | Media | Degustazione vini |
| `esperienza-privata.jpg` | Card esperienza | Media | Salone privato |
| Gallery images (8x) | Galleria | Media | Piatti, ambiente, lago |

### Icone Social
- Instagram: @osteriabellavista
- Facebook: OsteriaBellavistaLugano

---

## 6. 📝 Traduzioni (i18n)

**File da creare/modificare:** `src/locales/it/common.json`

```json
{
  "site": {
    "title": "Osteria Bellavista",
    "description": "Cucina tradizionale italiana con vista sul Lago di Lugano dal 1987"
  },
  "nav": {
    "home": "Home",
    "story": "La nostra storia",
    "menu": "Menu",
    "privateDining": "Esperienze",
    "location": "Dove siamo",
    "reservations": "Prenota"
  },
  "hero": {
    "badge": "Dal 1987 • Lugano",
    "title1": "Osteria",
    "title2": "Bellavista",
    "subtitle": "Cucina tradizionale italiana con vista panoramica sul Lago di Lugano.",
    "cta1": "Prenota un tavolo",
    "cta2": "Scopri il menu"
  },
  "cta": {
    "reserve": "Prenota",
    "viewMenu": "Scopri il menu"
  },
  "footer": {
    "newsletter": {
      "heading": "Resta aggiornato",
      "placeholder": "La tua email",
      "button": "Iscriviti"
    },
    "contact": {
      "heading": "Contatti",
      "address": "Via Pessina 12, 6900 Lugano",
      "phone": "+41 91 123 45 67",
      "email": "info@osteriabellavista.ch"
    },
    "hours": {
      "weekdays": "Pranzo: 12:00 - 14:30",
      "happyHour": "Cena: 19:00 - 22:30"
    },
    "social": {
      "heading": "Seguici",
      "instagram": "Instagram",
      "facebook": "Facebook"
    },
    "legal": {
      "copyright": "© {{year}} Osteria Bellavista. Tutti i diritti riservati.",
      "privacy": "Privacy Policy",
      "terms": "Termini di servizio"
    }
  }
}
```

**Modifiche a `src/lib/i18n.ts`:**
```typescript
import itCommon from '../locales/it/common.json';

export const defaultLocale = 'it';
export const locales = ['it'] as const;

// Aggiungere nel init:
resources: {
  it: { common: itCommon },
}
```

---

## 7. ✅ Checklist Implementazione

### Fase 1: Setup Base
- [ ] Copiare file global.css con nuove variabili
- [ ] Creare `src/locales/it/common.json` 
- [ ] Modificare `src/lib/i18n.ts` (default 'it')
- [ ] Aggiungere font Playfair Display + DM Sans in layout

### Fase 2: Componenti
- [ ] Modificare `Hero.astro` con contenuti Osteria
- [ ] Modificare `Header.astro` con logo e nav
- [ ] Modificare `Footer.astro` con contatti
- [ ] Creare `src/lib/data.ts` con menu
- [ ] Aggiornare `Menu.astro` con dati reali

### Fase 3: Assets
- [ ] Aggiungere `hero-osteria.jpg`
- [ ] Creare/generare favicon
- [ ] Aggiungere immagini gallery
- [ ] Ottimizzare tutte le immagini

### Fase 4: Polish
- [ ] Testare light/dark mode
- [ ] Verificare responsive design
- [ ] Testare navigazione mobile
- [ ] Verificare tutti i link

---

## 8. 🚀 Quick Start CSS

**Snippet pronto per copia-incolla in `src/styles/global.css`:**

```css
/* ============== OSTERIA BELLAVISTA THEME ============== */

@theme {
  /* Fonts */
  --font-serif: 'Playfair Display', Georgia, serif;
  --font-sans: 'DM Sans', system-ui, sans-serif;
  
  /* Brand Colors */
  --color-olive: #1a3a2a;
  --color-olive-light: #2d5a3f;
  --color-olive-bright: #3d8b5f;
  --color-terracotta: #c45c3e;
  --color-terracotta-light: #d97b5e;
  --color-terracotta-bright: #e07a5f;
  --color-cream: #f8f6f2;
  --color-sand: #e8e2d9;
  --color-gold: #c9a961;
  --color-gold-bright: #d4a853;
  --color-charcoal: #1a1a1a;
  --color-stone: #8b8175;
}

/* Light Mode */
:root {
  --background: #f8f6f2;
  --foreground: #1a1a1a;
  --primary: #1a3a2a;
  --primary-foreground: #f8f6f2;
  --secondary: #c9a961;
  --secondary-foreground: #1a1a1a;
  --accent: #c45c3e;
  --accent-foreground: #ffffff;
  --muted: #8b8175;
}

/* Dark Mode */
.dark {
  --background: #0f1410;
  --foreground: #f8f6f2;
  --primary: #3d8b5f;
  --primary-foreground: #0f1410;
  --secondary: #d4a853;
  --secondary-foreground: #0f1410;
  --accent: #e07a5f;
  --accent-foreground: #0f1410;
  --muted: #a8a29e;
}
```

---

*Documento creato per personalizzazione template MasuRii → Osteria Bellavista*
