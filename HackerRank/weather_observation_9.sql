SELECT DISTINCT city
FROM station
WHERE LOWER(city) NOT LIKE 'a%'
  AND LOWER(city) NOT LIKE 'e%'
  AND LOWER(city) NOT LIKE 'i%'
  AND LOWER(city) NOT LIKE 'o%'
  AND LOWER(city) NOT LIKE 'u%';
