-- criação do banco de dados para o cenário de ecommerce

CREATE DATABASE ecommerce;

USE ecommerce;


-- criar tabela cliente

CREATE TABLE IF NOT EXISTS client(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
	fName VARCHAR(10),
	mInit CHAR(3),
	lName VARCHAR(20),
	cpf CHAR(11) NOT NULL,
	address VARCHAR(255),
	CONSTRAINT unique_cpf_client UNIQUE (cpf)
);

-- criar tabela produto

CREATE TABLE IF NOT EXISTS product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45),
	category VARCHAR(20) NOT NULL,
	rating FLOAT DEFAULT 0,
	weight VARCHAR(10)
);


-- criar tabela pedido

CREATE TABLE IF NOT EXISTS orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
	idOrderClient INT,
	orderStatus ENUM("Cancelado", "Confirmado", "Em processamento") NOT NULL,
	orderDescription VARCHAR(255),
	shipping FLOAT,
	CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES client(idClient)
);


-- criar tabela pagamento

CREATE TABLE IF NOT EXISTS payment(
	idClient INT,
	idPayment INT,
	paymentType ENUM("Boleto", "Cartao", "Dois cartoes"),
	availableLimit FLOAT,
	PRIMARY KEY (idClient, idPayment)
);

-- criar tabela estoque

CREATE TABLE IF NOT EXISTS storage(
	idStorage INT AUTO_INCREMENT PRIMARY KEY,
	storageLocation VARCHAR(255),
	quantity INT DEFAULT 0
);

-- criar tabela fornecedor

CREATE TABLE IF NOT EXISTS supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
	phone VARCHAR(20) NOT NULL,
	name VARCHAR(255) NOT NULL,
	cnpj CHAR(15) NOT NULL,
	CONSTRAINT unique_supplier UNIQUE (cnpj)
);

-- criar tabela vendedor

CREATE TABLE IF NOT EXISTS seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	cnpj CHAR(15) NOT NULL,
	cpf CHAR(11) NOT NULL,
	phone VARCHAR(20) NOT NULL,
	CONSTRAINT unique_seller_cnpj UNIQUE (cnpj),
	CONSTRAINT unique_seller_cpf UNIQUE (cpf)
);

-- criar tabela produto_vendedor

CREATE TABLE IF NOT EXISTS productSeller(
	idSeller INT,
	idProduct INT,
	quantity INT NOT NULL DEFAULT 0,
	PRIMARY KEY (idSeller, idProduct),
	CONSTRAINT fk_product_seller FOREIGN KEY (idSeller) REFERENCES seller(idSeller),
	CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);


-- criar tabela pedido_produto

CREATE TABLE IF NOT EXISTS orderProduct(
	idOrder INT,
	idProduct INT,
	quantity INT NOT NULL DEFAULT 0,
	PRIMARY KEY (idOrder, idProduct),
	CONSTRAINT fk_order_product FOREIGN KEY (idProduct) REFERENCES product(idProduct),
	CONSTRAINT fk_order_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder)
);

-- criar tabela produto_estoque

CREATE TABLE IF NOT EXISTS productStorage(
	idProduct INT,
	idStorage INT,
	quantity INT NOT NULL DEFAULT 0,
	PRIMARY KEY (idProduct, idStorage),
	CONSTRAINT fk_product_storage FOREIGN KEY (idStorage) REFERENCES storage(idStorage),
	CONSTRAINT fk_productStorage_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

-- criar tabela produto_fornecedor

CREATE TABLE IF NOT EXISTS productSupplier(
	idProduct INT,
	idSupplier INT,
	price FLOAT NOT NULL,
	quantity INT NOT NULL DEFAULT 0,
	PRIMARY KEY (idProduct, idSupplier),
	CONSTRAINT fk_product_supplier FOREIGN KEY (idSupplier) REFERENCES supplier(idSupplier),
	CONSTRAINT fk_productSupplier_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
); 
