-- Dropping all FK if we want to start fresh
ALTER TABLE campaign DROP CONSTRAINT fk_category_campaign;
ALTER TABLE campaign DROP CONSTRAINT fk_subcategory_campaign;
ALTER TABLE campaign DROP CONSTRAINT fk_contacts_campaign;

-- Dropping Table if we want to start fresh
DROP TABLE if exists category;
DROP TABLE if exists subcategory;
DROP TABLE if exists contacts;
DROP TABLE if exists campaign;


-- Creating Tables as per Challange instruction
CREATE TABLE category
(  
	category_id VARCHAR(30) NOT NULL,  
	category_name VARCHAR(30),   
	PRIMARY KEY(category_id)   
); 

CREATE TABLE subcategory
(  
	subcategory_id VARCHAR(30) NOT NULL,  
	subcategory_name VARCHAR(30),   
	PRIMARY KEY(subcategory_id)   
);

CREATE TABLE contacts
(  
	contact_id INT NOT NULL,  
	first_name VARCHAR(30),   
	last_name VARCHAR(30),
	email VARCHAR(50),
	PRIMARY KEY(contact_id)   
); 

CREATE TABLE campaign
(  
	cf_id INT NOT NULL, 
	contact_id INT,   
	company_name VARCHAR(50),   
	description VARCHAR(100),
	goal NUMERIC,
	pledge NUMERIC,
	outcome VARCHAR(30),
	backers_count INT,
	country VARCHAR(30),
	currency VARCHAR(30),
	launched_date DATE,
	end_date DATE,
	category_id VARCHAR(30),
	subcategory_id VARCHAR(30),	
	PRIMARY KEY(cf_id)   
); 

--Assigning Foreign keys to establish the relationship
ALTER TABLE campaign 
ADD CONSTRAINT fk_category_campaign FOREIGN KEY(category_id) REFERENCES category (category_id),
ADD CONSTRAINT fk_subcategory_campaign FOREIGN KEY(subcategory_id) REFERENCES subcategory (subcategory_id),
ADD CONSTRAINT fk_contacts_campaign FOREIGN KEY(contact_id) REFERENCES contacts (contact_id);

-- PLEASE IMPORT DATA BASED ON THE ORDER OF TABLE CREATION TO AVOID FOREIGN KEY CONSTRAINT VIOLATION

-- Test Query to select * FROM Each Table to confirm data
-- SELECT * FROM category;
-- SELECT * FROM subcategory;
-- SELECT * FROM contacts;
-- SELECT * FROM campaign;
