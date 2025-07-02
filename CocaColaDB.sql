create database cocacola_db;
use cocacola_db;

select * from cococola;

#Q1. Detailed Regional sales performance.
select Region, Brand, sum(Units_Sold) Total_Units_Sold, sum(Total_Sales) as Total_Sales
from cococola
group by Region, Brand;


#Q2. Top 5 State with highest sales.
select c.State, sum(cc.Total_Sales) as Total_Sales
from cococola cc join country c on cc.Country_ID = c. Country_ID
group by c.State
order by Total_Sales desc
limit 5;


#Q3. Total sales revenue per product.
select Brand, sum(Total_Sales) Total_Sales
from cococola
group by Brand;


#Q4. Top 3 best selling product.
select Brand, sum(Units_Sold) as Total_Units_Sold
from cococola
group by Brand
order by Total_Units_Sold desc
limit 3;


#Q5. Which brand is the most popular by region.
select Region, Brand, sum(Units_Sold) Total_Units_Sold
from cococola
group by Brand, Region;


#Q6. Monthly sales trend for brand 'Coca-Cola'.
select Brand, Month, sum(Units_Sold) Total_Units_Sold, sum(Total_Sales) as Total_Sales
from cococola
where Brand = "Coca-Cola"
group by Month;


#Q7. Products as per their operating profit.
select Brand, sum(Operating_Profit) Total_Operating_Profit
from cococola
group by Brand
order by Total_Operating_Profit desc;


#Q8. Retailer wise sales figure.
select Retailer_ID, sum(cc.Total_Sales) as Total_Sales
from cococola cc join retailer r using (Retailer_ID)
group by cc.Retailer_ID
order by Total_Sales desc;


#Q9. What is the average selling quantity per retailer per month.
select Retailer, Month, avg(Units_Sold) as 'average selling quantity'
from cococola cc join retailer r using (Retailer_ID)
group by Retailer, Month;


#Q10. Retailers preference in terms of delivery partner.
select Retailer, Delivery_Company, count(Brand) as count
from cococola cc join retailer r using (Retailer_ID)
group by Retailer, Delivery_Company;