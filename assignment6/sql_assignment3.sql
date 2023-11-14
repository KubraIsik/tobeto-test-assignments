-- Pair 1 SQL QUERY ODEV 3

-- (85.Kaç farklı ülkeye ihracat yapıyorum? sorusunun devamı)
--86. a.Bu ülkeler hangileri..? 
      SELECT DISTINCT ship_country FROM orders
      ORDER BY ship_country
	  
--87. En Pahalı 5 ürün
      SELECT * FROM products
      ORDER BY unit_price DESC LIMIT 5
	  
--88. ALFKI CustomerID’sine sahip müşterimin sipariş sayısı..?
      SELECT Count(order_id) AS num_of_order_ALFKI FROM orders o
      INNER JOIN customers c ON c.customer_id = o.customer_id
      WHERE c.customer_id = 'ALFKI'
	  
--89. Ürünlerimin toplam maliyeti
      SELECT SUM(unit_price) AS total_price_of_all_products FROM products
     
--90. Şirketim, şimdiye kadar ne kadar ciro yapmış..?
      SELECT SUM((unit_price*quantity)* (1-discount)) AS total_ciro FROM order_details
	  
--91. Ortalama Ürün Fiyatım
      SELECT AVG(unit_price) avg_of_all_products FROM products
	  
--92. En Pahalı Ürünün Adı
      SELECT product_name, unit_price FROM products
      ORDER BY unit_price DESC LIMIT 1
	  
--93. En az kazandıran sipariş
      -- kar hesaplama, satış - maliyet gibi yapılması gerekiyor gibi kazanç sorduğu için  
      SELECT od.order_id, SUM(od.unit_price*od.quantity) - SUM(p.unit_price*od.quantity) AS siparis_basina_kazanc  
      FROM order_details od
      INNER JOIN products p ON od.product_id = p.product_id
      GROUP BY od.order_id
      ORDER BY  siparis_basina_kazanc LIMIT 1
	  
      ---- products tablosundaki unit_price ile order_details içindeki unit_price ya birbirine eşit 
      ----------------------------------------------------------------------------ya da p.unitprice daha fazla
      --- eğer ürün maliyeti product içindeki unit_price diye düşünürsek, 
      --- satışlarda hep zarar etmişiz gibi duruyor :)
      --- çoğunlukla ya hiç kar edilmemiş ya da zararına satışlar
	  
--94. Müşterilerimin içinde en uzun isimli müşteri
      SELECT company_name,length(company_name) FROM customers
      ORDER BY LENGTH(company_name) DESC LIMIT 1 
	  
--95. Çalışanlarımın Ad, Soyad ve Yaşları
      SELECT last_name, first_name, DATE_PART('year', AGE(current_date, birth_date)) AS age FROM employees
	  
--96. Hangi üründen toplam kaç adet alınmış..?
      SELECT od.product_id, p.product_name, COUNT(quantity) AS total_num_of_sell FROM order_details od 
      INNER JOIN products p on p.product_id = od.product_id
      GROUP BY od.product_id , p.product_name
      ORDER BY od.product_id
	  
--97. Hangi siparişte toplam ne kadar kazanmışım..?
      SELECT order_id, SUM(unit_price * quantity) AS kazanc FROM order_details
      GROUP BY order_id 
      ORDER BY kazanc DESC 
	  
      -- YA DA
      -- kazanç sorulduğu için maliyet hesabı olabilir yine:
      SELECT od.order_id, SUM(od.unit_price*od.quantity) - SUM(p.unit_price*od.quantity) AS siparis_basina_kazanc  
      FROM order_details od
      INNER JOIN products p ON od.product_id = p.product_id
      GROUP BY od.order_id
      ORDER BY  od.order_id
      -- 93 ile benzer değil mi?
		 
--98. Hangi kategoride toplam kaç adet ürün bulunuyor..?
      SELECT  c.category_id , c.category_name, COUNT(p.product_id) AS num_of_products FROM categories c 
      INNER JOIN products p ON p.category_id = c.category_id
      GROUP BY c.category_id 
      ORDER BY  c.category_id 
	  
--99. 1000 Adetten fazla satılan ürünler?
      SELECT od.product_id ,  p.product_name , SUM(quantity) AS num_of_sell_of_products FROM order_details od
      INNER JOIN products p ON p.product_id = od.product_id
      GROUP BY od.product_id , p.product_name 
      HAVING SUM(quantity) > 1000
      ORDER BY num_of_sell_of_products
	  
--100. Hangi Müşterilerim hiç sipariş vermemiş..?
      SELECT c.customer_id, c.company_name , o.order_id FROM customers c 
      LEFT JOIN orders o ON c.customer_id = o.customer_id
      WHERE o.customer_id IS NULL	
	  
--101. Hangi tedarikçi hangi ürünü sağlıyor?
      SELECT s.supplier_id , s.company_name , p.product_id , p.product_name
      FROM suppliers s 
      INNER JOIN products p ON s.supplier_id = p.supplier_id
      ORDER BY s.supplier_id
	  
--102. Hangi sipariş hangi kargo şirketi ile ne zaman gönderilmiş..?
      SELECT o.order_id,s.shipper_id, s.company_name ,o.shipped_date, o.ship_name FROM orders o 
      INNER JOIN shippers s ON o.ship_via = s.shipper_id
      ORDER BY o.order_id
	  
--103. Hangi siparişi hangi müşteri verir..?
      SELECT o.order_id , o.customer_id , c.company_name FROM orders o 
      INNER JOIN customers c ON c.customer_id = o.customer_id
	  
--104. Hangi çalışan, toplam kaç sipariş almış..?
      SELECT e.employee_id, e.first_name,e.last_name, COUNT(o.order_id) AS alinan_toplam_siparis  
      FROM employees e 
      INNER JOIN orders o ON e.employee_id = o.employee_id
      GROUP BY e.employee_id
      ORDER BY alinan_toplam_siparis DESC
	  
--105. En fazla siparişi kim almış..?
      -- Çalışanlardan en fazla sipariş alan için (employee)
      SELECT e.employee_id, e.first_name,e.last_name, COUNT(o.order_id) AS alinan_toplam_siparis
      FROM employees e 
      INNER JOIN orders o ON e.employee_id = o.employee_id
      GROUP BY e.employee_id
      ORDER BY alinan_toplam_siparis DESC LIMIT 1 
	  
      -- YA DA
      -- Müşterilerden en fazla sipariş alan için (customers)
      SELECT c.customer_id, c.company_name, COUNT(o.order_id) AS alinan_toplam_siparis FROM customers c
      INNER JOIN orders o ON c.customer_id=o.customer_id
      GROUP BY c.customer_id
      ORDER BY  alinan_toplam_siparis DESC LIMIT 1 
	  
--106. Hangi siparişi, hangi çalışan, hangi müşteri vermiştir..?
      SELECT o.order_id, o.employee_id,e.first_name,e.last_name, c.customer_id,c.company_name FROM orders o
      INNER JOIN employees e ON o.employee_id=e.employee_id
      INNER JOIN customers c ON o.customer_id=c.customer_id
	  
--107. Hangi ürün, hangi kategoride bulunmaktadır..? Bu ürünü kim tedarik etmektedir..?
      SELECT p.product_id , p.product_name, c.category_name , s.supplier_id , s.company_name
      FROM products p INNER JOIN categories c ON p.category_id = c.category_id
      INNER JOIN suppliers s ON p.supplier_id = s.supplier_id
      ORDER BY p.product_id

--108. Hangi siparişi hangi müşteri vermiş, hangi çalışan almış, hangi tarihte, 
------ hangi kargo şirketi tarafından gönderilmiş hangi üründen kaç adet alınmış, 
------ hangi fiyattan alınmış, ürün hangi kategorideymiş bu ürünü hangi tedarikçi sağlamış
      SELECT o.order_id,
	     cu.customer_id, cu.company_name AS customer_company,
	     CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
	     o.order_date,
	     s.company_name,
	     od.product_id, p.product_name, od.quantity, od.unit_price,
	     c.category_name,
	     s2.supplier_id, s2.company_name AS supplier_name
      FROM orders o
      JOIN customers cu ON o.customer_id = cu.customer_id
      JOIN employees e ON o.employee_id = e.employee_id
      JOIN shippers s ON o.ship_via = s.shipper_id
      JOIN order_details od ON od.order_id = o.order_id
      JOIN products p ON od.product_id = p.product_id
      JOIN categories c ON p.category_id = c.category_id
      JOIN suppliers s2 ON p.supplier_id = s2.supplier_id
      ORDER BY o.order_id, od.product_id;

--109. Altında ürün bulunmayan kategoriler
      SELECT c.category_id, c.category_name , p.product_name FROM categories c  
      LEFT JOIN products p ON p.category_id = c.category_id 
      WHERE p.product_id IS NULL
      ORDER BY c.category_id
      -- Her kategoride ürün var
	  
--110. Manager ünvanına sahip tüm müşterileri listeleyiniz.
      SELECT customer_id, company_name, contact_name, contact_title FROM customers 
      WHERE contact_title LIKE '%Manager%'
      ORDER BY customer_id
	   
--111. FR ile başlayan 5 karekter olan tüm müşterileri listeleyiniz.
      SELECT customer_id, company_name, contact_name FROM customers
      WHERE  customer_id LIKE 'FR___'
	  
--112. (171) alan kodlu telefon numarasına sahip müşterileri listeleyiniz.
      SELECT customer_id, phone FROM customers
      WHERE phone LIKE '(171)%'
	   
--113. BirimdekiMiktar alanında boxes geçen tüm ürünleri listeleyiniz.
      SELECT product_id, product_name, quantity_per_unit FROM products 
      WHERE quantity_per_unit LIKE '%boxes%'
	   
--114. Fransa ve Almanyadaki (France,Germany) Müdürlerin (Manager) Adını ve Telefonunu listeleyiniz.(MusteriAdi,Telefon)
      SELECT customer_id, country, company_name, contact_title, phone FROM customers 
      WHERE country IN ('France' , 'Germany') AND contact_title LIKE '%Manager%'
      ORDER BY country
	   
--115. En yüksek birim fiyata sahip 10 ürünü listeleyiniz.
      SELECT product_id, product_name, unit_price FROM products
      ORDER BY unit_price DESC LIMIT 10
	   
--116. Müşterileri ülke ve şehir bilgisine göre sıralayıp listeleyiniz.
      SELECT customer_id, company_name, country, city FROM customers
      ORDER BY country , city
	   
--117. Personellerin ad,soyad ve yaş bilgilerini listeleyiniz.
      SELECT employee_id, first_name, last_name, DATE_PART('year', AGE(current_date, birth_date)) AS age 
      FROM employees 
	   
--118. 35 gün içinde sevk edilmeyen satışları listeleyiniz. 
      SELECT order_id, customer_id, order_date, shipped_date FROM orders
      WHERE (shipped_date - order_date) >= 35 OR shipped_date IS NULL
	    
--119. Birim fiyatı en yüksek olan ürünün kategori adını listeleyiniz. (Alt Sorgu)
      SELECT c.category_id, c.category_name, p.product_id, p.product_name, p.unit_price FROM categories c 
      INNER JOIN products p ON c.category_id = p.category_id
      WHERE p.unit_price = (SELECT MAX(unit_price) FROM products )
	   
--120. Kategori adında 'on' geçen kategorilerin ürünlerini listeleyiniz. (Alt Sorgu)
      SELECT p.category_id, c.category_name, p.product_id, p.product_name FROM products p
      INNER JOIN categories c ON c.category_id = p.category_id
      WHERE p.category_id IN (select category_id FROM categories 
	                         			WHERE category_name LIKE '%on%')
      ORDER BY p.category_id, p.product_id
										
      -- YA DA
      SELECT p.category_id, p.product_id, p.product_name FROM products p
      WHERE p.category_id IN (SELECT category_id FROM categories  
							WHERE category_name LIKE '%on%')
      ORDER BY p.category_id,p.product_id
							 
--121. Konbu adlı üründen kaç adet satılmıştır.
      SELECT p.product_name, SUM(od.quantity) AS total_num_of_sell FROM products  p 
      INNER JOIN order_details od ON p.product_id = od.product_id
      WHERE product_name = 'Konbu'
      GROUP BY product_name
	  
--122. Japonyadan kaç farklı ürün tedarik edilmektedir.
      --Çözüm 1
      SELECT country, COUNT(DISTINCT product_id) AS num_of_distinct_product_from_Japan FROM suppliers s 
      INNER JOIN products p ON p.supplier_id = s.supplier_id 
      WHERE country = 'Japan'
      GROUP BY country
	  
      --Çözüm 2
      SELECT count(DISTINCT product_id) AS num_of_distinct_product_from_Japan froFROMm products
      WHERE supplier_id IN (SELECT supplier_id FROM suppliers WHERE country = 'Japan')
	  
--123. 1997 yılında yapılmış satışların en yüksek, en düşük ve ortalama nakliye ücretlisi ne kadardır?
      SELECT MIN(freight) AS en_dusuk_nakliye_ucret, MAX(freight) AS en_yuksek_nakliye_ucret, AVG(freight) AS ortalama_nakliye_ucret 
      FROM orders WHERE extract(year FROM order_date) = 1997
	  
--124. Faks numarası olan tüm müşterileri listeleyiniz.
      SELECT customer_id, company_name, contact_name , fax FROM customers
      WHERE fax IS NOT NULL
	  
--125. 1996-07-16 ile 1996-07-30 arasında sevk edilen satışları listeleyiniz.
      SELECT order_id, shipped_date, order_date FROM orders 
      WHERE shipped_date BETWEEN '1996-07-16' AND '1996-07-30'
      ORDER BY shipped_date
