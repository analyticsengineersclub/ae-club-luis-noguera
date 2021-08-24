WITH 

customers AS (SELECT * FROM `analytics-engineers-club.coffee_shop.customers`),

orders AS (SELECT * FROM `analytics-engineers-club.coffee_shop.orders`),

final AS 
( 
    SELECT 
        customers.customer_id AS customer_id
        , customers.name AS customer_name
        , customers.email AS customer_email
        , MIN(orders.created_at) AS first_order_at
        , COUNT(*) AS number_of_orders
    FROM 
        customers AS c
    JOIN 
        orders AS co
    ON 
        c.id = co.customer_id
    GROUP BY 1, 2, 3
    ORDER BY first_order_at
    LIMIT 5
)

SELECT * FROM final
