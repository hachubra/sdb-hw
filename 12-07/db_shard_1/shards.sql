CREATE TABLE books
(
    id bigint not null,
    category_id int not null,
    CONSTRAINT category_id_check CHECK (category_id <= 3),
    author character varying not null,
    title character varying not null,
    year int not null,
    pages int not null,
    price bigint not null
);

CREATE INDEX books_category_id_idx ON books USING btree(category_id);

CREATE TABLE users (
    user_id bigint not null,
    login TEXT NOT NULL,
    password TEXT  NOT NULL
);


CREATE TABLE shops
(   
   id_shop bigint not null,
   city_id bigint not null,
   CONSTRAINT city_id CHECK (city_id <= 5 ),
   address character varying,
   manager character varying not null
);

CREATE INDEX shops_city_id_idx ON shops USING btree(city_id);