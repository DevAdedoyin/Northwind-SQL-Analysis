--
-- PostgreSQL database dump
--
SET SESSION MAX_EXECUTION_TIME = 0; 
SET SESSION innodb_lock_wait_timeout = 0;
SET NAMES 'utf8mb4';
SET CHARACTER SET utf8mb4;
SET SESSION sql_mode = 'NO_BACKSLASH_ESCAPES';
SET SESSION sql_notes = 0;
SET SESSION default_storage_engine = 'InnoDB';
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

--- drop tables
DROP TABLE IF EXISTS customer_customer_demo;
DROP TABLE IF EXISTS customer_demographics;
DROP TABLE IF EXISTS employee_territories;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS shippers;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS territories;
DROP TABLE IF EXISTS us_states;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS employees;

DROP DATABASE IF EXISTS Tesco_Lidl;

CREATE DATABASE Tesco_Lidl;

-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE categories (
    category_id smallint NOT NULL PRIMARY KEY,
    category_name character varying(15) NOT NULL,
    description text,
    picture blob
);

-- Name: customer_demographics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE customer_demographics (
    customer_type_id char NOT NULL PRIMARY KEY,
    customer_desc text
);


-- Name: customers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE customers (
    customer_id char NOT NULL PRIMARY KEY,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24)
);


-- Name: customer_customer_demo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE customer_customer_demo (
    customer_id CHAR(10) NOT NULL,
    customer_type_id CHAR(10) NOT NULL,
    PRIMARY KEY (customer_id, customer_type_id),
    FOREIGN KEY (customer_type_id) REFERENCES customer_demographics(customer_type_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Name: employees; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE employees (
    employee_id smallint NOT NULL PRIMARY KEY,
    last_name character varying(20) NOT NULL,
    first_name character varying(10) NOT NULL,
    title character varying(30),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo blob,
    notes text,
    reports_to smallint,
    photo_path character varying(255),
	FOREIGN KEY (reports_to) REFERENCES employees(employee_id)
);


-- Name: suppliers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE suppliers (
    supplier_id smallint NOT NULL PRIMARY KEY,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage text
);


-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE products (
    product_id SMALLINT NOT NULL PRIMARY KEY,
    product_name VARCHAR(40) NOT NULL,
    supplier_id SMALLINT,
    category_id SMALLINT,
    quantity_per_unit VARCHAR(20),
    unit_price REAL,
    units_in_stock SMALLINT,
    units_on_order SMALLINT,
    reorder_level SMALLINT,
    discontinued INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id), -- Specify column
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)  -- Specify column
);



-- Name: region; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE region (
    region_id smallint NOT NULL PRIMARY KEY,
    region_description char NOT NULL
);


-- Name: shippers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE shippers (
    shipper_id smallint NOT NULL PRIMARY KEY,
    company_name character varying(40) NOT NULL,
    phone character varying(24)
);


-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE orders (
    order_id SMALLINT NOT NULL PRIMARY KEY,
    customer_id CHAR(10),  -- Adjust length based on the actual data type in customers table
    employee_id SMALLINT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    ship_via SMALLINT,
    freight REAL,
    ship_name VARCHAR(40),
    ship_address VARCHAR(60),
    ship_city VARCHAR(15),
    ship_region VARCHAR(15),
    ship_postal_code VARCHAR(10),
    ship_country VARCHAR(15),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id), 
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),  
    FOREIGN KEY (ship_via) REFERENCES shippers(shipper_id)      
);



-- Name: territories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE territories (
    territory_id character varying(20) NOT NULL PRIMARY KEY,
    territory_description char(50) NOT NULL,
    region_id smallint NOT NULL,
	FOREIGN KEY (region_id) REFERENCES region(region_id)
);

-- Name: employee_territories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE employee_territories (
    employee_id smallint NOT NULL,
    territory_id character varying(20) NOT NULL,
    PRIMARY KEY (employee_id, territory_id),
    FOREIGN KEY (territory_id) REFERENCES territories,
    FOREIGN KEY (employee_id) REFERENCES employees
);


-- Name: order_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE order_details (
    order_id smallint NOT NULL,
    product_id smallint NOT NULL,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products,
    FOREIGN KEY (order_id) REFERENCES orders
);


-- Name: us_states; Type: TABLE; Schema: public; Owner: -; Tablespace: 
CREATE TABLE us_states (
    state_id smallint NOT NULL PRIMARY KEY,
    state_name character varying(100),
    state_abbr character varying(2),
    state_region character varying(50)
);