const API_BASE = 'http://localhost/temple_backend/public/api/temples';

async function loadTemples() {
    try {
        const res = await fetch(API_BASE);
        if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
        const temples = await res.json();
        const list = document.getElementById('temple-list');
        list.innerHTML = '';
        temples.forEach(t => {
            const li = document.createElement('li');
            li.textContent = `${t.name} (${t.district})`;
            li.onclick = () => loadTempleDetails(t.id);
            list.appendChild(li);
        });
    } catch (err) {
        console.error(err);
        alert('Failed to load temples. Please try again later.');
    }
}

async function loadTempleDetails(id) {
    try {
        const res = await fetch(`${API_BASE}/${id}`);
        if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
        const data = await res.json();
        const poojas = data.poojas.map(p => `<li>${p.name}: ₹${p.price}</li>`).join('');
        document.getElementById('poojas').innerHTML = `<h2>${data.temple.name}</h2><ul>${poojas}</ul>`;
    } catch (err) {
        console.error(err);
        alert('Failed to load temple details.');
    }
}

loadTemples();
