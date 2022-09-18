-- creating database to mechanical shop
create database Mechanical_Shop;
USE Mechanical_Shop;

-- table client
create table Customer(
	idClient int auto_increment primary key,
    Cname VARCHAR(45),
    Caddress VARCHAR(45),
    Contact VARCHAR(45)
);

-- table vehicle
create table Vehicle(
	idVehicle int auto_increment primary key,
	Vplate VARCHAR(45),
    Vmodel VARCHAR(45),
    Vyear DATE
);

-- table mechanic
create table Mechanic(
	idMechanic int auto_increment primary key,
	Mcode VARCHAR(45),
    Mname VARCHAR(45),
    Maddress VARCHAR(45),
    Mspecialty VARCHAR(45)
);

-- table Order Service
create table OrderService(
	idOrderService int auto_increment primary key,
	OSdelivery_date DATE,
    OSnumber VARCHAR(45),
    OSissue_date DATE,
    OSamount FLOAT,
    OSstatus VARCHAR(45),
	constraint pk_OrderService PRIMARY KEY (idOrderService)  
);

-- table reference
create table ReferenceTable(
	idReferenceTable int auto_increment primary key,
	RTemployee VARCHAR(45),
	RTvalue_labour FLOAT,
    RTprice_car_part FLOAT  
);

-- table services
create table Services(
	idServices int auto_increment primary key,
	Sidentification VARCHAR(45),
	Svalue FLOAT,
    constraint fk_Services_idServicos foreign key (idServices) references OrderService(idOrderService)  
);

-- table car part 
create table CarPart(
	idCarPart int auto_increment primary key,
	CPquantity INT,
	CPidentification VARCHAR(45),
	CPvalue FLOAT,
	constraint fk_CarPart_idCarPart foreign key (idCarPart) references OrderService(idOrderService)  
);
