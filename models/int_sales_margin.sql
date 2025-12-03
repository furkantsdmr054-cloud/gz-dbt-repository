SELECT
    p.product_id,
    s.date_date,
    s.orders_id,
    s.revenue,
    s.quantity,
    p.purchase_price, 
    ROUND (s.quantity*p.purchase_price,2) as purchase_cost,
    ROUND(s.revenue-s.quantity*p.purchase_price,2) as margin
FROM  {{ref("stg_gz_raw_data__raw_gz_sales")}} s
LEFT JOIN {{ref("stg_gz_raw_data__raw_gz_product")}} p
    USING (orders_id)
