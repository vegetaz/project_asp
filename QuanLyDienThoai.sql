use master 
go
if(exists(select * from sysdatabases where name='QLDienThoai'))
	drop database QLDienThoai
go 
create database QLDienThoai
go 
use QLDienThoai
GO
CREATE TABLE Manufacturer
(
ManufacturerId INT IDENTITY PRIMARY KEY,
ManufacturerName NVARCHAR(50) NOT NULL,
Description NTEXT
)

GO
CREATE TABLE Product 
(
ProductId INT IDENTITY PRIMARY KEY,
ProductName NVARCHAR(50) NOT NULL,
Screen NVARCHAR(100),
Camera NVARCHAR(100),
Description NTEXT,
Quantity INT NOT NULL,
CPU NVARCHAR(50),
Memmory NVARCHAR(50),
Warranty NVARCHAR(20),
Image VARCHAR(255),
ManufacturerId INT,
Color NVARCHAR(20),
Price FLOAT NOT NULL,
CONSTRAINT fk1 FOREIGN KEY(ManufacturerId) REFERENCES Manufacturer(ManufacturerId) ON UPDATE CASCADE ON DELETE CASCADE
)
GO 
CREATE TABLE Role
(
RoleId INT IDENTITY PRIMARY KEY,
RoleName NVARCHAR(50) NOT NULL
)
GO 
CREATE TABLE Account
(
AccountId INT IDENTITY PRIMARY KEY,
FullName NVARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL UNIQUE,
Phone VARCHAR(20) NOT NULL,
Password VARCHAR(20) NOT NULL,
Address NVARCHAR(100) NOT NULL,
Gender BIT NOT NULL,
DateofBirth DATE,
RoleId INT,
Status BIT DEFAULT 1,
CONSTRAINT fk2 FOREIGN KEY(RoleId) REFERENCES Role(RoleId) ON UPDATE CASCADE ON DELETE CASCADE
)
GO 
CREATE TABLE [Order]
(
OrderId INT IDENTITY PRIMARY KEY,
Total FLOAT,
AccountId INT,
DateOrder DATETIME NOT NULL,
Status BIT NOT NULL,
ShipAddress NVARCHAR(100) NOT NULL,
ShipTime DATETIME NOT NULL,
ShipPhone VARCHAR(20) NOT NULL,
CONSTRAINT fk3 FOREIGN KEY(AccountId) REFERENCES dbo.Account(AccountId) ON UPDATE CASCADE ON DELETE CASCADE
)
GO 
CREATE TABLE OrderDetail
(
OrderId INT,
ProductId INT,
Price FLOAT NOT NULL,
Quantity INT NOT NULL,
PRIMARY KEY(OrderId,ProductId),
CONSTRAINT fk4 FOREIGN KEY(OrderId) REFERENCES dbo.[Order] ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT fk5 FOREIGN KEY(ProductId) REFERENCES dbo.Product ON UPDATE CASCADE ON DELETE CASCADE
)

GO 

-- insert data 
--manufacturer
INSERT INTO Manufacturer VALUES(N'Samsung',N'This is company from Korea')
INSERT INTO Manufacturer VALUES(N'Apple',N'This is company from US')
INSERT INTO Manufacturer VALUES(N'Xiaomi',N'This is company from China')
INSERT INTO Manufacturer VALUES(N'HTC',N'This is company from Taiwan')
INSERT INTO Manufacturer VALUES(N'Sony',N'This is company from Japan')

-- product
INSERT INTO Product VALUES(N'Iphone X',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',2,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Iphone 8',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',2,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Iphone 7',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',2,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Iphone 6',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',2,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Iphone 6S',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',2,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Iphone 8 Plus',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',2,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Samsung Galaxy S8',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',1,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Samsung Galaxy S8 Edge',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',1,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Samsung Galaxy S7',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',1,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Samsung Galaxy S7 Edge',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',1,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Samsung Galaxy S6',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',1,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Samsung Galaxy S6 Edge',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',1,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Samsung Galaxy J7',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',1,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Xiaomi Redmi 5X',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',3,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Xiaomi Mi 5X',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',3,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'Xiaomi Mimix 5X',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',3,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'HTC one',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',4,N'Đỏ',19990000)
INSERT INTO Product VALUES(N'HTC 10',N'LED-backlit IPS LCD,Độ phân giải Full HD (1080 x 1920 pixels),5.5',N'12MP,Tự động lấy nét, Chạm lấy nét, Nhận diện khuôn mặt, HDR, Panorama, Chống rung quang học (OIS)',N'iPhone 6s Plus 32 GB là phiên bản nâng cấp hoàn hảo từ iPhone 6 Plus với nhiều tính năng mới hấp dẫn.Camera được cải tiến iPhone 6s Plus 32 GB được nâng cấp độ phân giải camera sau lên 12 MP (thay vì 8 MP như trên iPhone 6 Plus), camera cho tốc độ lấy nét và chụp nhanh, thao tác chạm để chụp nhẹ nhàng. Chất lượng ảnh trong các điều kiện chụp khác nhau tốt.',10,N'Apple A9 2 nhân 64-bit','ROM 64GB,RAM 2GB','24 Months','',4,N'Đỏ',19990000)
GO 
-- Role
INSERT INTO Role VALUES (N'admin')
INSERT INTO Role VALUES (N'user')
GO 
-- account
INSERT INTO Account VALUES(N'Hoàng Minh Đức','hoangduc@gmail.com','09324238','1234',N'Hà Nội',1,'10-09-1997',2,1)
INSERT INTO Account VALUES(N'Hoàng Ngọc Hải','hoanghai@gmail.com','09324238','1234',N'Hà Nội',0,'10-09-1997',2,1)
INSERT INTO Account VALUES(N'Tạ Trường Hoàng','hoang@gmail.com','09324238','1234',N'Hà Nội',1,'10-09-1997',2,1)
INSERT INTO Account VALUES(N'Nguyễn Văn Vận','van@gmail.com','09324238','1234',N'Hà Nội',1,'10-09-1997',2,1)
INSERT INTO Account VALUES(N'Hồ Sỹ Hậu','hosyhau@gmail.com','09324238','1234',N'Hà Nội',1,'10-09-1997',1,1)
--order 
INSERT INTO [Order] VALUES ('',1,'Feb  7 2018  1:36PM',0,'','','')
INSERT INTO [Order] VALUES ('',2,'Feb  3 2018  1:36PM',0,'','','')
INSERT INTO [Order] VALUES ('',2,'Feb  2 2018  1:36PM',1,N'Xuân Phương,Nam Từ Liêm,Hà Nội','Feb  5 2018  1:36PM','0987423121')
INSERT INTO [Order] VALUES ('',3,'Feb  1 2018  1:36PM',0,'','','')
INSERT INTO [Order] VALUES ('',4,'Feb  10 2018  1:36PM',0,'','','')

-- orderdetail
INSERT INTO dbo.OrderDetail VALUES (1,1,19990000,1)
INSERT INTO dbo.OrderDetail VALUES (1,2,19990000,1)
INSERT INTO dbo.OrderDetail VALUES (1,3,19990000,1)
INSERT INTO dbo.OrderDetail VALUES (2,1,19990000,1)
INSERT INTO dbo.OrderDetail VALUES (2,3,19990000,1)
INSERT INTO dbo.OrderDetail VALUES (2,2,19990000,1)
INSERT INTO dbo.OrderDetail VALUES (3,1,19990000,1)
INSERT INTO dbo.OrderDetail VALUES (3,2,19990000,1)
INSERT INTO dbo.OrderDetail VALUES (3,3,19990000,1)
GO 

-- procedure


-- manufacture
GO 
CREATE PROCEDURE GetAllManufacturer
AS 
	BEGIN 
	SELECT * FROM dbo.Manufacturer
	END 
GO 
CREATE PROCEDURE InsertManufacturer(@name NVARCHAR(50),@des NTEXT)
AS
BEGIN 
	INSERT INTO dbo.Manufacturer VALUES(@name,@des)
END
GO 
CREATE PROC UpdateManufacturer(@id INT,@name NVARCHAR(50),@des NTEXT)
AS
BEGIN
	UPDATE dbo.Manufacturer 
	SET ManufacturerName=@name,
	Description=@des
	WHERE ManufacturerId=@id
END
GO 
CREATE PROC DELETEManufacturer(@id int)
AS
BEGIN
DELETE dbo.Manufacturer WHERE ManufacturerId=@id
END
GO 
-- product 
GO 
CREATE PROCEDURE GetAllProduct
AS
BEGIN
SELECT * FROM dbo.Product
END 
GO 
CREATE PROCEDURE GetProductById(@id INT)
AS
BEGIN
SELECT * FROM dbo.Product WHERE ProductId=@id
END
GO 
CREATE PROCEDURE InsertProduct(@name NVARCHAR(50),@screen NVARCHAR(100),@camera NVARCHAR(100),@des NTEXT,@quantity INT,@cpu NVARCHAR(50),@memmory NVARCHAR(50),@warranty NVARCHAR(20),@image VARCHAR(50),@manu INT,@color NVARCHAR(20),@price FLOAT)
AS 
BEGIN
	INSERT INTO Product VALUES(@name,@screen,@camera,@des,@quantity,@cpu,@memmory,@warranty,@image,@manu,@color,@price)
END 
GO 
CREATE PROCEDURE UpdateProduct(@id int,@name NVARCHAR(50),@screen NVARCHAR(100),@camera NVARCHAR(100),@des NTEXT,@quantity INT,@cpu NVARCHAR(50),@memmory NVARCHAR(50),@warranty NVARCHAR(20),@image VARCHAR(50),@manu INT,@color NVARCHAR(20),@price FLOAT)
AS 
BEGIN
	UPDATE dbo.Product 
	SET ProductName=@name,
	Screen=@screen,
	Camera=@camera,
	Description=@des,
	Quantity=@quantity,
	CPU=@cpu,
	Memmory=@memmory,
	Warranty=@warranty,
	Image=@image,
	ManufacturerId=@manu,
	Color=@color,
	Price=@price
	WHERE ProductId=@id
END
GO 
CREATE PROCEDURE GetProductByManufacturer(@manu int)
AS
BEGIN
	SELECT * FROM dbo.Product WHERE ManufacturerId=@manu
END
GO 
--Order
CREATE PROCEDURE GetAllOrder
AS 
BEGIN
	SELECT * FROM dbo.[Order]
END
GO 
CREATE PROCEDURE UpdateOrder(@id INT,@total FLOAT,@accountid INT,@dateorder DATETIME,@status BIT,@shipadd NVARCHAR(50),@shiptime DATETIME,@shipphone VARCHAR(20))
AS 
BEGIN
	UPDATE dbo.[Order]
	SET Total=@total,
    AccountId=@accountid,
    DateOrder=@dateorder,
	Status=@status,
	ShipAddress=@shipadd,
	ShipTime=@shiptime,
	ShipPhone=@shipphone
	WHERE OrderId=@id
END 
GO 
-- account
CREATE PROCEDURE GetAllAccount
AS
BEGIN 
	SELECT * FROM dbo.Account
END 
GO 
CREATE PROCEDURE UpdateAccount(@id INT,@name NVARCHAR(50),@mail VARCHAR(50),@phone VARCHAR(20),@pass VARCHAR(20),@add NVARCHAR(50),@gender BIT,@date DATE,@role INT,@status bit)
AS 
BEGIN 
	UPDATE dbo.Account 
	SET FullName=@name,
    Email=@mail,
	Phone=@phone,
    Password=@pass,
    Address=@add,
    Gender=@gender,
    DateofBirth=@date,
    RoleId=@role,
	Status =@status
	WHERE AccountId=@id
END 
GO 
CREATE PROCEDURE InsertAccount(@name NVARCHAR(50),@mail VARCHAR(50),@phone VARCHAR(20),@pass VARCHAR(20),@add NVARCHAR(50),@gender BIT,@date DATE,@role INT,@status bit)
AS
BEGIN
	INSERT INTO Account VALUES(@name,@mail,@phone,@pass,@add,@gender,@date,@role,@status)
END 