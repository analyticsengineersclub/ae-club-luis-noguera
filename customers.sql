WITH 

customers AS (SELECT * FROM `analytics-engineers-club.coffee_shop.customers`),

orders AS (SELECT * FROM `analytics-engineers-club.coffee_shop.orders`),

final AS 
( 
    SELECT 
        customer_id
        , name
        , email
        , MIN(created_at) AS first_order_at
        , COUNT(*) AS number_of_orders 
    FROM 
        customers 
    JOIN 
        orders 
    ON 
        customers.id = orders.customer_id
    GROUP BY 1, 2, 3
    ORDER BY first_order_at
    LIMIT 5
)

SELECT * FROM final
