INSERT INTO Customer (Cname, Caddress, Ccontact) VALUES ('Bento Meireles', 'Address A', '645128976');
INSERT INTO Customer (Cname, Caddress, Ccontact) VALUES ('Ana Braz', 'Address B', '853467952');
INSERT INTO Customer (Cname, Caddress, Ccontact) VALUES ('Igor Silva', 'Address C', '142368957');

INSERT INTO Vehicle (Vplate, Vmodel, Vyear) VALUES ('OJTA0248', 'HB20', 2016);
INSERT INTO Vehicle (Vplate, Vmodel, Vyear) VALUES ('POQE9135', 'Corolla', 2017);
INSERT INTO Vehicle (Vplate, Vmodel, Vyear) VALUES ('LNTA7258', 'Fusca', 1975);

INSERT INTO Mechanic (Mcode, Mname, Maddress, Mspecialty) VALUES ('1', 'Ricardo Souza', 'Address D', 'brake');
INSERT INTO Mechanic (Mcode, Mname, Maddress, Mspecialty) VALUES ('2', 'Pablo Medeiros', 'Address E', 'hidraulic');
INSERT INTO Mechanic (Mcode, Mname, Maddress, Mspecialty) VALUES ('3', 'Carla Ribeiro', 'Address F', 'paint');

INSERT INTO OrderService (OSdelivery_date, OSnumber, OSissue_Date, OSamount, OSstatus) VALUES (2022/09/01, '0001', 2022/09/08, 'Authorized', 376.46);
INSERT INTO OrderService (OSdelivery_date, OSnumber, OSissue_Date, OSamount, OSstatus) VALUES (2022/09/02, '0002', 2022/09/02, 'Finished', 150.00);
INSERT INTO OrderService (OSdelivery_date, OSnumber, OSissue_Date, OSamount, OSstatus) VALUES (2022/09/02, '0003', 2022/09/16, 'Authorized', 1521.39);

INSERT INTO Reference_Table (RTemployee, RTvalue_labour, RTprice_car_part) VALUES ('Battery and alignment', 350.30, 102.30);
INSERT INTO Reference_Table (RTemployee, RTvalue_labour, RTprice_car_part) VALUES ('Battery and motor', 3100.36, 850.00);
INSERT INTO Reference_Table (RTemployee, RTvalue_labour, RTprice_car_part) VALUES ('Motor', 1900.92, 800.00);

INSERT INTO Services (Sidentification, Svalue) VALUES ('Painting', 3500.00);
INSERT INTO Services (Sidentification, Svalue) VALUES ('Revision', 250.00);
INSERT INTO Services (Sidentification, Svalue) VALUES ('Motor', 2500.00);

INSERT INTO CarPart (CPquantity, CPidentification, CPvalues) VALUES (8, 'Pains', 95.20);
INSERT INTO CarPart (CPquantity, CPidentification, CPvalues) VALUES (1, 'Battery', 190.99);
INSERT INTO CarPart (CPquantity, CPidentification, CPvalues) VALUES (1, 'Motor-power-driven', 1300.00);


-- CREATING QUERIES


-- Filters with WHERE Statement
select * from Vehicle where Model = 'Fusca';

-- Create expressions to generate derived attributes
select (Service_Value + Part_Value) AS Total_Value from Reference_Table;

-- Set data ordering with ORDER BY
select ID, Value from Services order by Value desc;

-- Simple retrievals with SELECT Statement
select * from Vehicle;

-- Filter conditions for groups – HAVING Statement
select Number, Value, Status from Service_Order group by Status having Value > 300.00;

-- Create joins between tables to provide a more complex perspective on the data
select *
    from Services AS s, Parts AS p
    inner join ID
    on s.Identification = p.Identification