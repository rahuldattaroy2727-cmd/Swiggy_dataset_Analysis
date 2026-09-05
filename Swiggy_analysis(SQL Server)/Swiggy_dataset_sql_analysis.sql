--select all columns from the restaurant table.
select *
from restaurants

--2. Display the names and cities of all restaurants.
select name,city
from restaurants


--3. Find all restaurants located in Bangalore.
select name,
city
from restaurants
where city  = 'Bangalore'

--4. List the names and ratings of restaurants with a rating greater than 4.0.

select name,rating
from restaurants
where rating > 4.0
--5. Find restaurants where the cost is less than or equal to 300.
select name
from restaurants
where cost <= 300

--6. Display all distinct cuisine types available in the dataset.
select distinct cuisine
from restaurants

--7. Find all restaurants serving Biryani cuisine.
select name,cuisine
from restaurants
where cuisine = 'Biryani'

--8. Show the top 5 restaurants with the highest ratings.
select top 5 name,rating
from restaurants
order by rating DESC

--------------------------------------------------------
--Insights:
--The highest ratings was 5  for many resturants 
--what it has been observed that resturant Gelato Vinto have three resturants with rating 5
-- others  are Bronies and Lassi pub 
-- As many resturants have same rating  that is 5 we can filter by rating to find out the highest rated resturants
---------------------------------------------------------------------------------------------------------------------


--SELECT NAME ,RATING 
--FROM RESTAURANTS 
--ORDER BY RATING DESC LIMIT 1, offsets 2

--9. List restaurants with a rating count greater than 1000.
select name, rating_count
from restaurants
where rating_count > 1000

-------------------------
--Insights:
--In total there are 113 resturants with rating count  greater than 1000

--10. Count the total number of restaurants in the dataset.
select 
count(*) as Num_resturants
from restaurants
-----------------------------------------------------------
--Insights:
--In total there are 61425 resturants in the dataset 
-----------------------------------------------------------

-----------------------------------------------------------
--11. Find the average cost of all restaurants.
-----------------------------------------------------------
select 
avg(cost) as avg_cost
from restaurants
where cost >50
-------------------------------------------------------------
--Insights:
-- The average cost of all resturants are ₹298.00
-- we have filtered the cost greater than 50 to avoid outliers in the dataset
-------------------------------------------------------------

--12. Display restaurant names and costs ordered by cost in ascending order.
select name,cost
from restaurants
order by cost 


--13. Find the average rating of restaurants for each city.
SELECT city ,
avg(rating)avg_rating
from restaurants
group by city
order by avg(rating) desc
-----------------------------------------------------------
--Insights:
---we  sorted the ratings in decesnding order to find out the city with higest average rating of resturants
--Chopda is the city where average rating is 4.82 . followed by kumta with 4.80 ,Kadayanallur with 4.52 ,dhabad with 4.40
-- Fatehgarh-sahib with 4.34 and so on
-----------------------------------------------------------
--14. Count the number of restaurants available in each city.
------------------------------------------------------------
select city,
count(*) number_of_resturants
from restaurants
group by city
order by count(*) desc
-------------------------------------------------------------
--Insights:
--we  sorted the counts in decesnding order to find out the city with higest number of resturants
-- Bangalore has the higest number of resturants with 6580 returants ,followed by chennai with 4849 , then deli with 4592 ,
--Hyderabad with 4489 and pune with 3765 and so on
--------------------------------------------------------------

-----------------------------------------------------------------------
--15. Find the maximum and minimum cost of restaurants for each cuisine.
-----------------------------------------------------------------------
select 
cuisine,
max(cost)AS Max_cost,
min(cost)As Min_cost
from restaurants
group by cuisine
----------------------------------------------------------------------------


--16. List cuisines that have more than 10 restaurants.
select cuisine,
count(name) no_of_resturants
from restaurants
group by cuisine
having count(name)>10

--17. Find the top 3 cities with the highest number of restaurants.
select top 3 city,
count(*) as number_of_resturants
from restaurants
group by city
order by count(*) DESC 

----------------------------------------------------------------
--Insights:
-- Bangalore ,chennai and delhi are the top 3 citiies with highest number of resturants . Bangalore sits at the top with 6580
--resturants
-----------------------------------------------------------------

-----------------------------------------------------------------
--18. Display the average cost of restaurants for each cuisine.
------------------------------------------------------------------
select cuisine,
avg(cost)
from restaurants
group by cuisine


--19. Find cities where the average restaurant rating is greater than 4.0.
select city,
round(avg(rating),1)
from restaurants
group by city
having round(avg(rating),1) > 4.0

--20. List restaurants whose cost is higher than the average cost of all restaurants.
    select *
    from
    (select name,
    cost,
    avg(cost)over() as average_cost
    from restaurants)t
    where cost > average_cost

--21. Find the total number of ratings (rating_count) for each city.
select city,
sum(rating_count) as total_rating_count
from restaurants
GROUP BY city

--22. Display cuisines ordered by their average rating in descending order.
SELECT cuisine,
round(avg(rating),2) as avg_rating 
from restaurants
group by cuisine
ORDER BY round(avg(rating),2) desc
----------------------------------------------------------------------------
--Insights:
--The highest rated cusinee  is paan category , followed by greek,south american ,ice crea, , british  french ,sushi , keo 
--persian  , tribal and the list goes on.
------------------------------------------------------------------------------

--23. Find restaurants that have the highest rating within their city.
select *
from
(SELECT name,
rating,
city ,
rating_count,
DENSE_RANK()over(PARTITION BY city ORDER BY rating desc)dn
from restaurants)t
where dn = 1 

--24. List cities that have more than one cuisine type available.
select city,
count(cuisine)no_of_cuisine_avaiable
from restaurants
GROUP BY city
having count(cuisine) > 1

--25. Find the restaurant(s) with the maximum rating_count in the dataset.
select *
from
(SELECT  name, rating_count,
DENSE_RANK() over (order by rating_count desc)dn
FROM restaurants
)T

where  dn =1

-------------------------subqueries-----------------------------

-- 1. Which restaurant of delhi is visited by least number of people?

SELECT name,
rating_count
from restaurants
where city = 'Delhi'
order by rating_count asc
---------------------------------------------------------------------
--Several restaurants in Delhi have the lowest observed rating count of 20. Since multiple restaurants share this minimum value, 
--there is no single restaurant that can be identified as the least visited based on the available data. Furthermore, rating_count represents 
--the number of ratings rather than actual visits or orders, 
--so it should only be considered a proxy for customer engagement.

---------------------------------------------------------------------

-- 2. Which restaurant has generated maximum revenue all over india?



select *
from
(select name,
(cast(rating_count as int) * cost) as revenue
from restaurants)t
order by revenue desc

SELECT name , cost*rating_count AS revenue 
FROM restaurants WHERE cost*rating_count = (SELECT MAX(cost*rating_count) FROM restaurants ) 


-- 3. How many restaurants are having rating more than the average rating?

    select count(*)
    from
    (select name,
    rating,
    avg(rating)over() as average_rating
    from restaurants)t
    where rating > average_rating

--Select count(*)
--from restaurants
---------------------------------------------------------
--Insights:
--In total there are 36722 resturants with rating more than the average rating .    

------------------------------------------------------------------------
-- 4. Which restaurant of Delhi has generated most revenue?
with b as (select name,city,
(cast(rating_count as int) * cost) as revenue
from restaurants)

select *
from b
where city = 'Delhi'
order by revenue desc
----------------------------------------------------------------------
--Insights:
--Gulab wala  have genretated  the most revenue in delhi with ₹17,50,000.00 folloed by Fullon punjab with ₹15,00,0000.00
--then just punjabi with ₹15,00,000.00, another branch of gulab wala with ₹12,50,000.00 , Theobroma with ₹8,00,000 and the list
--goes on

-- 5. Which restaurant chain has maximum number of restaurants?

select name ,count( *) as number_o_resturants
from restaurants
group by name
order by count(*)desc


----------------------------------------------------------------
--Insights:
--Domino's pizza is a qsr with maximum number of chains in india with 409 ,followed by pizza hut with 318,
-- then kfc with 306, kwality walls with 236 ans baskin robbins with 228 


-- 6. Which restaurant chain has generated maximum revenue?

with chicken as (select name ,
(sum(cast(rating_count as int) * cost)) as revenue
from restaurants
group by name 
)


select top 1 name,
revenue
from chicken
order by revenue desc
----------------------------------------------------------------
--McDonald's have generated the maximum revenue of ₹5,05,70,000 or 5.05 crore(combined)
--There is a possiblity of greater footfall in the resturant
-----------------------------------------------------------------
--7. Which city has maximum number of restaurants?
select top 1 city,
count(*)
FROM restaurants
group by city
order by COUNT(*)desc
---------------------------------------------------
--Insights:
--Bangalore has the madximum  number of resturants with 6580 .


-- 8. Which city has generated maximum revenue all over india?
select top 1 city,
sum(cast(rating_count as int) * cost )as revenue
from restaurants
group by city
ORDER BY sum(cast(rating_count as int) * cost ) desc
---------------------------------------------------------------
--Insights:
--Hyderabad has generated ₹40,12,95,710.00 in revenue which is higest all over india . shows that even with less number of
--resturants  than bangalore and some cities , it can  generate more revenue .
-- there can be some factors contibuting to this like footfall,cost of the food items,popularity of the resturants and so on
---------------------------------------------------------------



-- 9. List 10 least expensive cuisines?
select top 10 cuisine,avg(cost)as avg_cost
from restaurants
group by cuisine
order by avg(cost) asc
--------------------------------------------------
--Insights:
--Paan ,chaat,juices,African ,Bangladeshi,khasi,home food are some categories which are least expensive .
--------------------------------------------------
-- 10. List 10 most expensive cuisines?
select top 10 cuisine,avg(cost)as avg_cost
from restaurants
group by cuisine
order by avg(cost) DESC
-------------------------------------------------
--Insights:
--Malaysian , Tribal,Greek.steakhouse,japanese ,korean,persian ,vietnamese and japanese(sushi) are the most expesive categories 
--considering the average cost of the food
--------------------------------------------------


---- 11. What is the city is having Biryani as most popular cuisine
select city,
count(cuisine)
from restaurants
where cuisine = 'Biryani'
group by city
ORDER BY count(cuisine) desc
----------------------------------------------------------------
--Indights:
--Bangalore is the city where Biriyani is most popular cuisine with 609 resturants.
-----------------------------------------------------------------


--------------------------------------------------------------------
-- 12. List top 10 unique restaurants with unique name only throughout the dataset as 
--per generate maximum revenue (Single restaurant with that name)
---------------------------------------------------------------------
select top 10 name
from
(select  name,
cost,rating_count,cost*cast(rating_count as int) as revenue,
row_number()over(partition by name order by (cost*cast(rating_count as int)) desc)as rn
from restaurants
)t
where rn= 1
order by revenue desc   
--------------------------------------------------
--Insights:
--The top 10 resturants with unique name which have generated maximum revenue  are Capital Multi Cuisine Restaurant
--Zaitoon
--Meridian Restaurant
--Mujtaba Grill
--Eaters Stop
--Shah Ghouse Cafe & Restaurant
--Grand Hotel
--Have More Restaurant
--Lucky Restaurant
--Mehfil