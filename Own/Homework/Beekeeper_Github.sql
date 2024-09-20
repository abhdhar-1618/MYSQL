SELECT * FROM actor;



WITH RankedAddresses AS (
SELECT address_id, ROW_NUMBER() OVER (ORDER BY address_id DESC) AS rn
FROM address
)
SELECT address_id
FROM RankedAddresses
WHERE rn = 2;

WITH CityAddressCount AS (
  SELECT c.city_id, c.city, COUNT(a.address_id) AS AddressCount
  FROM city c
  JOIN address a ON c.city_id = a.city_id
  GROUP BY c.city_id, c.city
  HAVING COUNT(a.address_id) > 10
  )
  SELECT AVG(AddressCount) AS AvgAddress
  FROM CityAddressCount;



