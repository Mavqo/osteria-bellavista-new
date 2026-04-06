# Osteria Bellavista New

Modern multilingual website for **Osteria Bellavista**, a restaurant in Bissone on Lake Lugano.

This project is built as a polished digital presence for the restaurant, with a strong visual identity, clear content structure, mobile-first performance, and a layout designed to support bookings, menu discovery, and brand presentation.

![Project screenshot](src/assets/images/image.png)

## Project Goal

The goal of this project is to provide a more contemporary and scalable version of the restaurant website, with a clean frontend architecture and a stronger presentation layer.

Core focus:

- present the restaurant in a clear and elegant way
- support both Italian and English content
- make menu and key sections easy to maintain
- highlight reservation and contact actions
- keep the site fast, lightweight, and SEO-friendly

## Tech Stack

- `Astro 5`
- `React 19`
- `Tailwind CSS 4`
- `TypeScript`
- `i18next`
- `Playwright`

## Main Features

- multi-section landing page with hero, story, menu, gallery, testimonials, events, reservations, and location
- bilingual structure with `IT/EN` pages
- interactive components for menu display and modal-driven actions
- optimized media handling for desktop and mobile
- SEO metadata, schema markup, and PWA-ready structure
- static-first architecture suitable for reliable production deploys

## Local Development

Requirements:

- `bun` recommended, or `npm`

Start the project with:

```bash
bun install
bun dev
```

Or:

```bash
npm install
npm run dev
```

Production build:

```bash
bun run build
```

## Project Structure

```text
src/
├── components/       Astro and React components
├── data/             Restaurant content and structured data
├── layouts/          Page layouts
├── lib/              i18n, analytics, and utility logic
├── locales/          Italian and English translations
├── pages/            Astro routes
└── styles/           Global styling
```

## Notes

This repository contains the current "new" version of Osteria Bellavista. It is intended to be the active base for future design iterations, content updates, and production deployment.
