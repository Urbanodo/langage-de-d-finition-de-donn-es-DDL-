-- ============================================
-- 1. CRÉATION DES TABLES
-- ============================================

-- Table Customer
CREATE TABLE Customer (
    Customer_id   VARCHAR2(20)  PRIMARY KEY,
    Customer_Name VARCHAR2(20)  NOT NULL,
    Customer_Tel  NUMBER
);

-- Table Product
CREATE TABLE Product (
    Product_id   VARCHAR2(20)  PRIMARY KEY,
    Product_Name VARCHAR2(20)  NOT NULL,
    Price        NUMBER        CHECK (Price > 0)
);

-- Table Orders (clés étrangères vers Customer et Product)
CREATE TABLE Orders (
    Customer_id  VARCHAR2(20)  REFERENCES Customer(Customer_id),
    Product_id   VARCHAR2(20)  REFERENCES Product(Product_id),
    Quantity     NUMBER,
    Total_amount NUMBER,
    PRIMARY KEY (Customer_id, Product_id)
);

-- ============================================
-- 2. MODIFICATION DES TABLES (ALTER TABLE)
-- ============================================

-- Ajouter la colonne Category à la table Product
ALTER TABLE Product
ADD Category VARCHAR2(20);

-- Ajouter la colonne OrderDate à la table Orders avec SYSDATE par défaut
ALTER TABLE Orders
ADD OrderDate DATE DEFAULT SYSDATE;