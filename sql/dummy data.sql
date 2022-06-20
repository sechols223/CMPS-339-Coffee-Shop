DO
$do$
    BEGIN

     INSERT INTO  "Customer"(firstname, lastname, address)
            VALUES ('samuel', 'echols', '123 Brown Drive');

        INSERT INTO "Product"(name, size)
            VALUES ('Frappe', 'large');
        INSERT INTO "Product"(name, size)
            VALUES ('Machiato', 'small');

        INSERT INTO "Order"(CustomerId, ProductId, Amount)
            VALUES((SELECT id FROM "Customer" WHERE id = 1),
                   (SELECT id FROM "Product" WHERE id = 1),
                   1);

END;
$do$
