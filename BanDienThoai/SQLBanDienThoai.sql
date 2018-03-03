/*
Created		1/27/2000
Modified		1/27/2000
Project		
Model		
Company		
Author		
Version		
Database		MS SQL 7 
*/


Create table [Manufacturer] (
	[ManufacturerId] Integer NOT NULL,
	[ManufacturerName] Nvarchar(50) NOT NULL,
	[Description] Ntext NULL,
Primary Key  ([ManufacturerId])
) 
go

Create table [Product] (
	[ProductId] Integer NOT NULL,
	[ManufacturerId] Integer NOT NULL,
	[ProductName] Nvarchar(50) NOT NULL,
	[Screen] Nvarchar(100) NULL,
	[Camera] Nvarchar(100) NULL,
	[Description] Ntext NULL,
	[Quantity] Integer NOT NULL,
	[CPU] Nvarchar(50) NULL,
	[Memory] Nvarchar(50) NULL,
	[Warranty] Nvarchar(20) NULL,
	[Image] Varchar(255) NULL,
	[Color] Nvarchar(20) NULL,
	[Price] Float NOT NULL,
Primary Key  ([ProductId])
) 
go

Create table [Role] (
	[RoleId] Integer NOT NULL,
	[RoleName] Nvarchar(50) NOT NULL,
Primary Key  ([RoleId])
) 
go

Create table [Account] (
	[AccountId] Integer NOT NULL,
	[RoleId] Integer NOT NULL,
	[FullName] Nvarchar(50) NOT NULL,
	[Email] Varchar(50) NOT NULL UNIQUE,
	[Phone] Varchar(20) NOT NULL,
	[Password] Varchar(20) NOT NULL,
	[Address] Nvarchar(100) NOT NULL,
	[Gender] Bit NOT NULL,
	[DateofBirth] Datetime NOT NULL,
	[Status] Bit Default 1 NOT NULL,
Primary Key  ([AccountId])
) 
go

Create table [Order] (
	[OrderId] Integer NOT NULL,
	[AccountId] Integer NULL,
	[Total] Float NULL,
	[DateOrder] Datetime NOT NULL,
	[Status] Bit NOT NULL,
	[ShipAddress] Nvarchar(100) NULL,
	[ShipTime] Datetime NULL,
	[ShipPhone] Varchar(20) NULL,
Primary Key  ([OrderId])
) 
go

Create table [OrderDetail] (
	[ProductId] Integer NOT NULL,
	[OrderId] Integer NOT NULL,
	[Price] Float NOT NULL,
	[Quantity] Integer NOT NULL,
Primary Key  ([ProductId],[OrderId])
) 
go


Alter table [Product] add  foreign key([ManufacturerId]) references [Manufacturer] ([ManufacturerId]) 
go
Alter table [OrderDetail] add  foreign key([ProductId]) references [Product] ([ProductId]) 
go
Alter table [Account] add  foreign key([RoleId]) references [Role] ([RoleId]) 
go
Alter table [Order] add  foreign key([AccountId]) references [Account] ([AccountId]) 
go
Alter table [OrderDetail] add  foreign key([OrderId]) references [Order] ([OrderId]) 
go


Set quoted_identifier on
go

Set quoted_identifier off
go


