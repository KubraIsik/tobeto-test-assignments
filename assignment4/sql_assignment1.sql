----- PAIR-1 SQL QUERY  ----
-- queries to retrieve data and information from northwind database --

SELECT * FROM products
ORDER BY unit_price DESC

--1. Product isimlerini (ProductName) ve birim başına miktar (QuantityPerUnit) değerlerini almak için sorgu yazın.

SELECT product_name, quantity_per_unit FROM products;

--2. Ürün Numaralarını (ProductID) ve Product isimlerini (ProductName) değerlerini almak için sorgu yazın. Artık satılmayan ürünleri (Discontinued) filtreleyiniz.

SELECT product_id, product_name FROM products
WHERE discontinued = 0;


--3. Durdurulan Ürün Listesini, Ürün kimliği ve ismi (ProductID, ProductName) değerleriyle almak için bir sorgu yazın.

SELECT product_id, product_name FROM products
WHERE discontinued = 1;


--4. Ürünlerin maliyeti 20'dan az olan Ürün listesini (ProductID, ProductName, UnitPrice) almak için bir sorgu yazın.

SELECT product_id, product_name, unit_price FROM products
WHERE unit_price < 20 

--5. Ürünlerin maliyetinin 15 ile 25 arasında olduğu Ürün listesini (ProductID, ProductName, UnitPrice) almak için bir sorgu yazın.

SELECT product_id, product_name, unit_price FROM products
WHERE unit_price <25 AND unit_price >15

--6. Ürün listesinin (ProductName, UnitsOnOrder, UnitsInStock) stoğun siparişteki miktardan az olduğunu almak için bir sorgu yazın.

SELECT product_name, units_on_order, units_in_stock FROM products
WHERE units_in_stock < units_on_order

--7. İsmi a ile başlayan ürünleri listeleyeniz.

SELECT product_name FROM products
WHERE LOWER(product_name) LIKE 'a%'


--8. İsmi i ile biten ürünleri listeleyeniz.

SELECT product_name FROM products
WHERE LOWER(product_name) LIKE '%i'


--9. Ürün birim fiyatlarına %18’lik KDV ekleyerek listesini almak (ProductName, UnitPrice, UnitPriceKDV) için bir sorgu yazın.
--select product_name, unit_price, unit_price_KDV

SELECT product_name, unit_price, (unit_price + unit_price*0.18) AS Unit_Price_KDV 
FROM products


--10. Fiyatı 30 dan büyük kaç ürün var?
SELECT COUNT(*) FROM products
WHERE unit_price > 30


--11. Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele
SELECT LOWER(product_name), unit_price FROM products
ORDER BY unit_price DESC

--12. Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır

SELECT first_name, last_name FROM employees

--13. Region alanı NULL olan kaç tedarikçim var?

SELECT COUNT(*) FROM suppliers 
WHERE region IS null

--14. Null olmayanlar?

SELECT COUNT(*) FROM suppliers 
WHERE region IS NOT null

--15. Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.

SELECT product_name, CONCAT('TR', UPPER(product_name)) AS new_product_name 
FROM products

--16. Fiyatı 20den küçük ürünlerin adının başına TR ekle 

SELECT product_name, CONCAT('TR', product_name), unit_price AS new_product_name FROM products
WHERE unit_price < 20
ORDER BY unit_price DESC

--17. En pahalı ürün listesini (ProductName , UnitPrice) almak için bir sorgu yazın.

SELECT product_name, unit_price FROM products
ORDER BY unit_price DESC LIMIT 1

--18. En pahalı on ürünün Ürün listesini (ProductName , UnitPrice) almak için bir sorgu yazın.

SELECT product_name, unit_price FROM products
ORDER BY unit_price DESC
LIMIT 10

--19. Ürünlerin ortalama fiyatının üzerindeki Ürün listesini (ProductName , UnitPrice) almak için bir sorgu yazın.

SELECT product_name, unit_price FROM products
WHERE unit_price > (Select AVG(unit_price) FROM products)
ORDER BY unit_price

--20. Stokta olan ürünler satıldığında elde edilen miktar ne kadardır.

SELECT SUM(unit_price * units_in_stock) FROM products

--21. Mevcut ve Durdurulan ürünlerin sayılarını almak için bir sorgu yazın.

SELECT COUNT(product_id) FROM products
WHERE discontinued = 1 AND units_in_stock > 0

--22. Ürünleri kategori isimleriyle birlikte almak için bir sorgu yazın.

SELECT p.product_name,c.category_name  FROM products AS p
	INNER JOIN categories AS c ON c.category_id = p.category_id

--23. Ürünlerin kategorilerine göre fiyat ortalamasını almak için bir sorgu yazın.

SELECT category_id, AVG(unit_price ) AS avg_by_category  FROM products 
GROUP BY category_id
ORDER BY category_id

--24. En pahalı ürünümün adı, fiyatı ve kategorisin adı nedir?

SELECT p.product_name, p.unit_price, c.category_name FROM products as p
	join categories as c on c.category_id = p.category_id 
	WHERE p.unit_price = (Select MAX(unit_price) FROM products)


--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı

SELECT p.product_name, c.category_name, s.company_name FROM products as p
 inner join categories as c on c.category_id = p.category_id
 inner join suppliers as s on p.supplier_id = s.supplier_id
ORDER BY p.units_on_order DESC LIMIT 1
