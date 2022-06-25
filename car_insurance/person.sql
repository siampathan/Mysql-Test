-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2022 at 04:52 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6


--most use command
--select * from table-name; for display table data
--describe table-name; for see table info

-- First table
 
 show databases;
 Create database car_insurance;
 Use  car_insurance;

  create table person (
    driver_id  varchar(20) not null primary key ,
    name varchar(20)  ,
    address varchar (20)
  );

  create table car (
    license  varchar(20) not null primary key ,
    model varchar(20)  ,
    year varchar (20)
  );

  create table accident (
    report_no  varchar(20) not null primary key ,
    date Timestamp not null default Current_Timestamp,
    location varchar (20)
  );

  create table owns (
    driver_id  varchar(20) not null ,
    license  varchar(20) not null ,
    primary key (driver_id , license) ,
    foreign key (driver_id) references person (driver_id) ,
    foreign key (license) references car (license)     
  );

  create table participated (
    driver_id  varchar(20) not null ,
    license  varchar(20) not null ,
    report_no  varchar(20) not null ,
    damage_amount varchar(20) ,
    primary key (driver_id , license, report_no) ,
    foreign key (driver_id) references person (driver_id) ,
    foreign key (license) references car (license) ,
    foreign key (report_no) references accident (report_no)
  );

  Insert Into person (driver_id,name,address) values
    ('d101','Rahim','Lalbagh'),
    ('d102','Karim','Jigatola'),
    ('d103','Simanto','Dhanmondi'),
    ('d104','Saiful','Mohammadpur');

  Insert Into car (license,model,year) values
    ('Dhaka1000', 'Audi' , '2018' ) ,
    ('Dhaka2000', 'Bmw' , '2018' ) ,
    ('Dhaka3000', 'Toyota' , '2018' ) ,
    ('Dhaka4000', 'Corolla' , '2018' ) ;

   Insert Into accident (report_no,date,location) values
    ('AR2195', '2018-01-01' , 'Shahbagh' ) ,
    ('AR2196', '2018-05-10' , 'Nilkhet' ) ,
    ('AR2197', '2018-08-18' , 'Sciencelab' ) ,
    ('AR2198', '2018-09-21' , 'Polton' ) ;

  Insert Into owns (driver_id, license) values
    ('d102', 'Dhaka2000') ,
    ('d103',  'Dhaka3000') ,
    ('d104',  'Dhaka4000') ;

  Insert Into participated (driver_id, license,report_no,damage_amount) values
    ('d101', 'Dhaka1000', 'AR2195','2000') ,
    ('d102', 'Dhaka2000', 'AR2196','3000') ,
    ('d103',  'Dhaka3000', 'AR2197','4000') ;

--update accident values
  Insert into accident values ('AR2199' , '2022-06-21', 'Nilkhet');

  DELETE FROM car WHERE model='Toyata'
   and license in(select `license` from person p, owns o where p.name='Simanto' and p.driver_id=o.driver_id);

   SELECT * FROM person, accident, participated
    WHERE accident.report_no=participated.report_no
    AND `date`>='2018-01-31' AND `date`<='208-12-31';

  --update damage amount
  update participated
    set damage_amount = 5400
    where report_no = 'AR2197'
    and driver_id
    in (select driver_id from owns where license = 'Dhaka3000');