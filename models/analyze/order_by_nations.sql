select na.n_nationkey,na.n_name,count(distinct cust.c_custkey) no_customers 
from {{ ref('orders_raw') }} ord
inner join {{ ref('CUSTOMER_RAW') }} cust on cust.c_custkey = ord.o_custkey
inner join {{ ref('nation_raw') }} na on cust.c_nationkey=na.n_nationkey
where ord.O_ORDERDATE > (select add_months(max(O_ORDERDATE),-6) last_6_months from {{ ref('orders_raw') }})
group by na.n_nationkey,na.n_name order by  na.n_nationkey