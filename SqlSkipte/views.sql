CREATE VIEW Userdata AS
SELECT first_name, last_name, email_id, username, address, customer_rating, permission_lvl
FROM Person LEFT JOIN Collaborator ON Person.person_id = Collaborator.person_id;

CREATE VIEW Eventinfo AS
SELECT Event.name AS eventname, Event.description, Event.start_date, Event.end_date, Person.username, Person.first_name,
Person.last_name, Collaborator.permission_lvl, Discount.name AS discountname, Discount.discount_rate
FROM Event JOIN Collaborator ON Event.collaborator_id = Collaborator.collaborator_id
LEFT JOIN Person ON Collaborator.person_id = Person.person_id
LEFT JOIN Discount ON Discount.event_id = Event.event_id;

CREATE VIEW Newsinfo AS
SELECT News.name, News.message, News.start_date, News.end_date, Person.username, Person.first_name,
Person.last_name, Collaborator.permission_lvl
FROM Event JOIN Collaborator ON News.collaborator_id = Collaborator.collaborator_id
LEFT JOIN Person ON Collaborator.person_id = Person.person_id;

CREATE VIEW Product_Discountinfo AS
SELECT Discount.discount_id, Discount.name AS discountname, Discount.discount_rate, Product.product_id,
Product.marketplace_id, Marketplace.name AS marketplacename Product.stock, Product.price, Category.name
FROM Discount JOIN Product ON Discount.product_id = Product.product_id
JOIN Category ON Product.category_id = Category.category_id
JOIN Marketplace ON Product.marketplace_id = Marketplace.marketplace_id
WHERE Discount.category_id = NULL
GROUP BY Discount.discount_id, Marketplace.name
ORDER BY Product.product_id;

--Discountinfos für Categorys

CREATE VIEW Marketplaceinfo AS
SELECT Marketplace.name, Marketplace.rating, Person.username, Person.first_name, Person.last_name,
Person.email_id
FROM Marketplace JOIN Person ON Marketplace.owner_id = Person.person_id;

CREATE VIEW Productinfo AS
SELECT Product.price, Product.model, Product.stock, Category.name AS categoryname, Category.description,
Card.name AS cardname, Card_Set.name AS card_setname, Merch.name AS merchname, Evaluation AS evaluationname
FROM Product JOIN Category ON Product.category_id = Category.category_id
LEFT JOIN Card ON Product.card_id = Card.card_id
LEFT JOIN Card_Set ON Product.card_set_id = Card_Set.set_id
LEFT JOIN Merch ON Product.merch_id = Merch.merch_id
LEFT JOIN Evaluation ON Product.evaluation_id = Evaluation.evaluation_id;

CREATE VIEW Cardinfo AS
SELECT Card.name, Card.converted_mana_cost, Card.typename, Card.subtypename, Card.powercnt, Card.toughness,
Card.rules, Card.rarity, Card.other_criteria, Card.in_state, Card.card_color, Card.card_language,
CONCAT(Artist.first_name, CONCAT(' ', Artist.last_name)) AS artistname, Card_Design.image, Card_Design.cover
FROM Card LEFT JOIN Artist ON Card.artist_id = Artist.artist_id
LEFT JOIN Card_Design ON Card.card_design_id = Card_Design.card_design_id;

CREATE VIEW Cart_Overview AS
SELECT Cart.cart_id, Cart.name AS cartname, Cart.buyer_id, Cart.date_of_creation, CONCAT(Person.first_name, CONCAT(' ', Person.last_name)) AS buyername,
Cart_Item.quantity, Cart_Item.cost_at_time, Product.product_id, Product.price AS current_price, Product.stock,
Category.name AS categoryname, Marketplace.marketplace_id, Marketplace.name
FROM Cart_Item JOIN Cart ON Cart_item.cart_id = Cart.cart_id
JOIN Product ON Cart_Item.product_id = Product.product_id
JOIN Person ON Cart.buyer_id = Person.person_id
JOIN Marketplace ON Product.marketplace_id = Marketplace.marketplace_id
GROUP BY Cart.cart_id;

CREATE VIEW Card_Set_Overview AS
SELECT Card_Set.set_id, Card_Set.name, Card_Set.max_cards, Card.card_id, Card.name, Cards_In_Set.number_in_set
FROM Card_Set LEFT JOIN Cards_In_Set ON Card_Set.set_id = Cards_In_Set.set_id
LEFT JOIN Card ON Cards_In_Set.card_id
GROUP BY Card_Set.set_id
ORDER BY Cards_In_Set.number_in_set;