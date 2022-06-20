DO
$do$
    BEGIN

        DROP TABLE "Customer" CASCADE;
        DROP TABLE "Order";
        DROP TABLE "Product" CASCADE;
        DROP TABLE "Customers" CASCADE;
END
$do$