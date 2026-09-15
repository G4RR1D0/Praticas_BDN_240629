/* Creacion de uusarios remotos */
CREATE USER 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';
CREATE USER 'yane.garrido'@'%' IDENTIFIED BY '240629';
CREATE USER 'obed.vargas'@'%' IDENTIFIED BY '240145';
CREATE USER 'dorian.barrios'@'%' IDENTIFIED BY '240065';

/* Asignar los privilegios */

GRANT  ALL PRIVILEGES ON *.* TO 'yane.garrido'@'%';

/*Asignar privilegios de selecion, insercion, actualizacion y eliminacion al usuario de izquierda*/
GRANT SELECT, INSERT, UPDATE, DELETE ON db_test_7b.* TO 'dorian.barrios'@'%';

/*Creacion de roles para el sisteman de ecommerce*/
CREATE ROLE 'admin';
CREATE ROLE 'seller';
CREATE ROLE 'buyer';
CREATE ROLE 'support';
CREATE ROLE 'common';
CREATE ROLE 'user_not_registered';


/*asignar privilegios a los roles creados*/
GRANT ALL PRIVILEGES ON  db_test_7b.* TO 'admin';

--support
GRANT SELECT, INSERT, UPDATE ON db_test_7b.* TO 'support';

/*asignar roles a usuarios creados*/
GRANT 'admin' TO 'marco.ramirez'@'%';
GRANT 'support' TO 'dorian.barrios'@'%';
