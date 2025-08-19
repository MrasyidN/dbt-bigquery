-- test singular dengan sql 

with payments as (
    select * from {{ ref('stg_stripe__payments') }}
)

select
    order_id,
    sum(amount) as total_payment
from payments
group by order_id
having total_payment < 0