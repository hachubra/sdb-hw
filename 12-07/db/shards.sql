CREATE EXTENSION postgres_fdw;

/* SHARD 1 */
CREATE SERVER db_1_server
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'postgres_b1', port '5432', dbname 'pg_db');

CREATE USER MAPPING FOR "postgres"
    SERVER db_1_server
    OPTIONS (user 'postgres', password 'postgres');

CREATE FOREIGN TABLE books_1
(
    id bigint not null,
    category_id int not null,
    author character varying not null,
    title character varying not null,
    year int not null,
    pages int not null,
    price bigint not null
) SERVER db_1_server
  OPTIONS (schema_name 'public', table_name 'pg_db');


/* SHARD 2 */
CREATE SERVER db_2_server
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'postgres_b2', port '5432', dbname 'pg_db');

CREATE USER MAPPING FOR "postgres"
    SERVER db_2_server
    OPTIONS (user 'postgres', password 'postgres');

CREATE FOREIGN TABLE books_2
(
    id bigint not null,
    category_id int not null,
    author character varying not null,
    title character varying not null,
    year int not null,
    pages int not null,
    price bigint not null
) SERVER db_2_server
  OPTIONS (schema_name 'public', table_name 'pg_db');

/* SHARD 3 */
CREATE SERVER db_3_server
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host 'postgres_b3', port '5432', dbname 'pg_db');

CREATE USER MAPPING FOR "postgres"
    SERVER db_3_server
    OPTIONS (user 'postgres', password 'postgres');

CREATE FOREIGN TABLE books_3
(
    id bigint not null,
    category_id int not null,
    author character varying not null,
    title character varying not null,
    year int not null,
    pages int not null,
    price bigint not null
) SERVER db_3_server
  OPTIONS (schema_name 'public', table_name 'pg_db');

CREATE VIEW books AS
SELECT *
FROM books_1
UNION ALL
SELECT *
FROM books_2
UNION ALL
SELECT *
FROM books_3;

CREATE RULE books_insert AS ON INSERT TO books
    DO INSTEAD NOTHING;
CREATE RULE books_update AS ON UPDATE TO books
    DO INSTEAD NOTHING;
CREATE RULE books_delete AS ON DELETE TO books
    DO INSTEAD NOTHING;

CREATE RULE books_insert_to_1 AS ON INSERT TO books
    WHERE (category_id <= 3)
    DO INSTEAD INSERT INTO books_1
               VALUES (NEW.*);

CREATE RULE books_insert_to_2 AS ON INSERT TO books
    WHERE (category_id > 3 and category_id <= 6)
    DO INSTEAD INSERT INTO books_2
               VALUES (NEW.*);

CREATE RULE books_insert_to_3 AS ON INSERT TO books
    WHERE (category_id > 6)
    DO INSTEAD INSERT INTO books_3
               VALUES (NEW.*);