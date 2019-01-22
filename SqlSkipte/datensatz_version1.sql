


INSERT INTO `person` (`person_id`, `first_name`, `last_name`, `email_id`, `username`, `password`, `city`, `zip`, `street`, `customer_rating`) VALUES
(1, 'Cece', 'Kobpal', 'ckobpal0@linkedin.com', 'ceces', 'Uf22CX2L7JyF', 'Sungaiduri', '90', 'Mendota Avenue', NULL),
(3, 'Lorilyn', 'Goudy', 'lgoudy1@yelp.com', 'lori', 'S8qEuIw009', 'Sapouy', '23123', '088 Bartelt Drive', NULL),
(4, 'Maryjo', 'Cottie', 'mcottie2@free.fr', 'gsdfgsdfg', 'wqd0tUqQcFX', '?alw?n', '5806', '4079 Red Cloud Park', NULL),
(5, 'Mead', 'Jarlmann', 'mjarlmanna@themeforest.net', 'mjarlmanna', 'ImgE1zppq6K', 'Quatre Bornes', '45324525', '5 Jana Trail', NULL),
(6, 'Niall', 'Kynvin', 'nkynvine@xinhuanet.com', '', 'WHC5scFwMJ', 'Schieren', 'L-9184', 'hgdfh', NULL);

INSERT INTO `merch` (`merch_id`, `name`, `typename`) VALUES (NULL, 'Magic Karten T shirt', 'Kleidung'), (NULL, 'Magic Karten Pullover', 'Kleidung');

INSERT INTO `event` (`event_id`, `collaborator_id`, `name`, `description`, `start_date`, `end_date`) VALUES (NULL, '1', 'Black Friday', 'Jetz gibts rabat aktionen auf verschiedene Artikel', '2019-01-24 00:00:00', '2019-01-26 00:00:00'), (NULL, '1', 'Osterm', 'Alle rote Karten sid reduziert', '2019-01-24 00:00:00', '2019-01-25 00:00:00');

INSERT INTO `evaluation` (`evaluation_id`, `rating`, `qualtity`, `evaluation_comment`) VALUES (NULL, '6', 'sehr gut', 'Diese Karte ist selten und macht einen guten Eindruck\r\nSie ist im guten bis sehr gutem ZUstand'), (NULL, '2', 'schlecht', 'Die Karte hat starke abnnutzungserscheinungen und ist nicht gut verkäuflich');

INSERT INTO `category` (`category_id`, `name`, `description`) VALUES (NULL, 'Sommerset', 'Sommerkarten'), (NULL, 'Winterset', 'Winterkarten usw');

INSERT INTO `card_set` (`set_id`, `name`, `max_cards`) VALUES (NULL, 'Winterwonderland', '40'), (NULL, 'Summertime', '60');

INSERT INTO `marketplace` (`marketplace_id`, `owner_id`, `name`, `rating`) VALUES (NULL, '1', 'Ceces Shop', '4'), (NULL, '1', 'Magic Card shhop', NULL);

INSERT INTO `card_design` (`card_design_id`, `image`, `cover`) VALUES (NULL, 'Krasses Bild', 'None'), (NULL, 'Strong Buddies', 'Gold');