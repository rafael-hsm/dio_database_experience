-- Insert data and queries

-- show databases;
use e_commerce_v_02;
show tables;

-- tables Person, LegalPerson, NaturalPerson, DeliveryAddress, Product, Stock, Order, Payment

-- insert Person
insert into Person(username, email, PF, PJ) values
('username', 'my_email@gmail.com', 'Y','N'),
('username2', 'my_email2@gmail.com', 'Y','N'),
('username3', 'my_email3@gmail.com', 'Y','N'),
('username4', 'my_email4@gmail.com', 'Y','N'),
('username5', 'my_email5@gmail.com', 'N','Y'),
('username6', 'my_email6@gmail.com', 'N','Y'),
('username7', 'my_email7@gmail.com', 'N','Y');

select * from Person;

desc LegalPerson;
 
-- insert Legal Person
insert into LegalPerson(`company Name`, `registration Number`, Region, City, Phone, LPusername, person_idClient) values
("Brothers and Brothers LTDA", "02853859000189", "GO", "Jataí", "64989568563", "username5", 5),
("Sisters and Sisters LTDA", "05356951000153", "GO", "Jataí", "74989568563", "username6", 6),
("Sibling and Sibling LTDA", "09421456000196", "GO", "Jataí", "84989568563", "username7", 7)
;

select * from LegalPerson;

desc NaturalPerson; 
-- insert Natural Person
insert into NaturalPerson(Fname, Lname, CPF, phone, NPusername, Person_idClient) values
("Pedro", "Sousa", 43717084712, 8226538168, "username", 1),
("Augusto", "Silva", 57215712338, 7331122863, "username2", 2),
("Ana", "Cordeiro", 68328264781, 4134254886, "username3", 3),
("Fernanda", "Ribeiro", 42610202709, 9734811374, "username4", 4)
;

select * from NaturalPerson;