cat << 'EOF' > build_dict.js
const fs = require('fs');

const data = JSON.parse(fs.readFileSync('archify_db.json', 'utf8'));

const htmlContent = `<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${data.meta.title}</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; background-color: #f8f9fa; color: #212529; margin: 0; padding: 20px; }
        h1 { color: #0d6efd; margin-bottom: 5px; }
        p.subtitle { color: #6c757d; margin-bottom: 25px; }
        .container { display: grid; grid-template-columns: repeat(auto-fill, minmax(350px, 1fr)); gap: 20px; }
        .card { background: #ffffff; border: 1px solid #dee2e6; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); padding: 15px; }
        .card h2 { margin-top: 0; font-size: 1.15rem; color: #198754; border-bottom: 2px solid #198754; padding-bottom: 5px; }
        ul { list-style-type: none; padding-left: 0; margin: 0; }
        li { font-family: monospace; font-size: 0.9rem; padding: 4px 0; border-bottom: 1px dashed #e9ecef; }
        li:last-child { border-bottom: none; }
        .rel-section { margin-top: 30px; background: #ffffff; border: 1px solid #dee2e6; border-radius: 8px; padding: 15px; }
        .rel-section h2 { margin-top: 0; font-size: 1.15rem; color: #0d6efd; border-bottom: 2px solid #0d6efd; padding-bottom: 5px; }
        .rel-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 10px; }
        .rel-item { background: #f1f3f5; padding: 8px; border-radius: 4px; font-family: monospace; font-size: 0.85rem; }
    </style>
</head>
<body>
    <h1>${data.meta.title}</h1>
    <p class="subtitle">Base de datos: ${data.meta.description}</p>
    
    <div class="container">
        ${data.nodes.map(node => `
            <div class="card">
                <h2>${node.label}</h2>
                <ul>
                    ${node.attributes.map(attr => `<li>${attr}</li>`).join('')}
                </ul>
            </div>
        `).join('')}
    </div>

    <div class="rel-section">
        <h2>Relaciones (Cardinalidad)</h2>
        <div class="rel-grid">
            ${data.relationships.map(rel => `
                <div class="rel-item">
                    <strong>${rel.from}</strong> ➔ <strong>${rel.to}</strong> (${rel.label})
                </div>
            `).join('')}
        </div>
    </div>
</body>
</html>`;

fs.writeFileSync('diccionario_db_test_7b.html', htmlContent);
console.log('✅ Archivo diccionario_db_test_7b.html generado con éxito.');
EOF