-- NÄDAL: 1          MEESKOND: Turundus         ROLL: B - kliendiandmete uurija (Kiira)
-- ========================================================================================

-- Toomas tahab teada, millised kliendid on UrbanStyle'i andmebaasis.
-- TABEL: Customers
-- KÜSIMUSED:
-- mitu klienti on kokku? 
-- Millised linnad on esindatud? 
-- Millal kliendid registreerusid?
-- Kas on duplikaatseid e-maile? 

-- mitu klienti on kokku?
-- 3150 klienti kokku
SELECT 
  COUNT (*) as kliente_kokku
FROM customers;

-- too välja esimesed 10 rida
SELECT * FROM customers LIMIT 10;

-- millised linnad on esindatud? 
-- Andmetes on linnad olemas kuid linnade nimedes esineb ebaühtlane kirjapilt. Sama linn esineb erinevate kirjapiltidega (suur-/väiketähed, alguses tühikud), mistõttu ei saa linnade jaotust usaldusväärselt analüüsida ilma andmeid puhastamata. Seetõttu võib DISTINCT näidata sama linna mitme erineva väärtusena.
SELECT DISTINCT city FROM customers
ORDER BY city ASC;

-- milliseid "Tallinna" erinevaid kirjapilte üldse eksisteerib?
SELECT DISTINCT city
FROM customers
WHERE city LIKE '%allinn%' OR city LIKE '%ALLINN%';

-- filtreeri kindla linna kliendid nime järgi
SELECT * FROM customers    
WHERE city LIKE '%allinn%' OR city LIKE '%ALLINN%'
ORDER BY last_name ASC
LIMIT 10;

-- millal esimesed ja viimased kliendid registreerusid?
SELECT 
  MIN (registration_date) AS vanim,
  MAX (registration_date) AS uusim
FROM customers;    

-- mitmel kliendil on eesnimi puudu?
-- puuduvaid eesnimesid ei ole
SELECT 
  COUNT(*) - COUNT (first_name) AS puuduvad_eesnimed    
FROM customers;

-- mitmel kliendil on puudu e-mail?
-- 380 kliendil on e-mail puudu
SELECT COUNT(*) - COUNT(email) AS puuduvad_emailid
FROM customers;

-- või
SELECT COUNT(*)
FROM customers
WHERE email IS NULL;

-- KOKKUVÕTE:
-- Customers tabelis on 3150 klienti.
-- Kõigil klientidel on eesnimi olemas, kuid 380 kliendil puudub e-mail.
-- Linnade nimed on ebaühtlased. Sama linn esineb erinevate kirjapiltidega (suur-/väiketähed, alguses tühikud), mistõttu ei saa linnade jaotust usaldusväärselt analüüsida ilma andmeid puhastamata. Seetõttu võib DISTINCT näidata sama linna mitme erineva väärtusena.
-- Klientide registreerimised jäävad vahemikku 2020-01-02 kuni 2025-02-27.
