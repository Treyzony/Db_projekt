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
LEFT JOIN Evaluation ON Product.evaluation_id = Evaluation.evaluation_id
