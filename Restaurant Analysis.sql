use sqlps44;
create table restaurants5(restaurant_id int primary key,restaurant_name varchar(100) not null,cuisine_type varchar(50),address varchar(255),phone varchar(20));
select * from restaurants5;
desc restaurants5;
drop table restaurants;
insert into restaurants5(restaurant_id,restaurant_name,cuisine_type,address,phone)
value(1,'pasta palace','italian','123 Main St','5551234567'),
(2,'taco time','mexican','456 Elm St','5559876543'),
     (3,'burger barn','american','789 oak St','5557891234');
create table menutable5(item_id int primary key,restaurant_id int,item_name varchar(100) not null,description varchar(255),price decimal(10,2),
foreign key(restaurant_id) references restaurants5(restaurant_id));
desc menutable5;
drop table menutable;
select * from menutable5;
insert into menutable5(item_id,restaurant_id,item_name,description,price)
value(101,1,'spaghetti carnobora','pasta with eggs','12.99'),
(102,1,'margherita pizza','classic pizza with tomato','14.99'),
(103,2,'taco combo','assorted tacos with sides','9.99'),
(104,2,'quesadilia','çheese-filled tortilia','8.99'),
(105,3,'classic burger','beef patty with letture','10.99');
create table orders5(order_id int primary key,item_id int,customer_name varchar(100) not null,delivery_address varchar(255),order_date date,total_amt decimal(10,2),
foreign key (item_id) references menutable5(item_id));
drop table orders;
insert into orders5(order_id,item_id,customer_name,delivery_address,order_date,total_amt)
values(201,101,'john doe','123 main st','2024-04-15','12.99'),
(202,103,'jane smith','456 eim st','2024-04-16','9.99'),
(203,105,'alice johnson','780 oak st','2024-04-17','10.99'),
(204,101,'john doe','123 main st','2024-04-18','12.99'),
(205,104,'jane smith','456 eim st','2024-04-19','9.99');

-- qs1 retrieve all resto offering itailian cuisine
select * from restaurants5 where cuisine_type='italian';
-- qs2 list all menu items with prices for specific restauarant

-- qs3 calculate total revenue generated from orders placed in last month
select sum(total_amt) from orders5 where month(order_date)=4;
-- qs4 update the description of a specific menu item
update menutable5 set description='pasta with tomato' where item_id=102;
set sql_safe_updates=0;
-- qs5 identify the top-selling items based on number of orders
select m.item_name, count(o.order_id) as no_of_orders from menutable5 as m join orders5 as o using(item_id) group by m.item_name order by count(o.order_id)desc;
-- qs6 retrive the list of orders delivered to a specific address
select o.order_id,m.item_name,o.delivery_address from orders5 as o join menutable5 as m on m.item_id=o.item_id;

-- qs9 retrive total number of orders placed by each customer
select * from menutable5 cross join orders5;







