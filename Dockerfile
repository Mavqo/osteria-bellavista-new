# =============================================================================
# Osteria Bellavista - Astro Production Dockerfile
# =============================================================================
# Multi-stage build per ottimizzare l'immagine finale
# - Build stage: Node.js 20 con tutte le dipendenze per buildare Astro
# - Production stage: Nginx Alpine per servire i file statici
# =============================================================================

# -----------------------------------------------------------------------------
# STAGE 1: Build
# -----------------------------------------------------------------------------
FROM node:20-alpine AS builder

# Imposta la working directory
WORKDIR /app

# Installa dipendenze di sistema necessarie per Sharp (ottimizzazione immagini)
RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    vips-dev \
    vips-heif \
    vips-magick

# Copia i file di dipendenza prima per sfruttare la cache Docker
COPY package*.json ./

# Installa TUTTE le dipendenze (compresi devDependencies necessari per il build)
# Usa npm ci solo quando il lockfile e' presente.
RUN if [ -f package-lock.json ] || [ -f npm-shrinkwrap.json ]; then \
      npm ci; \
    else \
      npm install --no-audit --no-fund; \
    fi

# Copia tutto il codice sorgente
COPY . .

# Verifica che Sharp sia installato correttamente
RUN npm ls sharp || echo "Sharp check completed"

# Build del sito Astro (output in /app/dist)
ENV NODE_ENV=production
RUN npm run build

# Verifica che il build sia stato creato correttamente
RUN ls -la /app/dist/ && echo "✅ BUILD SUCCESS"

# -----------------------------------------------------------------------------
# STAGE 2: Production
# -----------------------------------------------------------------------------
FROM nginx:alpine-slim AS production

# Installa curl per health check
RUN apk add --no-cache curl

# Rimuovi la configurazione di default di Nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copia la configurazione Nginx custom
COPY nginx.conf /etc/nginx/conf.d/

# Copia i file statici buildati dallo stage precedente
COPY --from=builder /app/dist /usr/share/nginx/html

# Verifica che i file siano presenti
RUN ls -la /usr/share/nginx/html/ && echo "✅ Static files copied"

# Espone la porta 80
EXPOSE 80

# Health check per verificare che il server sia operativo
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:80/ || exit 1

# Avvia Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
