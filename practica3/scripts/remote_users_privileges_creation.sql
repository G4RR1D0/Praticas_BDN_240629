/* Creacion de usuarios remotos */
CREATE USER IF NOT EXISTS 'marco.ramirez'@'%' IDENTIFIED BY 'qwerty123';
CREATE USER IF NOT EXISTS 'yane.garrido'@'%' IDENTIFIED BY '240629';
CREATE USER IF NOT EXISTS 'obed.vargas'@'%' IDENTIFIED BY '240145';
CREATE USER IF NOT EXISTS 'dorian.barrios'@'%' IDENTIFIED BY '240065';
CREATE USER IF NOT EXISTS 'osmar.ortega'@'%' IDENTIFIED BY '240036';
CREATE USER IF NOT EXISTS 'app_web'@'%' IDENTIFIED BY 'Web123';
CREATE USER IF NOT EXISTS 'app_mobile'@'%' IDENTIFIED BY 'Mobile890';

/* Asignar los privilegios de super usuario */
GRANT ALL PRIVILEGES ON *.* TO 'yane.garrido'@'%';

/* Asignar privilegios de seleccion, insercion, actualizacion y eliminacion */
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

/* support actualizacion */
GRANT SELECT, INSERT, UPDATE, DELETE 
ON db_test_7b.tb_users 
TO 'support';

GRANT SELECT, UPDATE 
ON db_test_7b.tb_products 
TO 'support';

GRANT SELECT, INSERT, UPDATE 
ON db_test_7b.tbc_categories 
TO 'support';

/* Permisos para no registrados (Rol) */
GRANT INSERT, SELECT
ON db_test_7b.tb_users
TO 'user_not_registered';

GRANT INSERT, SELECT
ON db_test_7b.tb_people
TO 'user_not_registered';

GRANT INSERT, SELECT
ON db_test_7b.tb_logs
TO 'user_not_registered';

GRANT EXECUTE ON PROCEDURE db_test_7b.sp_register_new_user TO 'user_not_registered';

/* Asignar permisos de ejecucion DIRECTOS a los usuarios de apps (Para evitar Error 1370) */
GRANT EXECUTE ON PROCEDURE db_test_7b.sp_register_new_user TO 'app_web'@'%';
GRANT EXECUTE ON PROCEDURE db_test_7b.sp_register_new_user TO 'app_mobile'@'%';

/* Asignar roles a las credenciales de conexion para las apps */
GRANT 'user_not_registered' TO 'app_web'@'%';
GRANT 'user_not_registered' TO 'app_mobile'@'%';

/* Asignación de roles a usuarios */
GRANT 'superadmin' TO 'yane.garrido'@'%';
GRANT 'admin' TO 'marco.ramirez'@'%';
GRANT 'support' TO 'dorian.barrios'@'%';
GRANT 'seller' TO 'obed.vargas'@'%';
GRANT 'seller' TO 'osmar.ortega'@'%';

/* Activar roles por defecto */
SET DEFAULT ROLE 'superadmin' TO 'yane.garrido'@'%';
SET DEFAULT ROLE 'admin' TO 'marco.ramirez'@'%';
SET DEFAULT ROLE 'support' TO 'dorian.barrios'@'%';
SET DEFAULT ROLE 'seller' TO 'obed.vargas'@'%';
SET DEFAULT ROLE 'seller' TO 'osmar.ortega'@'%';
SET DEFAULT ROLE 'user_not_registered' TO 'app_web'@'%';
SET DEFAULT ROLE 'user_not_registered' TO 'app_mobile'@'%';

/* Aplicar cambios en memoria */
FLUSH PRIVILEGES;