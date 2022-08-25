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


select 
    *
from
    cidade
inner JOIN
    restaurantes on cidade.id_cidade = restaurantes.id_cidade
where
    restaurantes.nome = 'Frangao';