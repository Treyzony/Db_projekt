INSERT INTO Cards_In_Set (card_id, set_id) VALUES (
	SELECT Card2.Nid Card_Set.set_id
	FROM Card2 LEFT JOIN Card_Set Card2.Nset = Card_Set.short
	WHERE Card2.Nset != NULL
);