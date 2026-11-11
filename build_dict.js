const fs = require('fs');
const path = require('path');

const baseDir = __dirname;
const data = JSON.parse(fs.readFileSync(path.join(baseDir, 'archify_db.json'), 'utf8'));
const escapeHtml = (value) => String(value).replace(/[&<>"']/g, (character) => ({
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;'
}[character]));

const cards = data.nodes.map((node) => {
    const isTrigger = node.type === 'trigger';
    const attributes = node.attributes.map((attribute) => `<li>${escapeHtml(attribute)}</li>`).join('');
    return `<article class="card${isTrigger ? ' trigger-card' : ''}" data-search="${escapeHtml(`${node.label} ${node.attributes.join(' ')}`.toLowerCase())}">
        <div class="card-heading"><span class="type-dot${isTrigger ? ' trigger-dot' : ''}"></span><span class="type-label">${isTrigger ? 'TRIGGER' : 'TABLA'}</span></div>
        <h2>${escapeHtml(node.label)}</h2>
        <ul>${attributes}</ul>
    </article>`;
}).join('');

const relationships = data.relationships.map((relationship) => `<article class="relation" data-search="${escapeHtml(`${relationship.from} ${relationship.to} ${relationship.label}`.toLowerCase())}">
    <span class="relation-from">${escapeHtml(relationship.from)}</span>
    <span class="relation-arrow" aria-hidden="true">→</span>
    <span class="relation-to">${escapeHtml(relationship.to)}</span>
    <span class="relation-kind">${escapeHtml(relationship.label)}</span>
</article>`).join('');

const htmlContent = `<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#101827">
    <title>${escapeHtml(data.meta.title)} | Archify</title>
    <style>
        :root {
            color-scheme: light;
            --ink: #182235;
            --muted: #738096;
            --line: #e7ebf2;
            --paper: #ffffff;
            --canvas: #f4f6fa;
            --accent: #6658e8;
            --accent-soft: #f0efff;
            --mint: #d9f7ed;
        }
        * { box-sizing: border-box; }
        body { margin: 0; background: var(--canvas); color: var(--ink); font-family: Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; }
        .hero { position: relative; overflow: hidden; padding: 48px max(24px, calc((100% - 1180px) / 2)) 42px; color: #fff; background: radial-gradient(ellipse at 82% 0%, rgba(128, 113, 255, .55), transparent 38%), linear-gradient(122deg, #101827 0%, #1d2940 58%, #2c3160 100%); }
        .hero::after { position: absolute; right: 8%; bottom: -120px; width: 290px; height: 290px; border: 1px solid rgba(255,255,255,.13); border-radius: 50%; content: ""; box-shadow: 0 0 0 35px rgba(255,255,255,.025), 0 0 0 70px rgba(255,255,255,.02); }
        .hero-inner { position: relative; z-index: 1; max-width: 1180px; margin: 0 auto; }
        .brand { display: inline-flex; align-items: center; gap: 9px; margin-bottom: 27px; color: #c9c5ff; font-size: .78rem; font-weight: 750; letter-spacing: .14em; text-transform: uppercase; }
        .brand-mark { display: grid; width: 27px; height: 27px; place-items: center; border: 1px solid rgba(255,255,255,.25); border-radius: 8px; background: rgba(255,255,255,.1); color: #fff; font-size: .9rem; }
        .eyebrow { margin: 0 0 10px; color: #a8b3c8; font-size: .82rem; font-weight: 650; letter-spacing: .09em; text-transform: uppercase; }
        h1 { max-width: 780px; margin: 0; font-size: clamp(2rem, 5vw, 3.35rem); font-weight: 760; letter-spacing: -.045em; line-height: 1.08; }
        .subtitle { max-width: 760px; margin: 16px 0 0; color: #c1cada; font-size: 1rem; line-height: 1.65; }
        .summary { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 26px; }
        .summary span { padding: 8px 12px; border: 1px solid rgba(255,255,255,.14); border-radius: 999px; background: rgba(255,255,255,.07); color: #e7eafd; font-size: .8rem; }
        main { max-width: 1180px; margin: 0 auto; padding: 30px 24px 64px; }
        .toolbar { display: flex; align-items: center; justify-content: space-between; gap: 18px; margin: 0 0 28px; }
        .toolbar-copy { color: var(--muted); font-size: .9rem; }
        .search-wrap { position: relative; width: min(100%, 360px); }
        .search-wrap::before { position: absolute; top: 50%; left: 15px; color: #8b95a7; content: "⌕"; font-size: 1.3rem; transform: translateY(-55%); }
        .search { width: 100%; padding: 12px 15px 12px 42px; border: 1px solid #dfe4ed; border-radius: 12px; outline: none; background: #fff; color: var(--ink); font: inherit; box-shadow: 0 3px 12px rgba(26,39,64,.04); }
        .search:focus { border-color: #9188f3; box-shadow: 0 0 0 4px rgba(102,88,232,.12); }
        .section-title { display: flex; align-items: end; justify-content: space-between; gap: 12px; margin: 34px 0 16px; }
        .section-title h2 { margin: 0; font-size: 1.3rem; letter-spacing: -.025em; }
        .section-title p { margin: 0; color: var(--muted); font-size: .84rem; }
        .grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(min(100%, 300px), 1fr)); gap: 16px; }
        .card { min-width: 0; padding: 20px; border: 1px solid var(--line); border-radius: 16px; background: var(--paper); box-shadow: 0 5px 20px rgba(24,34,53,.045); transition: transform .18s ease, box-shadow .18s ease, border-color .18s ease; }
        .card:hover { transform: translateY(-3px); border-color: #d5d1ff; box-shadow: 0 12px 28px rgba(24,34,53,.09); }
        .card-heading { display: flex; align-items: center; gap: 7px; color: var(--muted); font-size: .67rem; font-weight: 750; letter-spacing: .12em; }
        .type-dot { width: 8px; height: 8px; border-radius: 50%; background: #38b68b; box-shadow: 0 0 0 3px var(--mint); }
        .trigger-dot { background: #ef9a43; box-shadow: 0 0 0 3px #fff0dc; }
        .trigger-card { border-top: 3px solid #f0a24e; }
        .card h2 { overflow-wrap: anywhere; margin: 12px 0 15px; color: #292e43; font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace; font-size: 1rem; }
        .card ul { display: grid; gap: 0; margin: 0; padding: 0; list-style: none; }
        .card li { padding: 8px 0; border-top: 1px solid #f0f2f6; color: #5b6577; font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace; font-size: .78rem; line-height: 1.5; overflow-wrap: anywhere; }
        .card li:first-child { border-top: 0; }
        .relations { display: grid; grid-template-columns: repeat(auto-fill, minmax(min(100%, 340px), 1fr)); gap: 10px; }
        .relation { display: grid; grid-template-columns: minmax(0,1fr) auto minmax(0,1fr) auto; align-items: center; gap: 9px; min-width: 0; padding: 13px 14px; border: 1px solid var(--line); border-radius: 12px; background: #fff; }
        .relation-from, .relation-to { overflow: hidden; color: #47536a; font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace; font-size: .73rem; text-overflow: ellipsis; white-space: nowrap; }
        .relation-arrow { color: var(--accent); font-weight: 800; }
        .relation-kind { padding: 4px 7px; border-radius: 6px; background: var(--accent-soft); color: #574bc4; font-size: .68rem; font-weight: 750; white-space: nowrap; }
        .empty { display: none; padding: 25px; border: 1px dashed #d8ddea; border-radius: 14px; color: var(--muted); text-align: center; }
        .footer { margin-top: 42px; padding-top: 18px; border-top: 1px solid var(--line); color: #8993a4; font-size: .78rem; }
        [hidden] { display: none !important; }
        @media (max-width: 640px) { .hero { padding: 32px 20px 30px; } main { padding: 24px 16px 48px; } .toolbar { align-items: stretch; flex-direction: column; } .search-wrap { width: 100%; } .section-title { align-items: start; flex-direction: column; } .relation { grid-template-columns: minmax(0,1fr) auto minmax(0,1fr); } .relation-kind { grid-column: 1 / -1; justify-self: start; } }
        @media (prefers-reduced-motion: reduce) { *, *::before, *::after { scroll-behavior: auto !important; transition: none !important; } }
    </style>
</head>
<body>
    <header class="hero">
        <div class="hero-inner">
            <div class="brand"><span class="brand-mark">A</span> Archify · Data catalog</div>
            <p class="eyebrow">Diccionario de base de datos</p>
            <h1>${escapeHtml(data.meta.title)}</h1>
            <p class="subtitle">${escapeHtml(data.meta.description)}</p>
            <div class="summary"><span>${data.nodes.length} tablas y triggers</span><span>${data.relationships.length} relaciones</span><span>Esquema ${escapeHtml(data.schema_version || '1.0')}</span></div>
        </div>
    </header>
    <main>
        <div class="toolbar">
            <div class="toolbar-copy">Explora las entidades, atributos y conexiones del esquema.</div>
            <label class="search-wrap"><span hidden>Buscar en el diccionario</span><input id="search" class="search" type="search" placeholder="Buscar tabla, campo o relación…" autocomplete="off"></label>
        </div>
        <section aria-labelledby="entities-title">
            <div class="section-title"><h2 id="entities-title">Entidades del esquema</h2><p>Campos, tipos de datos y automatizaciones</p></div>
            <div id="cards" class="grid">${cards}</div>
            <p id="empty-cards" class="empty">No se encontraron entidades.</p>
        </section>
        <section aria-labelledby="relations-title">
            <div class="section-title"><h2 id="relations-title">Relaciones</h2><p>Referencias y cardinalidad</p></div>
            <div id="relations" class="relations">${relationships}</div>
            <p id="empty-relations" class="empty">No se encontraron relaciones.</p>
        </section>
        <footer class="footer">Generado automáticamente desde el esquema de datos de Archify.</footer>
    </main>
    <script>
        const searchInput = document.getElementById('search');
        const filterItems = (selector, emptyId, query) => {
            const items = Array.from(document.querySelectorAll(selector));
            let visible = 0;
            items.forEach((item) => {
                const matches = item.dataset.search.includes(query);
                item.hidden = !matches;
                if (matches) visible += 1;
            });
            document.getElementById(emptyId).style.display = visible ? 'none' : 'block';
        };
        searchInput.addEventListener('input', () => {
            const query = searchInput.value.trim().toLowerCase();
            filterItems('.card', 'empty-cards', query);
            filterItems('.relation', 'empty-relations', query);
        });
    </script>
</body>
</html>`;

fs.writeFileSync(path.join(baseDir, 'diccionario_db_test_7b.html'), htmlContent, 'utf8');
console.log('✅ Archivo diccionario_db_test_7b.html generado con éxito.');