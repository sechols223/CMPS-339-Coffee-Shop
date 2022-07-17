CREATE OR REPLACE FUNCTION cap() RETURNS TRIGGER AS
$customer_table$
BEGIN
    UPDATE customer SET firstname = initcap(firstname), lastname = initcap(lastname);
    RETURN NEW;
END;
$customer_table$ LANGUAGE plpgsql;
end;

CREATE TRIGGER capitalize
    AFTER INSERT
    ON customer
    FOR EACH ROW
EXECUTE FUNCTION cap();
 