/* Creacion de usuarios remotos */
CREATE USER IF NOT EXISTS 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';
CREATE USER IF NOT EXISTS 'yane.garrido'@'%' IDENTIFIED BY '240629';
CREATE USER IF NOT EXISTS 'obed.vargas'@'%' IDENTIFIED BY '240145';
CREATE USER IF NOT EXISTS 'dorian.barrios'@'%' IDENTIFIED BY '240065';

/* Asignar los privilegios de super usuario */
GRANT ALL PRIVILEGES ON *.* TO 'yane.garrido'@'%';

/* Asignar privilegios de seleccion, insercion, actualizacion y eliminacion al usuario de la izquierda */
GRANT SELECT, INSERT, UPDATE, DELETE ON db_test_7b.* TO 'dorian.barrios'@'%';

/* Creacion de roles para el sistema de ecommerce */
CREATE ROLE IF NOT EXISTS 'superadmin';
CREATE ROLE IF NOT EXISTS 'admin';
CREATE ROLE IF NOT EXISTS 'seller';
CREATE ROLE IF NOT EXISTS 'buyer';
CREATE ROLE IF NOT EXISTS 'support';
CREATE ROLE IF NOT EXISTS 'common';
CREATE ROLE IF NOT EXISTS 'user_not_registered';

/* Asignar privilegios a los roles creados */
GRANT ALL PRIVILEGES ON *.* TO 'superadmin';

GRANT ALL PRIVILEGES ON db_test_7b.* TO 'admin';

-- SUPPORT
GRANT SELECT, INSERT, UPDATE 
ON db_test_7b.tb_users
TO 'support';

GRANT SELECT, INSERT, UPDATE 
ON db_test_7b.tb_products
TO 'support';

/* seller */
GRANT SELECT, INSERT, UPDATE, DELETE 
ON db_test_7b.tb_products 
TO 'seller';

/* Asignar roles a los usuarios creados */

/* este soy yo */
GRANT 'superadmin' TO 'yane.garrido'@'%';

/* este es el profe marco */
GRANT 'admin' TO 'marco.ramirez'@'%';

/* este es el de la izquierda */
GRANT 'support' TO 'dorian.barrios'@'%';

/* este es el de la derecha */
GRANT 'seller' TO 'obed.vargas'@'%';

/* Aplicar cambios */
FLUSH PRIVILEGES;