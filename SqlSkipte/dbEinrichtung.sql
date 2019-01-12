CREATE Person (
	person_id int NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email_id varchar(50) NOT NULL,
	username varchar(50) NOT NULL,
	password varchar(50) NOT NULL,
	address varchar(100) NOT NULL,
	customer_rating DECIMAL(3,1),
	CONSTRAINT pk_person PRIMARY KEY (person_id)
);

CREATE Collaborator (
	collaborator_id int NOT NULL,
	person_id int NOT NULL,
	permission_lvl DECIMAL(2) NOT NULL,
	CONSTRAINT pk_collaborator PRIMARY KEY (collaborator_id),
	CONSTRAINT collab_fk_person FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE Event (
	event_id int NOT NULL,
	collaborator_id int NOT NULL,
	name varchar(100) NOT NULL,
	description LONGTEXT,
	start_date DATETIME NOT NULL,
	end_date DATETIME NOT NULL,
	CONSTRAINT pk_event PRIMARY KEY (event_id),
	CONSTRAINT event_fk_collaborator FOREIGN KEY (collaborator_id) REFERENCES Collaborator(collaborator_id)
);

CREATE News (
	news_id int NOT NULL,
	collaborator_id int NOT NULL,
	name varchar(100) NOT NULL,
	start_date DATETIME NOT NULL,
	end_date DATETIME NOT NULL,
	message LONGTEXT,
	CONSTRAINT pk_news PRIMARY KEY (news_id),
	CONSTRAINT news_fk_collaborator FOREIGN KEY (collaborator_id) REFERENCES Collaborator(collaborator_id)
);

CREATE Marketplace (
	marketplace_id int NOT NULL,
	owner_id int NOT NULL,
	name varchar(100) NOT NULL,
	rating FLOAT(3,1),
	CONSTRAINT pk_marketplace PRIMARY KEY (marketplace_id),
	CONSTRAINT market_fk_owner FOREIGN KEY (owner_id) REFERENCES Person(person_id)
);

CREATE Product (
	product_id int NOT NULL,
	marketplace_id int NOT NULL,
	price DECIMAL(19,2) NOT NULL,
	model varchar(50),
	stock DECIMAL(38),
	category_id int NOT NULL,
	CONSTRAINT prod_stock_gon CHECK (stock>=0),
	CONSTRAINT pk_product PRIMARY KEY (product_id),
	CONSTRAINT product_fk_category FOREIGN KEY (category_id) REFERENCES Category(category_id),
	CONSTRAINT product_fk_marketplace FOREIGN KEY (marketplace_id) REFERENCES Marketplace(marketplace_id)
);

CREATE Category (
	category_id int NOT NULL,
	name varchar(50) NOT NULL,
	description LONGTEXT,
	CONSTRAINT pk_category PRIMARY KEY (category_id)
);

CREATE Card (
	card_id int NOT NULL,
	converted_mana_cost DECIMAL(2),
	typename varchar(50),
	subtypename varchar(59),
	powercnt DECIMAL(2),
	toughness DECIMAL(2),
	rules varchar(100),
	rarity varchar(30),
	other_criteria varchar(50),
	in_state varchar(30),
	card_color varchar(20),
	card_language varchar(50),
	artist_id int NOT NULL,
	card_design_id int NOT NULL,
	CONSTRAINT pk_card PRIMARY KEY (card_id),
	CONSTRAINT card_fk_artist FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
	CONSTRAINT card_fk_card_design FOREIGN KEY (card_design_id) REFERENCES Card_Design(card_design_id),
	CONSTRAINT card_domain_language CHECK (card_color IN ('white', 'blue', 'black', 'red', 'green')),
	CONSTRAINT card_domain_language CHECK (card_language IN ('German', 'English', 'French', 'Italian',
	'Spanish', 'Portoguese', 'Russian', 'Korean', 'Japanese', 'S-Chinese', 'T-Chinese', 'Dead Language'))
);

CREATE Artist (
	artist_id int NOT NULL,
	first_name varchar(50),
	last_name varchar(50),
	CONSTRAINT pk_artist PRIMARY KEY (artist_id)
);

CREATE Card_Set (
	set_id int NOT NULL,
	name varchar(50),
	max_cards DECIMAL(3) NOT NULL,
	CONSTRAINT pk_set PRIMARY KEY (set_id)
);

CREATE Cards_In_Set (
	set_id int NOT NULL
	card_id int NOT NULL,
	number_in_set DECIMAL(3),
	CONSTRAINT cis_fk_set_id FOREIGN KEY (set_id) REFERENCES Card_Set(set_id),
	CONSTRAINT cis_fk_card_id FOREIGN KEY (card_id) REFERENCES Card(card_id),
	CONSTRAINT pk_cis PRIMARY KEY (set_id, card_id)
);

CREATE Merch (
	merch_id int NOT NULL,
	name varchar(50) NOT NULL,
	typename varchar(50) NOT NULL,
	CONSTRAINT pk_merch PRIMARY KEY (merch_id)
);

CREATE Evaluation (
	evaluation_id int NOT NULL,
	rating DECIMAL(19,2) NOT NULL,
	qualtity varchar(50) NOT NULL,
	evaluation_comment LONGTEXT,
	CONSTRAINT pk_evaluation PRIMARY KEY (evaluation_id)
);

CREATE Discount (
	discount_id int NOT NULL,
	product_id int NOT NULL,
	event_id int,
	name varchar(50),
	discount_rate DECIMAL(1,3),
	CONSTRAINT pk_discount PRIMARY KEY (discount_id),
	CONSTRAINT disc_fk_product FOREIGN KEY (product_id) REFERENCES Product(product_id),
	CONSTRAINT disc_fk_event FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

CREATE Cart (
	cart_id int NOT NULL,
	name varchar(50),
	date_of_creation DATE,
	CONSTRAINT pk_cart PRIMARY KEY (cart_id)
);

CREATE Cart_Item (
	cart_item_id int NOT NULL,
	cart_id int NOT NULL,
	product_id int NOT NULL,
	quantity DECIMAL(3) NOT NULL DEFAULT 1,
	cost_at_time DECIMAL(19,02) NOT NULL,
	CONSTRAINT pk_cart_item PRIMARY KEY (cart_item_id),
	CONSTRAINT ci_fk_cart FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
	CONSTRAINT ci_fk_product FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
