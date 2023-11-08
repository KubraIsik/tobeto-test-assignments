-- PAIR 1 , SQL ODEV 2

-- 1. Stokta bulunmayan ürünlerin ürün listesiyle birlikte tedarikçilerin ismi ve iletişim numarasını 
-- (`ProductID`, `ProductName`, `CompanyName`, `Phone`) almak için bir sorgu yazın.
Select product_id, product_name, s.company_name, s.phone, units_in_stock from products p
inner join suppliers s on s.supplier_id=p.supplier_id 
where p.units_in_stock=0

-- 2. 1998 yılı mart ayındaki siparişlerimin adresi, siparişi alan çalışanın adı, çalışanın soyadı
Select ship_address, first_name, last_name, order_date from orders o 
inner join employees e on o.employee_id= e.employee_id
where order_date between  '1998-03-01' and '1998-03-31'

-- 3. 1997 yılı şubat ayında kaç siparişim var?
Select count() from orders
where order_date  between  '1997-02-01' and '1997-02-28'

-- 4. London şehrinden 1998 yılında kaç siparişim var?
Select Count(*) from orders
where order_Date between '1998-01-01' and '1998-12-31' and ship_city = 'London'

-- 5. 1997 yılında sipariş veren müşterilerimin contactname ve telefon numarası
Select c.contact_name, c.phone  from orders o
inner join customers c on c.customer_id = o.customer_id
where o.order_Date between '1997-01-01' and '1997-12-31'
group by c.contact_name, c.phone
order by c.contact_name

-- 6. Taşıma ücreti 40 üzeri olan siparişlerim
Select * from orders
where freight>40
order by freight

-- 7. Taşıma ücreti 40 ve üzeri olan siparişlerimin şehri, müşterisinin adı
Select o.ship_city, c.company_name, c.contact_name, o.freight from orders o
inner join customers c on c.customer_id = o.customer_id
where o.freight >= 40
order by o.ship_city

-- 8. 1997 yılında verilen siparişlerin tarihi, şehri, çalışan adı -soyadı ( ad soyad birleşik olacak ve büyük harf),
Select o.order_date,o.ship_city, CONCAT(UPPER(e.first_name),' - ',UPPER( e.last_name)) as employee_firstname_lastname from orders o
inner join employees e on e.employee_id = o.employee_id
where o.order_Date between '1997-01-01' and '1997-12-31'
order by o.order_date

-- 9. 1997 yılında sipariş veren müşterilerin contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )
Select o.order_date, c.contact_name , translate( phone,'()-. ' , '') as telephone from orders o
inner join customers c on c.customer_id = o.customer_id
where o.order_Date between '1997-01-01' and '1997-12-31'
order by c.contact_name

-- 10. Sipariş tarihi, müşteri contact name, çalışan ad, çalışan soyad
Select o.order_date,c.contact_name as customer_contact_name, e.first_name as employee_first_name, e.last_name as employee_last_name from orders o
inner join employees e on e.employee_id = o.employee_id
inner join customers c on c.customer_id = o.customer_id
order by o.order_date

-- 11. Geciken siparişlerim?
Select * from orders
where shipped_date > required_date

-- 12. Geciken siparişlerimin tarihi, müşterisinin adı
Select o.order_date, o.required_date,o.shipped_date , c.company_name, c.contact_name from orders o
inner join customers c on c.customer_id = o.customer_id
where o.shipped_date > o.required_date
order by o.order_date

-- 13. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi
Select o.order_id, p.product_name, c.category_name, od.quantity from orders o
inner join order_details od on o.order_id = od.order_id
inner join products p on od.product_id = p.product_id
inner join categories c on c.category_id = p.category_id
where o.order_id = 10248

-- 14. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı
Select o.order_id, p.product_name, s.company_name as supplier_name from orders o
inner join order_details od on o.order_id = od.order_id
inner join products p on od.product_id = p.product_id
inner join suppliers s on s.supplier_id = p.supplier_id
where o.order_id = 10248

-- 15. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti
Select o.order_date,e.employee_id, p.product_name, od.quantity from orders o
inner join employees e on e.employee_id = o.employee_id
inner join order_details od on od.order_id = o.order_id
inner join products p on od.product_id = p.product_id
where o.order_Date between '1997-01-01' and '1997-12-31' and e.employee_id = 3
order by p.product_name

-- 16. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad
Select od.quantity, e.employee_id, e.first_name, e.last_name from orders o 
inner join employees e on e.employee_id = o.employee_id
inner join order_details as od on od.order_id = o.order_id
where o.order_Date between '1997-01-01' and '1997-12-31' 
order by od.quantity DESC LIMIT 1

-- 17. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****
Select count(o.order_id) as toplam_satis,o.employee_id, e.first_name, e.last_name from orders o -- , 
inner join employees e on e.employee_id = o.employee_id
where o.order_Date between '1997-01-01' and '1997-12-31' 
group by o.employee_id, e.first_name, e.last_name
order by toplam_satis DESC LIMIT 1

-- 18. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?
Select p.product_name, p.unit_price, c.category_name from products p
inner join categories c on c.category_id = p.category_id
order by p.unit_price desc LIMIT 1

-- 19. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre
select e.first_name, e.last_name, o.order_date, o.order_id from employees e
inner join orders o on o.employee_id = e.employee_id
order by o.order_date

-- 20. SON 5 siparişimin ortalama fiyatı ve orderid nedir?
select order_id, avg(unit_price * quantity) from order_details
where order_id in  (select order_id from orders o
					order by o.order_id DESC LIMIT 5)
group by order_id

-- 21. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?
select p.product_name , c.category_name, sum(od.quantity * od.unit_price)
  from products p 
  inner join categories c on p.category_id = c.category_id
  inner join order_details  od on  p.product_id = od.product_id
  inner join orders o on od.order_id = o.order_id
  where extract(month from o.order_date) = 1
  group by p.product_name , c.category_name

-- 22. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?
select * from order_details
where unit_price > (select avg(unit_price) from order_details)
order by unit_price

-- 23. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
select p.product_name , c.category_name, sum(od.quantity ), s.company_name from products p 
  inner join categories c on p.category_id = c.category_id
  inner join order_details od on  p.product_id = od.product_id
  inner join suppliers s on s.supplier_id = p.supplier_id 
  group by p.product_name , c.category_name, s.company_name
  order by sum(od.quantity) desc limit 1

-- 24. Kaç ülkeden müşterim var
select count(DISTINCT country) AS number_of_country from customers

-- 25. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?
select employee_id, sum(unit_price * quantity) from orders o
inner join order_details od on od.order_id = o.order_id
where employee_id = 3 and order_date between '1998-01-01' and current_date
group by employee_id

-- 26. Hangi ülkeden kaç müşterimiz var
select country, count(customer_id) as number_of_customers  from customers
group by country

-- 27. 10 numaralı ID ye sahip ürünümden son 3 ayda ne kadarlık ciro sağladım?
select product_id, sum(unit_price * quantity) as ciro from orders o
inner join order_details od on od.order_id = o.order_id
where product_id = 10 and order_date between '1998-04-01' and '1998-06-30'
group by product_id

-- 28. Hangi çalışan şimdiye kadar toplam kaç sipariş almış..?
select e.employee_id,e.first_name,e.last_name, count(o.order_id) as total_order  from employees e
inner join orders o on o.employee_id = e.employee_id
group by o.employee_id, e.employee_id
order by e.employee_id

-- 29. 91 müşterim var. Sadece 89’u sipariş vermiş. Sipariş vermeyen 2 kişiyi bulun
select company_name, o.order_id from customers c
left join orders o on o.customer_id = c.customer_id
where o.order_id is NULL

-- 30. Brazil’de bulunan müşterilerin Şirket Adı, TemsilciAdi, Adres, Şehir, Ülke bilgileri
select company_name, contact_name, address, city, country from customers
where country = 'Brazil'

-- 31. Brezilya’da olmayan müşteriler
select country, * from customers
where country not in ('Brazil')
order by country

-- 32. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
select country, * from customers
where country in ('Spain','France','Germany')
order by country

-- 33. Faks numarasını bilmediğim müşteriler 
select * from customers
where fax is NULL

-- 34. Londra’da ya da Paris’de bulunan müşterilerim
select * from customers
where city in ('London','Paris')
order by city

-- 35. Hem Mexico D.F’da ikamet eden HEM DE ContactTitle bilgisi ‘owner’ olan müşteriler
select * from customers
where city = 'México D.F.' and contact_title ='Owner'

-- 36. C ile başlayan ürünlerimin isimleri ve fiyatları
select product_name, unit_price from products
where UPPER(product_name) LIKE 'C%'

-- 37. Adı (FirstName) ‘A’ harfiyle başlayan çalışanların (Employees); Ad, Soyad ve Doğum Tarihleri
select first_name, last_name, birth_date from employees
where UPPER(first_name) LIKE 'A%'

-- 38. İsminde ‘RESTAURANT’ geçen müşterilerimin şirket adları
select company_name, customer_id from customers
where UPPER(company_name) LIKE '%RESTAURANT%'
order by company_name

-- 39. 50$ ile 100$ arasında bulunan tüm ürünlerin adları ve fiyatları
select product_name, unit_price from products
where unit_price between 50 and 100
order by unit_price

-- 40. 1 temmuz 1996 ile 31 Aralık 1996 tarihleri arasındaki siparişlerin (Orders), 
-- SiparişID (OrderID) ve SiparişTarihi (OrderDate) bilgileri
Select order_id, order_date from orders 
where order_date between '1996-07-01' and '1996-12-31'
order by order_date

-- 41. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler
select country, * from customers
where country in ('Spain','France','Germany')
order by country

-- 42. Müşterilerimi ülkeye göre sıralıyorum:
select country, * from customers
order by country

-- 43. Ürünlerimi en pahalıdan en ucuza doğru sıralama, sonuç olarak ürün adı ve fiyatını istiyoruz
select product_name, unit_price from products
order by unit_price DESC

-- 44. Ürünlerimi en pahalıdan en ucuza doğru sıralasın, 
-- ama stoklarını küçükten-büyüğe doğru göstersin sonuç olarak ürün adı ve fiyatını istiyoruz
select product_name, unit_price, units_in_stock from products
order by unit_price DESC, units_in_stock

-- 45. 1 Numaralı kategoride kaç ürün vardır..?
select count(p.product_id) as num_of_product_in_category_1 from categories c
inner join products p on p.category_id = c.category_id
where c.category_id = 1

-- 46. Kaç farklı ülkeye ihracat yapıyorum..?
Select count(DISTINCT ship_country) as num_of_ship_country from orders
