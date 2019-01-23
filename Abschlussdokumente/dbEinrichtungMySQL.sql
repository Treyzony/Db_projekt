CREATE TABLE Person (
	person_id int NOT NULL AUTO_INCREMENT,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email_id varchar(50) NOT NULL,
	username varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	city varchar(100) NOT NULL,
	zip varchar(100),
	street varchar(100) NOT NULL,
	customer_rating DECIMAL(3,1),
	CONSTRAINT pk_person PRIMARY KEY (person_id),
	CONSTRAINT uc_person UNIQUE (username)
);

CREATE INDEX idx_person_id_username
ON Person (person_id, username);

CREATE TABLE Collaborator (
	collaborator_id int NOT NULL AUTO_INCREMENT,
	person_id int NOT NULL,
	permission_lvl DECIMAL(2) NOT NULL,
	CONSTRAINT pk_collaborator PRIMARY KEY (collaborator_id),
	CONSTRAINT collab_fk_person FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE INDEX idx_collaborator_id
ON Collaborator (collaborator_id);

CREATE TABLE Event (
	event_id int NOT NULL AUTO_INCREMENT,
	collaborator_id int NOT NULL,
	name varchar(100) NOT NULL,
	description LONGTEXT,
	start_date DATETIME NOT NULL,
	end_date DATETIME NOT NULL,
	CONSTRAINT pk_event PRIMARY KEY (event_id),
	CONSTRAINT event_fk_collaborator FOREIGN KEY (collaborator_id) REFERENCES Collaborator(collaborator_id)
);

CREATE INDEX idx_event_id
ON Event (event_id);

CREATE TABLE News (
	news_id int NOT NULL AUTO_INCREMENT,
	collaborator_id int NOT NULL,
	name varchar(100) NOT NULL,
	start_date DATETIME NOT NULL,
	end_date DATETIME NOT NULL,
	message LONGTEXT,
	CONSTRAINT pk_news PRIMARY KEY (news_id),
	CONSTRAINT news_fk_collaborator FOREIGN KEY (collaborator_id) REFERENCES Collaborator(collaborator_id)
);

CREATE INDEX idx_news_id
ON News (news_id);

CREATE TABLE Marketplace (
	marketplace_id int NOT NULL AUTO_INCREMENT,
	owner_id int NOT NULL,
	name varchar(100) NOT NULL,
	rating DECIMAL(3,1),
	CONSTRAINT pk_marketplace PRIMARY KEY (marketplace_id),
	CONSTRAINT market_fk_owner FOREIGN KEY (owner_id) REFERENCES Person(person_id)
);

CREATE INDEX idx_marketplace_id
ON Marketplace (marketplace_id);

CREATE TABLE Evaluation (
	evaluation_id int NOT NULL AUTO_INCREMENT,
	rating DECIMAL(19,2) NOT NULL,
	qualtity varchar(50) NOT NULL,
	evaluation_comment LONGTEXT,
	CONSTRAINT pk_evaluation PRIMARY KEY (evaluation_id)
);

CREATE INDEX idx_evaluation_id
ON Evaluation (evaluation_id);

CREATE TABLE Category (
	category_id int NOT NULL AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	description LONGTEXT,
	CONSTRAINT pk_category PRIMARY KEY (category_id)
);

CREATE INDEX idx_category_id
ON Category (category_id);

CREATE TABLE Card_Design (
	card_design_id int NOT NULL AUTO_INCREMENT,
	image varchar(100),
	cover varchar(100),
	CONSTRAINT pk_card_design PRIMARY KEY (card_design_id)
);

CREATE INDEX idx_card_design_id
ON Card_Design (card_design_id);

CREATE TABLE Merch (
	merch_id int NOT NULL AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	typename varchar(50) NOT NULL,
	CONSTRAINT pk_merch PRIMARY KEY (merch_id)
);

CREATE INDEX idx_merch_id
ON Merch (merch_id);

CREATE TABLE Card (
	card_id int NOT NULL AUTO_INCREMENT,
	name varchar(30) NOT NULL,
	converted_mana_cost DECIMAL(2),
	typename varchar(50),
	subtypename varchar(59),
	powercnt DECIMAL(2),
	toughness DECIMAL(2),
	rules varchar(200),
	rarity char(1),
	other_criteria varchar(50),
	in_state varchar(30),
	card_color char(1),
	card_language varchar(50),
	artistname varchar(100),
	card_design_id int,
	name_CN varchar(30),
	name_TW varchar(30),
	name_FR varchar(30),
	name_DE varchar(30),
	name_IT varchar(30),
	name_JP varchar(30),
	name_PT varchar(30),
	name_RU varchar(30),
	name_ES varchar(30),
	name_KO varchar(30),
	type_CN varchar(30),
	type_TW varchar(50),
	type_FR varchar(50),
	type_DE varchar(50),
	type_IT varchar(50),
	type_JP varchar(50),
	type_PT varchar(50),
	type_RU varchar(50),
	type_ES varchar(50),
	type_KO varchar(50),
	CONSTRAINT pk_card PRIMARY KEY (card_id),
	CONSTRAINT card_fk_card_design FOREIGN KEY (card_design_id) REFERENCES Card_Design(card_design_id),
	CONSTRAINT card_domain_color CHECK (card_color IN ('W', 'U', 'B', 'R', 'G')),
	CONSTRAINT card_domain_language CHECK (card_language IN ('German', 'English', 'French', 'Italian',
	'Spanish', 'Portoguese', 'Russian', 'Korean', 'Japanese', 'S-Chinese', 'T-Chinese', 'Dead Language'))
);

CREATE INDEX idx_card_id_name
ON Card (card_id, name);

CREATE TABLE Card_Set (
	set_id int NOT NULL AUTO_INCREMENT,
	name varchar(50),
	short varchar(4),
	max_cards DECIMAL(3,0),
	CONSTRAINT pk_set PRIMARY KEY (set_id)
);

CREATE INDEX idx_card_set_id
ON Card_Set (set_id);

CREATE TABLE Cards_In_Set (
	set_id int NOT NULL AUTO_INCREMENT,
	card_id int NOT NULL,
	number_in_set DECIMAL(3,0),
	CONSTRAINT cis_fk_set_id FOREIGN KEY (set_id) REFERENCES Card_Set(set_id),
	CONSTRAINT cis_fk_card_id FOREIGN KEY (card_id) REFERENCES Card(card_id),
	CONSTRAINT pk_cis PRIMARY KEY (set_id, card_id)
);

CREATE INDEX idx_cards_in_set_ids
ON Cards_In_Set (set_id, card_id);

CREATE TABLE Product (
	product_id int NOT NULL AUTO_INCREMENT,
	marketplace_id int NOT NULL,
	price DECIMAL(19,2) NOT NULL,
	model varchar(50),
	stock DECIMAL(38),
	category_id int NOT NULL,
	card_id int,
	card_set_id int,
	merch_id int,
	evaluation_id int,
	CONSTRAINT prod_stock_gon CHECK (stock>=0),
	CONSTRAINT pk_product PRIMARY KEY (product_id),
	CONSTRAINT product_fk_category FOREIGN KEY (category_id) REFERENCES Category(category_id),
	CONSTRAINT product_fk_card FOREIGN KEY (card_id) REFERENCES Card(card_id),
	CONSTRAINT product_fk_card_set FOREIGN KEY (card_set_id) REFERENCES Card_Set(set_id),
	CONSTRAINT product_fk_merch FOREIGN KEY (merch_id) REFERENCES Merch(merch_id),
	CONSTRAINT product_fk_evaluation FOREIGN KEY (evaluation_id) REFERENCES Evaluation(evaluation_id),
	CONSTRAINT product_fk_marketplace FOREIGN KEY (marketplace_id) REFERENCES Marketplace(marketplace_id)
);

CREATE INDEX idx_product_ids
ON Product (product_id, marketplace_id);

CREATE TABLE Discount (
	discount_id int NOT NULL AUTO_INCREMENT,
	product_id int,
	category_id int,
	event_id int,
	name varchar(50),
	discount_rate DECIMAL(4,3),
	CONSTRAINT chk_just_one CHECK ((product_id = NULL AND category_id != NULL)
		OR (product_id != NULL AND category_id = NULL)),
	CONSTRAINT pk_discount PRIMARY KEY (discount_id),
	CONSTRAINT disc_fk_product FOREIGN KEY (product_id) REFERENCES Product(product_id),
	CONSTRAINT disc_fk_category FOREIGN KEY (category_id) REFERENCES Category(category_id),
	CONSTRAINT disc_fk_event FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

CREATE INDEX idx_discount_ids
ON Discount (discount_id, product_id, category_id);

CREATE TABLE Cart (
	cart_id int NOT NULL AUTO_INCREMENT,
	buyer_id int NOT NULL,
	name varchar(50),
	date_of_creation DATE,
	CONSTRAINT pk_cart PRIMARY KEY (cart_id),
	CONSTRAINT fk_buyer_id FOREIGN KEY (buyer_id) REFERENCES Person(person_id)
);

CREATE INDEX idx_cart_ids
ON Cart (cart_id, buyer_id);

CREATE TABLE Cart_Item (
	cart_item_id int NOT NULL AUTO_INCREMENT,
	cart_id int NOT NULL,
	product_id int NOT NULL,
	quantity DECIMAL(3,0) NOT NULL DEFAULT 1,
	cost_at_time DECIMAL(19,02) NOT NULL,
	CONSTRAINT pk_cart_item PRIMARY KEY (cart_item_id),
	CONSTRAINT ci_fk_cart FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
	CONSTRAINT ci_fk_product FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE INDEX idx_cart_item_ids
ON Cart_Item (cart_item_id, cart_id, product_id);