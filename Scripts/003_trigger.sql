-- Crear la función plpgsql
CREATE OR REPLACE FUNCTION comprobar_precio()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.price < 0 THEN
        NEW.price = 0;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear el trigger
CREATE TRIGGER trigger_comprobar_precio
BEFORE INSERT ON apartment
FOR EACH ROW 
EXECUTE FUNCTION comprobar_precio();