USE exercicio_c3;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE conta_bancaria
(
	codigo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
	titular VARCHAR(32) NOT NULL,
	saldo DOUBLE NOT NULL,
	PRIMARY KEY(codigo)
);

INSERT INTO conta_bancaria VALUES (1, 'André', 213);
INSERT INTO conta_bancaria VALUES (2, 'Diogo', 489);
INSERT INTO conta_bancaria VALUES (3, 'Rafael', 568);
INSERT INTO conta_bancaria VALUES (4, 'Carlos', 712);
INSERT INTO conta_bancaria VALUES (5, 'Peter', -38);

START TRANSACTION;
UPDATE conta_bancaria SET saldo = saldo + (saldo / 100 * 3) WHERE saldo > 0;
COMMIT;

SELECT * FROM conta_bancaria;