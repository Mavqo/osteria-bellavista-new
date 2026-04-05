import type { APIRoute } from 'astro';

export const GET: APIRoute = ({ site }) => {
  // Ensure base URL ends with a slash
  const rawBase = import.meta.env.BASE_URL;
  const base = rawBase.endsWith('/') ? rawBase : rawBase + '/';

  const manifest = {
    name: 'Osteria Bellavista',
    short_name: 'Bellavista',
    description: 'Tradizione ticinese con vista lago a Lugano',
    start_url: base,
    display: 'standalone',
    background_color: '#1a1a1a',
    theme_color: '#1a1a1a',
    icons: [
      {
        src: `${base}images/icons/manifest-icon-192.maskable.png`,
        sizes: '192x192',
        type: 'image/png',
        purpose: 'any',
      },
      {
        src: `${base}images/icons/manifest-icon-192.maskable.png`,
        sizes: '192x192',
        type: 'image/png',
        purpose: 'maskable',
      },
      {
        src: `${base}images/icons/manifest-icon-512.maskable.png`,
        sizes: '512x512',
        type: 'image/png',
        purpose: 'any',
      },
      {
        src: `${base}images/icons/manifest-icon-512.maskable.png`,
        sizes: '512x512',
        type: 'image/png',
        purpose: 'maskable',
      },
    ],
  };

  return new Response(JSON.stringify(manifest, null, 2), {
    headers: {
      'Content-Type': 'application/manifest+json',
    },
  });
};
