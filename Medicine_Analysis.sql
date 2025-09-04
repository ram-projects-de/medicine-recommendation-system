select count(DISTINCT brand_name) as unique_brand_name from medicine
select count(DISTINCT generic) as unique_generic from medicine
select count(DISTINCT manufacturer) as unique_manufacturer from medicine
select count(DISTINCT type) as unique_type from medicine
-- What is the association between drug classes and generics?
SELECT generic,
       SUM(CASE WHEN type = 'herbal' THEN 1 ELSE 0 END) AS herbal,
       SUM(CASE WHEN type = 'allopathic' THEN 1 ELSE 0 END) AS allopathic
FROM medicine

SELECT generic,
       SUM(CASE WHEN type = 'herbal' THEN 1 ELSE 0 END) AS herbal,
       SUM(CASE WHEN type = 'allopathic' THEN 1 ELSE 0 END) AS allopathic,
       COUNT(*) AS total_count
FROM medicine
GROUP BY generic

SELECT 
    (SELECT COUNT(*) FROM medicine WHERE type = 'herbal') AS herbal_total,
    (SELECT COUNT(*) FROM medicine WHERE type = 'allopathic') AS allopathic_total;

select DISTINCT type from medicine
-- Which generic has the highest associate number of medicines?

SELECT TOP 1 generic, COUNT(*) AS medicine_count
FROM medicine
GROUP BY generic
ORDER BY COUNT(*) DESC;

--What is the most available dosage form?
SELECT TOP 1 dosage_form, COUNT(*) AS dosage_form_count
FROM medicine
GROUP BY dosage_form
ORDER BY COUNT(*) DESC;


