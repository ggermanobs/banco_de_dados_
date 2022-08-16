USE sakila;

SET @ID_CUSTOMER_SELECTED = (select 
    customer.customer_id 
FROM 
    customer
WHERE customer.email = 'KIM.CRUZ@sakilacustomer.org');

SELECT @ID_CUSTOMER_SELECTED AS 'ID_CUSTOMER_SELECTED';


select 
    inventory
from 
    inventory
where 
    inventory.inventory_id in (
        select  
            rental.inventory_id
        from
            rental
        where
            rental.customer_id = @ID_CUSTOMER_SELECTED        
);

select 
   film_id
from 
    film
where 
    film_id in (
    select 
        inventory.film_id
    from
        inventory
    where        
        inventory.inventory_id in(
        select  
            rental.inventory_id
        from
            rental
        where
            rental.customer_id = @ID_CUSTOMER_SELECTED  
    ) 
    );
select 
    actor.first_name,
    actor.last_name
from
    actor
where
    actor_id in (
        select 
            actor_id
        from 
            film
        where 
            film_id in (
                select 
                    inventory.film_id
                from
                    inventory
                where        
                    inventory.inventory_id in(
                    select  
                        rental.inventory_id
                    from
                        rental
                    where
                        rental.customer_id = @ID_CUSTOMER_SELECTED  
                    ) 
                )
        );