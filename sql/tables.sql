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
            FOREIGN KEY (ProductId) REFERENCES "product" (id),
            FOREIGN KEY (CustomerId) REFERENCES "customer" (id)
        );

        CREATE TABLE IF NOT EXISTS "user"
        (
            id serial,
            CustomerId serial NOT NULL,
            Username VARCHAR NOT NULL,
            "Password" VARCHAR NOT NULL,
            PRIMARY KEY (id),
            FOREIGN KEY (CustomerId) REFERENCES "customer" (id)
        );

        CREATE TABLE IF NOT EXISTS "session"
        (
            sid     serial,
            UserId  serial NOT NULL,
            Expires date   NOT NULL,
            Data    varchar
        );
        CREATE TABLE IF NOT EXISTS "user_roles"
        (
          id serial NOT NULL,
          userid serial NOT NULL,
          roleid serial NOT NULL
        );
        CREATE TABLE IF NOT EXISTS "roles"
        (
          id serial NOT NULL,
          name varchar NOT NULL
        );

        ALTER TABLE "order"
            ADD COLUMN IF NOT EXISTS ShippingAddress varchar;
        ALTER TABLE "product"
            ADD COLUMN IF NOT EXISTS Price varchar;
        ALTER TABLE "session"
            ADD FOREIGN KEY (UserId)
                REFERENCES "user" (id);
        ALTER TABLE "session"
            ADD PRIMARY KEY (sid);
        ALTER TABLE "session"
            ALTER COLUMN "sid" TYPE varchar;
        ALTER TABLE "order"
            ADD COLUMN IF NOT EXISTS Order_Date TIMESTAMP;

    END
$do$;


