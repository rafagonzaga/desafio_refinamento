-- Inserindo dados e realizando consultas
use ecommerce;

show tables;

insert into clients(Fname, Minit, Lname, CPF, Address)
	values
    ('Maria', 'M', 'Silva', 1234678911, 'Rua Silva de Prata 29, Carangola - Cidade das Flores'),
    ('Matheus', 'O', 'Pimentel', 98765432111, 'Rua Almeida 289, Centro - Cidade das Flores'),
    ('Ricardo', 'F', 'Silva', 4567891311, 'Avenida Vinha 1009, Centro - Cidade das Flores'),
    ('Julia', 'S', 'França', 78912345611, 'Rua Laranjeiras 861, Centro - Cidade das Flores'),
    ('Roberta', 'G', 'Assis', 9874563211, 'Avenida Koller 19, Centro - Cidade das Flores'),
    ('Isabela', 'M', 'Cruz', 65478912311, 'Alameda das Flores 28, Centro - Cidade das Flores')
    ;
-- select * from clients;

insert into product (Pname, classification_kids, category, avaliação, size)
	values
    ('Fone de ouvido', false, 'Eletronico', '4', null),
    ('Barbie Elsa', true, 'Brinquedos', '3', null),
    ('Body Carters', true, 'Vestuario', '5', null),
    ('Microfone Vedo - Youtuber', false, 'Eletronico', '4', null),
    ('Sofá retrátil', false, 'Moveis', '3', '3x57x80'),
    ('Farinha de arroz', false, 'Alimentos', '2', null),
    ('Fire Stick Amazon', false, 'Eletronico', '3', null);

select * from product;
-- delete from orders where idOrderClient in (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
	values 
    (1, default, 'compra via aplicativo', null, 1),
    (2, default, 'compra via aplicativo', 50, 0),
    (3, 'Confirmado', null, null, 1),
    (4, default, 'compra via website', 150, 0)
    ;
select * from orders;

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
	values
    (1, 9, 2, null),
    (2, 9, 1, null),
    (3, 10, 1, null)
    ;
    
insert into productStorage (storageLocation, quantity)
	values
    ('Rio de Janeiro', 1000),
    ('Rio de Janeiro', 500),
    ('São Paulo', 10),
    ('São Paulo', 100),
    ('São Paulo', 10),
    ('Brasília', 60)
    ;

insert into storageLocation(idLproduct, idLstorage, location)
	values
    (1, 2, 'RJ'),
    (2, 6, 'GO')
    ;

insert into supplier(socialName, CNPJ, contact)
    values
    ('Almeida e filhos', 123456789123456, '21985474'),
    ('Eletronicos Silva', 852741963789456, '21985484'),
    ('Eletronicos Valma', 934567893934695, '21975474')
    ;

-- select * from supplier;

insert into seller (socialName, abstractName, CNPJ, CPF, location, contact)
	values
    ('Tech Electronics', null, 123456789123456, null, 'Rio de Janeiro', 219946287),
    ('Botique Durgas', null, null, 12345678911, 'Rio de Janeiro', 219567895),
    ('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484)
    ;

-- 7h16
select * from seller;
insert into productSeller(idPseller, idPproduct, prodQuantity)
	values
    (4, 6, 80),
    (5, 7, 10);

-- Número de clientes
select count(*) from clients;

select * from clients as c, orders as o where c.idClient = idOrderClient;

select concat(Fname, ' ', Lname) as Client, idOrder as Pedido, orderStatus as Status from clients as c, orders as o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
	values 
    (2, default, 'compra via aplicativo', null, 1)
    ;

select count(*) from clients as c, orders as o 
	where c.idClient = idOrderClient
	group by idOrder;

-- Recuperação de pedidos com produtos associados    
select * from clients as c
	inner join orders as o on c.idClient = o.idOrderClient
    inner join productOrder as p on p.idPOorder = o.idOrder
    group by idClient;

-- Recuperar quantos pedidos foram realizados pelos clientes    
select c.idClient, Fname, count(*) as Number_of_orders from clients as c
	inner join orders as o on c.idClient = o.idOrderClient
    -- inner join productOrder as p on p.idPOorder = o.idOrder
    group by idClient;