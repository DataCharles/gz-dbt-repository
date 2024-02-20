select
    *,
    (sales.quantity * product.purchase_price) as purchase_cost,
    ROUND((sales.revenue - product.purchase_price) / sales.revenue, 2) as margin
from {{ ref("stg_raw__sales") }} as sales
inner join
    {{ ref("stg_raw__product") }} as product USING (products_id)
