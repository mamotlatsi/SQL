-- Adminer 4.7.6 PostgreSQL dump

\connect "Umuzi";

DROP TABLE IF EXISTS "customers";
CREATE TABLE "public"."customers" (
    "customer_id" integer NOT NULL,
    "first_name" character varying(50),
    "last_name" character varying(50),
    "gender" character varying,
    "address" character varying(200),
    "phone" integer,
    "email" character varying(100),
    "city" character varying(20),
    "country" character varying(50),
    CONSTRAINT "customers_pkey" PRIMARY KEY ("customer_id")
) WITH (oids = false);

INSERT INTO "customers" ("customer_id", "first_name", "last_name", "gender", "address", "phone", "email", "city", "country") VALUES
(3,	'Leon',	'Glen',	'Male',	'81 Everton Rd,Gillits',	820832830,	'Leon@gmail.com',	'Durban',	'South Africa'),
(1,	'Lerato',	'Mabitso',	'Male',	'284 chaucer st',	84789657,	'john@gmail.com',	'Johannesburg',	'South Africa');

DROP TABLE IF EXISTS "employees";
CREATE TABLE "public"."employees" (
    "employees_id" integer NOT NULL,
    "first_name" character varying(50),
    "last_name" character varying(50),
    "email" character varying(100),
    "job_title" character varying(20),
    CONSTRAINT "employees_pkey" PRIMARY KEY ("employees_id")
) WITH (oids = false);

INSERT INTO "employees" ("employees_id", "first_name", "last_name", "email", "job_title") VALUES
(1,	'Kani',	'Matthew',	'mat@gmail.com',	'Manager'),
(2,	'Lesly',	'Cronje',	'LesC@gmail.com',	'Clerk'),
(3,	'Gideon',	'Maduku',	'm@gmail.com',	'Accountant');

DROP TABLE IF EXISTS "orders";
CREATE TABLE "public"."orders" (
    "order_id" integer NOT NULL,
    "product_id" integer,
    "payment_id" integer,
    "fulfilled_by_employee_id" integer,
    "date_required" date,
    "date_shipped" date,
    "status" character varying(20),
    CONSTRAINT "orders_pkey" PRIMARY KEY ("order_id"),
    CONSTRAINT "orders_fulfilled_by_employee_id_fkey" FOREIGN KEY (fulfilled_by_employee_id) REFERENCES employees(employees_id) NOT DEFERRABLE,
    CONSTRAINT "orders_fulfilled_by_employee_id_fkey1" FOREIGN KEY (fulfilled_by_employee_id) REFERENCES employees(employees_id) NOT DEFERRABLE,
    CONSTRAINT "orders_fulfilled_by_employee_id_fkey2" FOREIGN KEY (fulfilled_by_employee_id) REFERENCES employees(employees_id) NOT DEFERRABLE,
    CONSTRAINT "orders_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(product_id) NOT DEFERRABLE,
    CONSTRAINT "orders_product_id_fkey1" FOREIGN KEY (product_id) REFERENCES products(product_id) NOT DEFERRABLE,
    CONSTRAINT "orders_product_id_fkey2" FOREIGN KEY (product_id) REFERENCES products(product_id) NOT DEFERRABLE,
    CONSTRAINT "orders_product_id_fkey3" FOREIGN KEY (product_id) REFERENCES products(product_id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "payments";
CREATE TABLE "public"."payments" (
    "customer_id" integer NOT NULL,
    "payment_id" integer,
    "payment_date" date,
    "amount" numeric,
    CONSTRAINT "payments_pkey" PRIMARY KEY ("customer_id"),
    CONSTRAINT "payments_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id) NOT DEFERRABLE,
    CONSTRAINT "payments_customer_id_fkey1" FOREIGN KEY (customer_id) REFERENCES customers(customer_id) NOT DEFERRABLE
) WITH (oids = false);

INSERT INTO "payments" ("customer_id", "payment_id", "payment_date", "amount") VALUES
(1,	1,	'2018-01-09',	150.75);

DROP TABLE IF EXISTS "products";
CREATE TABLE "public"."products" (
    "product_id" integer NOT NULL,
    "product_name" character varying(100),
    "description" character varying(300),
    "buy_price" numeric,
    CONSTRAINT "products_pkey" PRIMARY KEY ("product_id")
) WITH (oids = false);

INSERT INTO "products" ("product_id", "product_name", "description", "buy_price") VALUES
(1,	'Harley Davidson Chopper',	'This replica features working kickstand, front suspension, gear-shift lever',	150.75),
(2,	'Classic Car',	'Turnable front wheels, steering function',	550.75),
(3,	'Sports car',	'Turnable front wheels, steering function',	700.60);

-- 2020-04-14 12:11:21.86036+00
