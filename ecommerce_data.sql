-- inserção de dados e queries
USE ecommerce;

SHOW TABLES;

-- idClient fName, mInit, lName, cpf, address

INSERT INTO client (fName, mInit, lName, address, cpf)
	 VALUES ("Aristotle", "P.", "Hansen", "Ap #755-4634 Nunc Av. 7798 Santa Catarina United Kingdom","20472521-7"),
			("Bruno", "F.", "Heath", "276-1905 Netus Road 840339 Maranhão Singapore","4630317-2"),
			("Jael", "O.", "Mcmahon", "P.O. Box 514, 2192 Est Rd. 418769 Pernambuco Australia","18170993-6"),
			("Cedric", "M.", "Madden","416-9346 Tortor Rd. 63-580 Goiás Spain","37196935-7"),
			("Phillip", "C.", "Merritt","855-3611 Adipiscing Street 144017 Pernambuco Vietnam","43430894-1");
            
-- 	idProduct, name, category, rating, weight

INSERT INTO product (name, category, rating, weight)
	VALUES ("Fone de ouvido", "Eletronico", 4, 50),
			("Batman", "Heroi", 5, 33),
            ("Carro", "Carro", 1, 2395),
            ("Microfone", "Youtube", 3, 80),
            ("Sofá", "Móvel", 2, 140);

SELECT * FROM client;		
-- idProduct