select * from orders o

select * from returns r

select * from people p

select SUM(sales) as Total_Sales
from orders o
left join returns r on o.order_id = r.order_id 
where returned is null;

select SUM(profit) as Total_Profit
from orders o
left join returns r on o.order_id = r.order_id 
where returned is null;

select round(SUM(profit)*100/SUM(sales),2) as Profit_Ratio
from orders o
left join returns r on o.order_id = r.order_id 
where returned is null;

select o.order_id, sum(profit) as Profit_per_Order
from orders o
left join returns r on o.order_id = r.order_id 
where returned is null
group by o.order_id;

select customer_name, sum(sales) as Sales_per_Customer
FROM orders o
left join returns r on o.order_id = r.order_id 
where returned is null
group by customer_id, customer_name

select extract(year FROM order_date)::text || '-' || LPAD(extract(month FROM order_date)::text, 2, '0') AS year_month,
	segment,
	sum(sales) as Monthly_Sales_By_Segment
from orders o
left join returns r on o.order_id = r.order_id 
where returned is null
group by year_month, segment

select extract(year FROM order_date)::text || '-' || LPAD(extract(month FROM order_date)::text, 2, '0') AS year_month,
	category,
	sum(sales) as Monthly_Sales_By_Category
from orders o
left join returns r on o.order_id = r.order_id 
where returned is null
group by year_month, category

select extract(year FROM order_date)::text || '-' || LPAD(extract(QUARTER FROM order_date)::text, 2, '0') AS year_quarter,
category,
sum(sales) as Quartet_Sales_By_Category
from orders o
left join returns r on o.order_id = r.order_id 
where returned is null
group by year_quarter, category

select customer_name, SUM(sales) as Total_Sales, SUM(profit) as Total_Profit
from orders o
left join returns r on o.order_id = r.order_id 
where returned is null
group by customer_name
order by Total_Profit desc

select region, round(SUM(sales),3) as Total_Sales
from orders o
left join returns r on o.order_id = r.order_id 
where returned is null
group by region
order by Total_Sales desc
