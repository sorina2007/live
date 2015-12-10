SELECT * FROM northwind.products;
select * from suppliers;

select count(*), supplierid, productname from products group by SupplierID; -- not really valid
select count(*), supplierid from products group by SupplierID; -- ok, pentru ca nu grupeaza o coloana care nu poate fi grupata



select count(*), suppliers.supplierid, companyname, contactname from products inner join suppliers on suppliers.supplierid = products.supplierid group by SupplierID; -- ok, pentru ca nu grupeaza o coloana care nu poate fi grupata


select count(supplierid) from products;




select * from products;

select * from products limit 40;

select * from products where productid = 1 or productid = 2 or productid= 5 or productid = 9;
select * from products where productid in (1,2,5,9);


select avg(unitprice) from products;


-- all us 


create table persoane(id int primary key auto_increment, nume varchar(240));
insert into persoane(nume) values('Ion'), ('John');

select count(*) from persoane;
select count(nume) from persoane;

insert into persoane() values();


update persoane set nume = 'Bill' where id = 3;

alter table persoane add column varsta int;

update persoane set varsta = 30;

select * from persoane;

select avg(varsta) from persoane;
select max(varsta) from persoane;

-- numele persoanei cu varsta cea mai mare
select max(varsta), nume from persoane;

-- selectam persoana / persoanele care au id-ul egal cu persoana cu id-ul si varsta cea mai mare
select nume from persoane where varsta = max(varsta);


select max(varsta) from persoane;
select nume from persoane where varsta = 55;



select max(varsta) from persoane;
select nume, varsta from persoane where varsta = (select max(varsta) from persoane);




-- persoanele cu varsta peste medie
select nume, varsta from persoane where varsta > (select avg(varsta) from persoane);
select avg(varsta) from persoane;


create table vanzari(id int primary key auto_increment, valoare int, persoana_id int, foreign key(persoana_id) references persoane(id));
select * from vanzari;


select persoane.nume, vanzari.valoare from persoane inner join vanzari on persoane.id = vanzari.persoana_id;
select persoane.nume, sum(vanzari.valoare) from persoane inner join vanzari on persoane.id = vanzari.persoana_id  group by persoane.id having sum(vanzari.valoare) > (select avg(valoare) from vanzari);

select sum(valoare) from vanzari group by persoana_id;
select avg(valoare) from vanzari group by persoana_id;
select avg(valoare) from vanzari;
select avg(valoare) from vanzari group by persoana_id having avg(valoare) > 200;
select avg(valoare) from vanzari where avg(valoare) > 200;

select avg(select sum(vanzari.valoare) from persoane inner join vanzari on persoane.id = vanzari.persoana_id group by persoane.id) ;


select persoane.nume, vanzari.valoare from persoane inner join vanzari on persoane.id = vanzari.persoana_id;

-- selectam toate persoanele care au cel putin 2 vanzari

select vanzari.id, vanzari.valoare, vanzari.persoana_id from vanzari;


select count(*) from vanzari group by persoana_id;
select count(*), persoana_id from vanzari group by persoana_id having count(*) = 2;

select  persoana_id from vanzari group by persoana_id having count(*) = 2;
select persoane.nume from persoane where id in (select  persoana_id from vanzari group by persoana_id having count(*) = 2);