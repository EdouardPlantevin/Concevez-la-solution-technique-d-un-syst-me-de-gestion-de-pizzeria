BEGIN TRANSACTION;


--- ================================================================================
--- address
--- ================================================================================
	INSERT INTO public.address (street, zip, city, comment) VALUES ('test',	'61100', 'Flers', 'test');
	INSERT INTO public.address (street, zip, city, comment) VALUES ('test2',	'14000', 'Caen', 'test');
	INSERT INTO public.address (street, zip, city, comment) VALUES ('test3',	'00000', 'Paris', 'test');


--- ================================================================================
--- customer
--- ================================================================================
	INSERT INTO public.customer (fisrt_name, last_name, password, phone_number, email, address_id) VALUES ('testName','testSurname', 'azerty12345', '0600000000', 'test@test.fr', 1);
	INSERT INTO public.customer (fisrt_name, last_name, password, phone_number, email, address_id) VALUES ('testName2','testSurname2', 'azerty12345', '0600000000', 'test2@test.fr', 1);
	INSERT INTO public.customer (fisrt_name, last_name, password, phone_number, email, address_id) VALUES ('testName3','testSurname3', 'azerty12345', '0600000000', 'test3@test.fr', 1);




--- ================================================================================
--- ingrdient
--- ================================================================================
	INSERT INTO public.ingredient (name) VALUES ('test');
	INSERT INTO public.ingredient (name) VALUES ('test2');
	INSERT INTO public.ingredient (name) VALUES ('test3');


--- ================================================================================
--- item
--- ================================================================================
	INSERT INTO public.item (name) VALUES ('test');
	INSERT INTO public.item (name) VALUES ('test2');
	INSERT INTO public.item (name) VALUES ('test3');



--- ================================================================================
--- order
--- ================================================================================
	INSERT INTO public.order (time_order, pizzeria_id, state, payment_mode, shopping_cart_id) VALUES ('2011-01-01 00:00:00'::TIMESTAMP, 3, 'en cours', 'CB', 12);
	INSERT INTO public.order (time_order, pizzeria_id, state, payment_mode, shopping_cart_id) VALUES ('2011-01-01 00:00:00'::TIMESTAMP, 3, 'livraison', 'CB', 12);
	INSERT INTO public.order (time_order, pizzeria_id, state, payment_mode, shopping_cart_id) VALUES ('2011-01-01 00:00:00'::TIMESTAMP, 3, 'livré', 'CB', 12);




--- ================================================================================
--- pizzeria
--- ================================================================================
	INSERT INTO public.pizzeria (name, address_id) VALUES ('Tony Pizza Caen', 3);
	INSERT INTO public.pizzeria (name, address_id) VALUES ('Tony Pizza Flers', 3);
	INSERT INTO public.pizzeria (name, address_id) VALUES ('Tony Pizza Paris', 3);



--- ================================================================================
--- recipe
--- ================================================================================
	INSERT INTO public.recipe (quantity, item_id, ingredient_id) VALUES (2, 1, 1);
	INSERT INTO public.recipe (quantity, item_id, ingredient_id) VALUES (1, 1, 2);
	INSERT INTO public.recipe (quantity, item_id, ingredient_id) VALUES (2, 1, 3);




--- ================================================================================
--- shopping_cart
--- ================================================================================
	INSERT INTO public.shopping_cart (item_id, customer_id) VALUES (1, 2);
	INSERT INTO public.shopping_cart (item_id, customer_id) VALUES (2, 2);
	INSERT INTO public.shopping_cart (item_id, customer_id) VALUES (3, 2);




--- ================================================================================
--- staff
--- ================================================================================
	INSERT INTO public.staff (role, name, admin) VALUES ('livreur', 'Edouard', false);
	INSERT INTO public.staff (role, name, admin) VALUES ('pizzaiolo', 'Tony', false);
	INSERT INTO public.staff (role, name, admin) VALUES ('Manager', 'Satan', true);




--- ================================================================================
--- stock
--- ================================================================================
	INSERT INTO public.stock (pizzeria_id, ingredient_id, quantity) VALUES (3, 1, 50);
	INSERT INTO public.stock (pizzeria_id, ingredient_id, quantity) VALUES (4, 1, 150);
	INSERT INTO public.stock (pizzeria_id, ingredient_id, quantity) VALUES (5, 1, 250);




--- ================================================================================
--- commentaire
--- ================================================================================
	INSERT INTO public.work (staff_id, pizzeria_id) VALUES (1, 3);
	INSERT INTO public.work (staff_id, pizzeria_id) VALUES (1, 4);
	INSERT INTO public.work (staff_id, pizzeria_id) VALUES (1, 5);


COMMIT;
