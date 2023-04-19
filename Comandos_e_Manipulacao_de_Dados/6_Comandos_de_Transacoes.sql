USE curso_sql;

SHOW ENGINES;

DROP TABLE contas_bancarias;

CREATE TABLE contas_bancarias (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    titular VARCHAR(45) NOT NULL,
    saldo DOUBLE NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO contas_bancarias (titular, saldo) VALUES ("André", 1000);
INSERT INTO contas_bancarias (titular, saldo) VALUES ("Carlos", 2000);

START TRANSACTION;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
ROLLBACK;

START TRANSACTION;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
COMMIT;

SELECT * FROM contas_bancarias;