use ClossUsedCarSales
-- This Database Project was Started and Completed by Grayson Closs, with no Help from Anyone Else.
-- total amount that has been spent on purchasing cars
select sum(cast(cost as float)) as [Total Spent]
from imports 
where cost > 0
order by [Total Spent]
-- sorting the inventory by make and model
select * from (select *, case 
when Make = 'Hyundai' then 1 
when Model = 'Sonota' then 1 
else 0 end as Found
from Imports)s
where Found = 1
-- finding out if the current customer qualifys for the employee discount
select * from (select e.EmployeeID, e.FirstName, e.LastName, case when e.FirstName = c.FirstName and e.LastName = c.LastName then 'True' else Null end as [Employee Discount]
from Employees as e cross join Customers as c)s
where [Employee Discount] is not null
-- finding out what is being repaired
select i.Make + ' ' + i.Model as [Being Repaired]
from Imports as i right join VehicleType as v on i.ImportID = v.ImportID right join Repairs as r on v.VehicleID = r.VehicleID
order by Make
-- figuring out the profit after selling a car
select s.SalePrice, i.Cost, case when s.saleprice > 0 then s.saleprice - i.cost end as Profit
from Sale as s left join VehicleType as v ON s.VehicleID = v.VehicleID  join Imports as i ON v.ImportID = i.ImportID
where i.Cost > 0 and s.SalePrice > 0  