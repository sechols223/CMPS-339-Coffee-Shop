DO
$do$
    BEGIN

        INSERT INTO "customer"(firstname, lastname, address)
        VALUES ('samuel', 'echols', '123 Brown Drive');

        INSERT INTO "product"(name, size)
        VALUES ('Frappe', 'large');
        INSERT INTO "product"(name, size)
        VALUES ('Machiato', 'small');

        INSERT INTO "order"(CustomerId, ProductId, Amount)
        VALUES ((SELECT id FROM "product" WHERE id = 1),
                (SELECT id FROM "product" WHERE id = 1),
                1);

    END;
$do$;

INSERT INTO customer (firstname, lastname, address)
VALUES ('testcap', 'testcap', 'test address');

SELECT *
FROM customer;
