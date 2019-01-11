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

CREATE Admins (
	admin_id int NOT NULL,
	person_id int NOT NULL,
	CONSTRAINT pk_admins PRIMARY KEY (admin_id),
	CONSTRAINT admins_fk_person FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

CREATE Event (
	event_id int NOT NULL,
	admin_id int NOT NULL,
	name varchar(100) NOT NULL,
	description LONGTEXT,
	start_date DATETIME NOT NULL,
	end_date DATETIME NOT NULL,
	CONSTRAINT pk_event PRIMARY KEY (event_id),
	CONSTRAINT event_fk_admins FOREIGN KEY (admin_id) REFERENCES Admins(admin_id)
);

CREATE News (
	news_id int NOT NULL,
	admin_id int NOT NULL,
	name varchar(100) NOT NULL,
	start_date DATETIME NOT NULL,
	end_date DATETIME NOT NULL,
	message LONGTEXT,
	CONSTRAINT pk_news PRIMARY KEY (news_id),
	CONSTRAINT news_fk_admins FOREIGN KEY (admin_id) REFERENCES Admins(admin_id)
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
	CONSTRAINT pk_category PRIMARY KEY (category_id)
);

CREATE Card (
	card_id int NOT NULL,
	converted_mana_cost varchar(30),
	typename varchar(50),
	subtypename varchar(59),
	powercnt DECIMAL(2),
	toughness DECIMAL(2),
	rules varchar(100),
	rarity varchar(30),
	other_criteria varchar(50),
	in_state varchar(30),
	color_name varchar(20) NOT NULL,
	card_language varchar(50) NOT NULL,
	artist_id int NOT NULL,
	card_design_id int NOT NULL,
	CONSTRAINT pk_card PRIMARY KEY (card_id),
	CONSTRAINT card_fk_color FOREIGN KEY (color_name) REFERENCES Color(color_name),
	CONSTRAINT card_fk_language FOREIGN KEY (card_language) REFERENCES Card_Language(card_language),
	CONSTRAINT card_fk_artist FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
	CONSTRAINT card_fk_card_design FOREIGN KEY (card_design_id) REFERENCES Card_Design(card_design_id)
);

CREATE Color (
	color_name varchar(20) NOT NULL,
	CONSTRAINT pk_color PRIMARY KEY (color_name)
);

CREATE Card_Language (
	card_language varchar(50),
	CONSTRAINT pk_language PRIMARY KEY (card_language)
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

CREATE Cart (
	cart_id int NOT NULL,
	name varchar(50),
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
	CONSTRAINT ci_fk_product FOREIGN KEY (product_id) REFERENCES Product(product_id),
);
