-- Minu esimene UrbanStyle paring
-- Nimi: Kiira Ottoson
-- Kuupaev: 20.06.2026

-- Loo meeskonnaliikmete tabel
CREATE TABLE IF NOT EXISTS team_members (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(100),
    week INT DEFAULT 0,
    joined_at TIMESTAMP DEFAULT NOW()
);

-- Lisa oma andmed (asenda oma nimega!)
INSERT INTO team_members (name, role, week)
VALUES ('Sinu Nimi', 'Andmeanalüütik', 0);

-- Vaata tulemust
SELECT * FROM team_members ORDER BY joined_at;
