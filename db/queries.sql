-- nearest neighbor
SELECT id, ST_AsText(polygon),  ST_Distance(polygon, 'POINT (2.664372681653651 48.46256587245519)'::geometry) as distance
FROM boulders
ORDER BY distance ASC