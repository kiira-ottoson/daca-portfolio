-- DACA Nädal 1 — SQL Põhitõed
-- Toomas Kase raport: sales tabeli esmane uurimine
-- Eesmärk: leida duplikaadid, NULL väärtused ning suurimad/väikseimad müügid
-- Õpitud päringud: SELECT, FROM, WHERE, ORDER BY, LIMIT, DISTINCT, COUNT

-- Küsimus_1: mitu duplikaatset sale_id väärtust on?
-- Vastus: tabelis on 15234 rida, millest 5116 on sale_id duplikaadid.

SELECT
    COUNT(*) AS ridu_kokku, 
    COUNT(sale_id) AS sale_id_olemas, 
    COUNT(*) - COUNT(sale_id) AS sale_id_puudu, 
    COUNT(DISTINCT sale_id) AS unikaalseid, 
    COUNT(*) - COUNT(DISTINCT sale_id) AS duplikaate 
FROM sales;

-- Küsimus_2: too näiteid duplikaatsetest ridadest?
-- Vastus: Näiteks sale_id 2407 esineb  tabelis kahel real (id 2407 ja id 12020).

SELECT *
FROM sales
WHERE sale_id = 2407;

-- Küsimus_3: mitmel real puudub customer_id? 
-- Vastus: customer_id puudub 1487 müügi puhul.

-- Comment: puuduv customer_id tähendab, et müük ei ole seotud kindla kliendiga, näiteks külalisost või puudulik kliendiinfo. Ehk kui palju müüke ei saa kliendiga siduda.

SELECT 
    COUNT(*) as puuduv_customer_id
FROM sales
WHERE customer_id IS NULL;

-- Küsimus_4:
-- A: millised olid suurimad müügid?
-- B: millised on 10 väikseimat müüki? 
-- C: mitu müüki on null või negatiivse summaga?
-- Vastus: 
-- A: suurim müügirida oli 2170,40 eur.
-- B: väikseim müügirida oli -1405.32 eur.
-- C: kokku on 305 müügirida, mille total_price on 0 või negatiivne.

SELECT
    sale_ID, customer_id, total_price
FROM sales
ORDER BY total_price DESC
LIMIT 10;

SELECT
    sale_id,
    customer_id,
    total_price
FROM sales
ORDER BY total_price ASC
LIMIT 10;

SELECT 
    COUNT(*) as kahtlased
FROM sales
WHERE total_price <= 0;
