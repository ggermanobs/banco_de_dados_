/*

Select "Specific select on customer table" as "INFO";

select customer.customer_id, customer.first_name, customer.last_name, customer.active from customer limit 15;

Select "select some specific people " as "INFO";

select customer.customer_id, customer.first_name, customer.last_name, customer.active from customer where customer.first_name = "MARY" or customer.first_name = "PATRICIA" limit 15;

Select "Select some specific people with and that works " as "INFO";

select customer.customer_id, customer.first_name, customer.last_name, customer.active from customer where customer.first_name = "WADE" and customer.email = "WADE.DELVALLE@sakilacustomer.org" limit 15;

Select "Specific selects of films table" as "INFO";



select 
    film.rating,
    film.title, 
    film.description, 
    film.length,
    film.language_id,
    film.release_year 
from 
    film 
where 
(film.release_year > 2000 and film.release_year < 2010) and 
(film.length > 70 and film.length < 80) and 
(film.language_id = 1 or film.language_id = 5) and
(film.rating = "G" or film.rating = "R" or film.rating = "NC-17")
limit 40;

Select "USO OF IN" as "INFO"; --parecido com o OR porem menos eficiente

select
    film.rating,
    film.title, 
    film.description, 
    film.length,
    film.language_id,
    film.release_year 
from 
    film 
where 
(film.release_year > 2000 and film.release_year < 2010) and 
(film.length > 70 and film.length < 80) and
(film.language_id in (1,5)) and
(film.rating in ("G","R","NC-17"))
limit 40;

Select "USO OF BETWEEN" as "INFO"; --UM VALOR ENTRE O OUTRO 

select
    film.rating,
    film.title, 
    film.description, 
    film.length,
    film.language_id,
    film.release_year 
from 
    film 
where 
(film.release_year BETWEEN 2000 AND 2010) and 
(film.length  BETWEEN 70 AND 80) and
(film.language_id in (1,5)) and
(film.rating in ("G","R","NC-17"))
limit 40; 

*/

Select "INTRODUCTION TO SUB QUERY" as "INFO"; --um select dentro do outro...

select
    film.rating,
    film.title, 
    film.description, 
    film.length,
    film.language_id,
    film.release_year 
from 
    film 
where 
(film.release_year BETWEEN 2000 AND 2010) and 
(film.length  BETWEEN 70 AND 80) and
(film.language_id IN 
(
    (
    SELECT 
        language_id 
    from 
        language 
    where 
        name = "English"
    ),
    (
     SELECT 
        language_id 
    from 
        language 
    where 
        name = "French"   
    )
        )
            ) 
        and
    (film.rating in ("G","R","NC-17"))
    order by film.language_id 
    DESC 
limit 40;

Select 
    "INTRODUCTION TO SUB QUERY WITH VARIABLE" --usando variaveis para armazenar informações com uma query
as 
    "INFO";

SET @french_id = (select
    language_id
from
    language
where
    name = "French"        
);

SET @english_id = (select
    language_id
from
    language
where
    name = "English"        
);

SET @italian_id = (select
    language_id
from
    language
where
    name = "Italian"        
); 

select
    film.rating,
    film.title, 
    film.description, 
    film.length,
    film.language_id,
    film.release_year 
from 
    film
where
    (film.release_year BETWEEN 2000 and 2010) and
    (film.length BETWEEN 70 and 80) and
    (film.language_id in (@french_id,@english_id,@italian_id)) and
    (film.rating in ("G","R","NC-17"))
order by
    film.language_id
desc
limit 40;

