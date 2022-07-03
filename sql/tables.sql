DO
$do$
    BEGIN

        CREATE TABLE IF NOT EXISTS "product"
        (
            id   serial,
            Name varchar(50) NOT NULL,
            Size varchar(50) NOT NULL,
            PRIMARY KEY (id)
        );

        CREATE TABLE IF NOT EXISTS "customer"
        (
            id        serial,
            FirstName varchar(50) NOT NULL,
            LastName  varchar(50) NOT NULL,
            Address   varchar(50) NOT NULL,
            PRIMARY KEY (id)
        );

        CREATE TABLE IF NOT EXISTS "order"
        (
            id         serial,
            CustomerId serial  NOT NULL,
            ProductId  serial  NOT NULL,
            Amount     integer NOT NULL,
            PRIMARY KEY (id),
            FOREIGN KEY (ProductId) REFERENCES "Product" (id),
            FOREIGN KEY (CustomerId) REFERENCES "Customer" (id)
        );

        CREATE TABLE IF NOT EXISTS "user"
        (
            id serial,
            CustomerId serial NOT NULL,
            Username VARCHAR NOT NULL,
            "Password" VARCHAR NOT NULL,
            PRIMARY KEY (id),
            FOREIGN KEY (CustomerId) REFERENCES "Customer" (id)
        );

        CREATE TABLE IF NOT EXISTS "session"
        (
            sid serial,
            UserId serial NOT NULL,
            Expires date NOT NULL,
            Data varchar
        );

        ALTER TABLE "Order" ADD COLUMN IF NOT EXISTS ShippingAddress varchar;

        ALTER TABLE "Session" ADD FOREIGN KEY  (UserId)
            REFERENCES "User" (id);
        ALTER TABLE "Session" ADD PRIMARY KEY (sid);
        ALTER TABLE "Session" ALTER COLUMN "sid" TYPE varchar;


    END
$do$