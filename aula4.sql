select 
    * 
from 
    city 
where 
    city.CountryCode = (
SELECT 
    code 
from 
    country 
where 
    country.Name = 'Afghanistan'
);