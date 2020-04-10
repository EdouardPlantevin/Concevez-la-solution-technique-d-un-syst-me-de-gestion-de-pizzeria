
CREATE SEQUENCE public.staff_id_seq;

CREATE TABLE public.staff (
                id INTEGER NOT NULL DEFAULT nextval('public.staff_id_seq'),
                role INTEGER NOT NULL,
                name VARCHAR(50) NOT NULL,
                admin BOOLEAN DEFAULT false NOT NULL,
                CONSTRAINT staff_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;

CREATE SEQUENCE public.ingredient_id_seq;

CREATE TABLE public.ingredient (
                id INTEGER NOT NULL DEFAULT nextval('public.ingredient_id_seq'),
                name VARCHAR(50) NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;

CREATE SEQUENCE public.address_id_seq;

CREATE TABLE public.address (
                id INTEGER NOT NULL DEFAULT nextval('public.address_id_seq'),
                street VARCHAR(50),
                zip CHAR(5) NOT NULL,
                city VARCHAR(50) NOT NULL,
                comment VARCHAR(255),
                CONSTRAINT address_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;

CREATE SEQUENCE public.pizzeria_id_seq;

CREATE TABLE public.pizzeria (
                id INTEGER NOT NULL DEFAULT nextval('public.pizzeria_id_seq'),
                name VARCHAR(100) NOT NULL,
                address_id INTEGER NOT NULL,
                CONSTRAINT pizzeria_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizzeria_id_seq OWNED BY public.pizzeria.id;

CREATE SEQUENCE public.work_id_seq;

CREATE TABLE public.work (
                id INTEGER NOT NULL DEFAULT nextval('public.work_id_seq'),
                staff_id INTEGER NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                CONSTRAINT work_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.work_id_seq OWNED BY public.work.id;

CREATE SEQUENCE public.stock_id_seq;

CREATE TABLE public.stock (
                id INTEGER NOT NULL DEFAULT nextval('public.stock_id_seq'),
                pizzeria_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.stock_id_seq OWNED BY public.stock.id;

CREATE SEQUENCE public.item_id_seq;

CREATE TABLE public.item (
                id INTEGER NOT NULL DEFAULT nextval('public.item_id_seq'),
                name VARCHAR NOT NULL,
                CONSTRAINT item_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.item_id_seq OWNED BY public.item.id;

CREATE SEQUENCE public.recipe_id_seq;

CREATE TABLE public.recipe (
                id INTEGER NOT NULL DEFAULT nextval('public.recipe_id_seq'),
                quantity INTEGER NOT NULL,
                item_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                CONSTRAINT recipe_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.recipe_id_seq OWNED BY public.recipe.id;

CREATE SEQUENCE public.customer_id_seq;

CREATE TABLE public.customer (
                id INTEGER NOT NULL DEFAULT nextval('public.customer_id_seq'),
                fisrt_name VARCHAR(50) NOT NULL,
                last_name VARCHAR(50) NOT NULL,
                password VARCHAR NOT NULL,
                phone_number VARCHAR(10),
                email VARCHAR(50) NOT NULL,
                address_id INTEGER NOT NULL,
                CONSTRAINT customer_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;

CREATE SEQUENCE public.shopping_cart_id_seq;

CREATE TABLE public.shopping_cart (
                id INTEGER NOT NULL DEFAULT nextval('public.shopping_cart_id_seq'),
                item_id INTEGER NOT NULL,
                customer_id INTEGER NOT NULL,
                CONSTRAINT shopping_cart_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.shopping_cart_id_seq OWNED BY public.shopping_cart.id;

CREATE SEQUENCE public.order_1_id_seq;

CREATE TABLE public.order_1 (
                id INTEGER NOT NULL DEFAULT nextval('public.order_1_id_seq'),
                pizzeria_id INTEGER NOT NULL,
                time_order TIMESTAMP NOT NULL,
                state VARCHAR NOT NULL,
                payment_mode VARCHAR NOT NULL,
                delivery BOOLEAN DEFAULT false NOT NULL,
                payment_done BOOLEAN DEFAULT false NOT NULL,
                to_deliver BOOLEAN DEFAULT false NOT NULL,
                shopping_cart_id INTEGER NOT NULL,
                CONSTRAINT order_1_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.order_1_id_seq OWNED BY public.order_1.id;

ALTER TABLE public.work ADD CONSTRAINT staff_work_fk
FOREIGN KEY (staff_id)
REFERENCES public.staff (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT ingredient__assoc__stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.recipe ADD CONSTRAINT ingredient__assoc__recipe_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.customer ADD CONSTRAINT address_customer_fk
FOREIGN KEY (address_id)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizzeria ADD CONSTRAINT address_pizzeria_fk
FOREIGN KEY (address_id)
REFERENCES public.address (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order_1 ADD CONSTRAINT pizzeria_order_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT pizzeria__assoc__stock_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.work ADD CONSTRAINT pizzeria_work_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.shopping_cart ADD CONSTRAINT item_shopping_cart_fk
FOREIGN KEY (item_id)
REFERENCES public.item (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.recipe ADD CONSTRAINT item__assoc__recipe_fk
FOREIGN KEY (item_id)
REFERENCES public.item (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.shopping_cart ADD CONSTRAINT customer_shopping_cart_fk
FOREIGN KEY (customer_id)
REFERENCES public.customer (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order_1 ADD CONSTRAINT shopping_cart_order_1_fk
FOREIGN KEY (shopping_cart_id)
REFERENCES public.shopping_cart (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
