/* 6.Procedury, funkcje, wyzwalacze obsługujące bazę */
/* a.Dodawanie, usuwanie, aktualizacja rekordów */


/* b. Archiwizacja usuniętych danych  */

CREATE TRIGGER triggerarchiwum AFTER DELETE ON 'tab'
FOR EACH ROW
BEGIN
  INSERT INTO archiwum (id_tabela, data, kolumna1, kolumna2)
  VALUES (OLD.id, OLD.data, OLD.kolumna1, OLD.kolumna2);
END



/* c. Logowanie informacji do tabeli */

/* Tworzenie tabeli z logami: */
CREATE TABLE historia (
  'id' INT NOT NULL AUTO_INCREMENT AUTO_INCREMENT,
  'id_tabela' INT NOT NULL,
  'zmiana' enum('insert','update','delete') NOT NULL,
  'czas' TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  'kolumna1' varchar(20) DEFAULT NULL,
  'kolumna2' int DEFAULT NULL,
  PRIMARY KEY ('id')
);

/* Triggery: */
CREATE TRIGGER trigger1 AFTER INSERT ON 'tab'
FOR EACH ROW
BEGIN
  INSERT INTO historia (id_tabela, zmiana, kolumna1, kolumna2)
  VALUES (NEW.id, 'insert', NEW.kolumna1, NEW.kolumna2);
END

CREATE TRIGGER trigger2 AFTER UPDATE ON 'tab'
FOR EACH ROW
BEGIN
  INSERT INTO historia (id_tabela, zmiana, kolumna1, kolumna2)
  VALUES (NEW.id, 'update', NEW.kolumna1, NEW.kolumna2);
END

CREATE TRIGGER trigger3 AFTER DELETE ON 'tab'
FOR EACH ROW
BEGIN
  INSERT INTO historia (id_tabela, zmiana, kolumna1, kolumna2)
  VALUES (NEW.id, 'delete', NEW.kolumna1, NEW.kolumna2);
END



/* d. Obsługa wyjątków, również własne wyjątki */



/* e. Procedury, funkcje z parametrami, możliwe parametry domyślne */



/* f. Sprawdzanie poprawności dodawanych danych (np. funkcja sprawdzająca poprawność pesela)  */
/* wyszukaj z przedzialu czasu, jak nie znajdzie to wyjątek */

CREATE FUNCTION szukajmiesiac (miesiac IN miesiace)
    RETURN VARCHAR2 IS
    month months.job_title%TYPE;
BEGIN
    SELECT 'number', 'date' FROM month WHERE date > DATE(DATE_SUB(NOW(), INTERVAL 2 MONTH)) AND date < DATE(DATE_SUB(NOW(), INTERVAL 1 DAY))
    dbms_output.put_line(month);
    RETURN title;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN 'Nie znaleziono';
    WHEN OTHERS THEN dbms_output.put_line('Error');
END;

/* 7. Procedury, funkcje, wyzwalacze tworzące podsumowania  */
/* a. Zestawienia miesięczne, kwartalne, roczne, w zależności  od różnych parametrów – zapisywane w bazie danych (gotowe do wyświetlania na wykresach)  */

