--Select : Bir veri kaynağındaki datayı çekmek için kullanılır.
SELECT ContactName Adi, CompanyName SirketAdi, City Sehir FROM Customers

--Filtreleme sorgusu : where
SELECT * FROM Customers WHERE City = 'Berlin'

--case insensitive : büyük, küçük duyarsız
SELECT * FROM Products WHERE CategoryID = 1 or CategoryID = 3

-- <> : farklı
SELECT * FROM Products WHERE CategoryID = 1 and UnitPrice >= 10

--order by: sırala 
--asc(ascending): artan
--desc(descending): azalan

SELECT * FROM Products WHERE CategoryID = 1 ORDER BY UnitPrice desc

SELECT COUNT(*) Adet FROM Products WHERE CategoryID = 2

--group by: her bir grup elemanı için ayrıca count hesaplanıyor.
--Hangi kategoride kaç farklı ürün var?
SELECT CategoryID, COUNT(*) FROM Products GROUP BY CategoryID

--having: 
--ürün sayısı 10 dan az olan kategorileri listele kaç tane olduğunu da göster
SELECT CategoryID, COUNT(*) FROM Products GROUP BY CategoryID HAVING COUNT(*) < 10
--birim fiyatı 20 den fazla olan ürünleri categoryId ye göre grupla, onlardan da sayısı 10 dan az olanları göster
SELECT CategoryID, COUNT(*) FROM Products WHERE UnitPrice > 20 GROUP BY CategoryID HAVING COUNT(*) < 10 

--Join: birleştirmek
SELECT Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID

--DTO(Data Transformation Object): 

--ürünlerden fiyatı 10 dan büyük olanlar için onu kategorilerle join et ve getir. fiyatı 10 dan büyük olan ürünleri kategori ismi ile getirecek olan kod.
SELECT Products.ProductID, Products.ProductName, Products.UnitPrice, Categories.CategoryName FROM Products INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID WHERE Products.UnitPrice > 10

--inner join sadece iki tabloda da eşleşen verileri getirir. Eşleşmeyen datayı getirmez.
--left: solda olup sağda olmayanları da getir.(ürünlerde da olup sipariş detayında olamayanı)
--right: sağda olup solda olmayanları da getir.
SELECT * FROM Products p LEFT JOIN [Order Details] od ON p.ProductID = od.ProductID

SELECT * FROM Customers c LEFT JOIN Orders o on c.CustomerID = o.CustomerID WHERE o.CustomerID IS NULL

--ikiden fazla tabloyu birleştirme
SELECT * FROM Products p LEFT JOIN [Order Details] od ON p.ProductID = od.ProductID INNER JOIN Orders o on o.OrderID = od.OrderID