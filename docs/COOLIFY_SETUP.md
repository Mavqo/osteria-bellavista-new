# 🚀 Coolify Setup - Osteria Bellavista

Guida completa per configurare il deploy del sito Astro su Coolify self-hosted.

---

## 📋 Prerequisiti

- **Coolify** self-hosted su `192.168.1.158`
- **Porta** `8087` disponibile sul server
- Progetto pushato su un repository Git (GitHub/GitLab/Gitea)

---

## 🔧 Configurazione Coolify

### 1. Accedi a Coolify

Apri il browser e vai a: `http://192.168.1.158`

### 2. Crea un Nuovo Progetto

1. Clicca su **"Create New Project"** o seleziona un progetto esistente
2. Nome progetto: `osteria-bellavista`
3. Environment: `production`

### 3. Aggiungi una Nuova Resource

1. Clicca su **"+ New Resource"**
2. Seleziona **"Docker Compose"** o **"Application"**
3. Scegli il tuo **Git Provider** (GitHub/GitLab)
4. Seleziona il repository: `osteria-bellavista-new`

### 4. Configurazione Resource

#### Tab: General

| Setting | Value |
|---------|-------|
| **Name** | `osteria-bellavista-web` |
| **Base Directory** | `/` |
| **Dockerfile Path** | `Dockerfile` |

#### Tab: Environment Variables

Aggiungi le seguenti variabili (se necessarie):

```bash
# Ambiente
NODE_ENV=production

# (Opzionale) Configurazioni Astro
# ASTRO_TELEMETRY_DISABLED=1
```

> ℹ️ **Nota:** Il progetto Astro non richiede variabili specifiche per il build statico.

#### Tab: Ports

| Port | Descrizione |
|------|-------------|
| **Expose** | ✅ Enable |
| **Port** | `80` (interno container) |
| **Published Port** | `8087` (mappato su host) |

#### Tab: Health Check

| Setting | Value |
|---------|-------|
| **Healthcheck Enabled** | ✅ |
| **Healthcheck Path** | `/health` |
| **Healthcheck Port** | `80` |

---

## 🔄 Deploy Automatico

### Opzione A: Webhook (Consigliato)

1. Vai su **Settings > Webhook** della resource
2. Copia l'URL del webhook fornito da Coolify
3. Nel tuo repository GitHub/GitLab:
   - Vai su **Settings > Webhooks**
   - Aggiungi l'URL di Coolify
   - Content type: `application/json`
   - Trigger: **Push events**

### Opzione B: Git Polling

1. Vai su **Settings > Deployment**
2. Abilita **Git Polling**
3. Imposta intervallo: `5 min`

---

## 🚀 Deploy Manuale

Per forzare un deploy immediato:

1. Vai alla pagina della resource
2. Clicca su **"Deploy"** in alto a destra
3. Oppure usa il comando CLI (se configurato):
   ```bash
   curl -X POST "http://192.168.1.158/api/v1/deploy?token=YOUR_TOKEN"
   ```

---

## 🌐 Configurazione Domain

### 1. Aggiungi Domain

1. Vai su **Settings > Domains**
2. Clicca **"+ Add Domain"**
3. Inserisci: `osteria-bellavista.tuodomain.com`
4. Seleziona **Port**: `8087`

### 2. (Opzionale) HTTPS con Let's Encrypt

1. Abilita **HTTPS**
2. Coolify richiederà automaticamente il certificato SSL

---

## 📝 Comandi Utili

### Verificare il Deploy

```bash
# SSH nel server Coolify
ssh root@192.168.1.158

# Verifica container in esecuzione
docker ps | grep osteria

# Logs del container
docker logs -f osteria-bellavista-web

# Verifica health check
curl http://localhost:8087/health

# Verifica sito
curl -I http://localhost:8087
```

### Troubleshooting

```bash
# Riavvia il container
docker restart osteria-bellavista-web

# Rebuild manuale
docker-compose -f /data/coolify/services/.../docker-compose.yml build --no-cache

# Verifica file statici
docker exec osteria-bellavista-web ls -la /usr/share/nginx/html/
```

---

## 📁 Struttura File

```
osteria-bellavista-new/
├── Dockerfile           # Multi-stage build Astro → Nginx
├── docker-compose.yml   # Configurazione servizio
├── nginx.conf           # Configurazione Nginx
├── COOLIFY_SETUP.md     # Questo file
├── astro.config.mjs     # Config Astro
├── package.json         # Dipendenze Node.js
├── dist/                # Output build (generato)
└── src/                 # Sorgente Astro
```

---

## ✅ Checklist Pre-Deploy

- [ ] Progetto pushato su Git
- [ ] `Dockerfile` presente nella root
- [ ] `npm run build` funziona in locale
- [ ] Porta `8087` libera su `192.168.1.158`
- [ ] Coolify configurato con repository corretto
- [ ] Webhook o polling configurato

---

## 🔍 Verifica Post-Deploy

1. **Sito accessibile**: `http://192.168.1.158:8087`
2. **Health check**: `http://192.168.1.158:8087/health`
3. **Asset ottimizzati**: Controlla immagini WebP/AVIF
4. **Gzip attivo**: Verifica header `Content-Encoding: gzip`
5. **Cache headers**: Controlla `Cache-Control` su asset statici

---

## 📞 Supporto

- **Coolify Docs**: https://coolify.io/docs/
- **Astro Docs**: https://docs.astro.build/
- **Container logs**: Coolify Dashboard → Resource → Logs
