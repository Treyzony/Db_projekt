INSERT INTO Cards_In_Set (card_id, set_id) 
SELECT Card2.Nid, Card_Set.set_id
FROM Card2 LEFT JOIN Card_Set on Card2.Nset = Card_Set.short
;

INSERT INTO card(
card_id ,
name ,
	converted_mana_cost ,
	typename ,
	powercnt ,
	toughness ,
	rules ,
	rarity ,
	card_color ,
	artistname ,
	name_CN ,
	name_TW ,
	name_FR ,
	name_DE ,
	name_IT ,
	name_JP ,
	name_PT ,
	name_RU ,
	name_ES ,
	name_KO ,
	type_CN ,
	type_TW ,
	type_FR ,
	type_DE ,
	type_IT ,
	type_JP ,
	type_PT ,
	type_RU ,
	type_ES ,
	type_KO )
SELECT card2.Nid,
card2.Nname,card2.Nconverted_manacost,card2.Ntype,card2.Npower,card2.Ntoughness,card2.Nruling,card2.Nrarity,
card2.Ncolor,card2.Nartist,
card2.Nname_CN,card2.Nname_TW,card2.Nname_FR,card2.Nname_DE,card2.Nname_IT,card2.Nname_JP,card2.Nname_PT,card2.Nname_RU,card2.Nname_ES,
card2.Nname_KO,card2.Ntype_CN,card2.Ntype_TW,card2.Ntype_FR,card2.Ntype_DE,card2.Ntype_IT,card2.Ntype_JP,card2.Ntype_PT,card2.Ntype_RU,card2.Ntype_ES,card2.Ntype_KO
from card2;