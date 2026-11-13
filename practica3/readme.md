# Práctica 03 - Manipulación de Datos en Conexiones Remotas a Bases de Datos Relacionales

## Enlaces de GitHub Pages

*   [Diccionario de datos](https://G4RR1D0.github.io/Practicas_BDN_240629/practica3/index.html)
*   [Diagrama entidad-relación](https://G4RR1D0.github.io/Practicas_BDN_240629/practica3/modelo_de_tablas2.html)
---

## Descripción General

En esta práctica se diseñó, consolidó y pobló la arquitectura de la base de datos relacional **`db_test_7b`**, alojada en un servidor remoto MySQL **8.0.46** (`5.183.9.45`), simulando una plataforma integral de **Comercio Electrónico (E-Commerce)**.

Se implementó un esquema relacional normalizado de **25 tablas**, un sistema de auditoría en tiempo real mediante **55 disparadores (triggers)** vinculados a una bitácora centralizada (`tb_logs`), **25 vistas analíticas de trazabilidad**, **4 procedimientos almacenados** para registro, simulación demográfica y gestión de ciclo de vida de productos, y una carga masiva que alcanza **10,000 usuarios**, **7,500 perfiles personales**, **7,000 productos**, **101 categorías**, **10,465 relaciones producto-categoría** y **36,465 eventos auditados** en el respaldo `respado9_noviembre2026.sql`.

---

## Objetivos de la Práctica

- **Diseñar e implementar un esquema relacional completo**: modelar usuarios, roles, personas físicas, direcciones normalizadas, catálogos jerárquicos, productos, imágenes, proveedores, movimientos de inventario, listas de deseos, carritos de compra, pedidos, historial de estados, métodos de pago, cupones y reembolsos.
- **Implementar auditoría y trazabilidad continua**: configurar disparadores automáticos (`AFTER INSERT`, `AFTER UPDATE`, `AFTER DELETE`) en las tablas de negocio para registrar cada evento, usuario de base de datos (`USER()`), operación y descripción en `tb_logs`.
- **Desarrollar vistas especializadas de trazabilidad**: crear una vista dedicada por cada tabla del esquema (`vw_trazabilidad_*`) para consultar y filtrar los movimientos registrados en la bitácora.
- **Manipulación y generación masiva de datos**:
  - Automatizar el alta transaccional de usuarios y perfiles mediante procedimientos almacenados (`sp_generate_test_users` y `sp_register_new_user`).
  - Poblar catálogos de productos, categorías jerárquicas y asignaciones multi-categoría mediante cargas masivas SQL.
- **Gestión del ciclo de vida del catálogo**: implementar borrado lógico (`sp_soft_delete_product`) y restauración (`sp_restore_product`) preservando la integridad referencial.
- **Documentación y respaldo versionado**: consolidar la estructura y los datos en el respaldo SQL (`respado9_noviembre2026.sql`), acompañado del diccionario de datos y diagrama Entidad-Relación.

---

## Estructura de la Base de Datos (`db_test_7b`)

La base de datos cuenta con **25 tablas** organizadas en cinco módulos funcionales:

### 1. Entidades de Usuarios, Roles y Perfiles
- **`tb_users`**: Cuentas principales de acceso con correo electrónico único (`email`), nombre de usuario (`username`), contraseña cifrada (`password`), marcas temporales (`creation_date`, `last_update`, `last_login`) y estado lógico (`status`).
- **`tb_people`**: Información demográfica y personal vinculada en relación 1:1 con `tb_users` (título de cortesía, nombres, apellidos, fecha de nacimiento, género, código de país y teléfono)[cite: 1].
- **`tb_roles`**: Catálogo de roles de negocio dentro de la plataforma (nombre, descripción, estado y fecha de creación)[cite: 1].
- **`tb_user_roles`**: Tabla asociativa muchos a muchos (N:M) que asigna roles a los usuarios con fecha de asignación[cite: 1].
- **`tb_user_addresses`**: Direcciones de entrega registradas por los usuarios, incluyendo etiqueta, destinatario, teléfono, instrucciones de entrega y coordenadas geográficas (`latitude`, `longitude`)[cite: 1].
- **`tbd_address_components`**: Componentes jerárquicos y normalizados de cada dirección (`value`, `component_type`, `address_sup_id`)[cite: 1].

### 2. Catálogos, Productos y Proveedores
- **`tb_products`**: Catálogo maestro de artículos con código `SKU` único, nombre, descripción, precio actual (`current_price`), inventario disponible (`current_stock`) y estado operativo[cite: 1].
- **`tb_product_images`**: Galería de imágenes asociadas a cada producto (`image_url`) con indicador de imagen principal (`is_primary`)[cite: 1].
- **`tbc_categories`**: Catálogo jerárquico de categorías comerciales con soporte recursivo para subcategorías (`sup_id_category`)[cite: 1].
- **`tbd_products_categories`**: Tabla asociativa N:M que relaciona productos con múltiples categorías comerciales[cite: 1].
- **`tb_suppliers`**: Directorio de empresas proveedoras externas (razón social, contacto, correo, teléfono y dirección)[cite: 1].
- **`tbd_products_users_providers`**: Relación entre productos y usuarios que operan como proveedores o vendedores en la plataforma[cite: 1].
- **`tb_inventory_movements`**: Registro histórico de entradas (`In`), salidas (`Out`) y ajustes (`Adjustment`) de inventario por producto y usuario responsable[cite: 1].

### 3. Carritos, Listas de Deseos y Pedidos
- **`tb_carts`**: Carrito de compras activo asociado de forma única a cada usuario (`uk_cart_user`)[cite: 1].
- **`tbd_carts_items`**: Detalle de productos, proveedores y cantidades agregadas al carrito de cada cliente[cite: 1].
- **`tbd_users_wishlist_products`**: Lista de deseos con los productos guardados por cada usuario[cite: 1].
- **`tb_buyer_orders`**: Órdenes de compra generadas con subtotal, costo de envío (`shipping_cost`) y estado de cumplimiento (`Pending`, `Accepted`, `Preparing`, `Sent`, `Delivered`, `Canceled`, `Returned`)[cite: 1].
- **`tbd_order_items`**: Desglose de partidas por orden (producto, proveedor, nombre histórico, cantidad, precio unitario y subtotal)[cite: 1].
- **`tb_order_status_history`**: Historial cronológico de cambios de estado de cada pedido, usuario que realizó el cambio y comentarios[cite: 1].

### 4. Pagos, Cupones y Reembolsos
- **`tbc_payment_methods_types`**: Catálogo de tipos de métodos de pago soportados (`code`, `description`)[cite: 1].
- **`tbd_user_payment_methods`**: Métodos de pago registrados y tokenizados por usuario (proveedor, referencia, etiqueta y últimos cuatro dígitos)[cite: 1].
- **`tb_coupons`**: Catálogo de cupones promocionales con código único, porcentaje de descuento (`0%` a `100%`) y vigencia (`valid_from`, `valid_to`)[cite: 1].
- **`tbd_coupon_usages`**: Registro de redención y uso de cupones por usuario y orden de compra[cite: 1].
- **`tb_refunds`**: Solicitudes y registros de reembolsos monetarios vinculados a pagos, con monto, motivo y estado[cite: 1].

### 5. Bitácora de Auditoría
- **`tb_logs`**: Tabla centralizada de auditoría que almacena el ID del evento, usuario (`user_ID`), tabla afectada (`table_name`), operación (`Create`, `Read`, `Update`, `Delete`), usuario del motor (`db_user`), fecha de operación (`operation_date`), descripción detallada (`action`, `table_descripcion`) y estatus[cite: 1].

---

## Sistema de Auditoría (55 Triggers)

Se implementaron **55 disparadores** distribuidos en las 24 tablas de negocio para alimentar automáticamente la bitácora `tb_logs`[cite: 1]:

- **Auditoría completa de ciclo CRUD (3 a 4 triggers por tabla)** en 15 tablas principales (`tb_buyer_orders`, `tb_carts`, `tb_coupons`, `tb_people`, `tb_products`, `tb_user_addresses`, `tbc_categories`, `tbc_payment_methods_types`, `tbd_address_components`, `tbd_carts_items`, `tbd_order_items`, `tbd_products_categories`, `tbd_products_users_providers`, `tbd_user_payment_methods` y `tbd_users_wishlist_products`)[cite: 1].
- **Auditoría de inserción y actualización automática de stock (`AFTER INSERT`)** en 9 tablas transaccionales y de catálogo (`tb_inventory_movements`, `tb_order_status_history`, `tb_product_images`, `tb_refunds`, `tb_roles`, `tb_suppliers`, `tb_user_roles`, `tb_users` y `tbd_coupon_usages`)[cite: 1].

---

## Vistas Analíticas de Trazabilidad (25 Vistas)

Se crearon **25 vistas de base de datos** para consultar de forma estructurada los registros de auditoría correspondientes a cada entidad del modelo[cite: 1]:

- `vw_trazabilidad_users`[cite: 1]
- `vw_trazabilidad_people`[cite: 1]
- `vw_trazabilidad_roles`[cite: 1]
- `vw_trazabilidad_user_roles`[cite: 1]
- `vw_trazabilidad_user_addresses`[cite: 1]
- `vw_trazabilidad_address_components`[cite: 1]
- `vw_trazabilidad_productos`[cite: 1]
- `vw_trazabilidad_product_images`[cite: 1]
- `vw_trazabilidad_categories`[cite: 1]
- `vw_trazabilidad_products_categories`[cite: 1]
- `vw_trazabilidad_suppliers`[cite: 1]
- `vw_trazabilidad_products_users_providers`[cite: 1]
- `vw_trazabilidad_inventory_movements`[cite: 1]
- `vw_trazabilidad_carts`[cite: 1]
- `vw_trazabilidad_carts_items`[cite: 1]
- `vw_trazabilidad_users_wishlist_products`[cite: 1]
- `vw_trazabilidad_buyer_orders`[cite: 1]
- `vw_trazabilidad_order_items`[cite: 1]
- `vw_trazabilidad_order_status_history`[cite: 1]
- `vw_trazabilidad_payment_methods_types`[cite: 1]
- `vw_trazabilidad_user_payment_methods`[cite: 1]
- `vw_trazabilidad_coupons`[cite: 1]
- `vw_trazabilidad_coupon_usages`[cite: 1]
- `vw_trazabilidad_refunds`[cite: 1]
- `vw_trazabilidad_logs`[cite: 1]

---

## Procedimientos Almacenados Creados

1. **`sp_generate_test_users(p_scenario, p_password)`**: Genera lotes parametrizados de usuarios y datos demográficos realistas por escenario, integrando control transaccional y manejo de excepciones[cite: 1].
2. **`sp_register_new_user(...)`**: Registra de forma atómica un nuevo usuario en `tb_users` y su perfil asociado en `tb_people`, aplicando `ROLLBACK` automático ante cualquier error SQL[cite: 1].
3. **`sp_soft_delete_product(p_product_id)`**: Ejecuta la baja lógica de un artículo cambiando su estado a `'INACTIVE'` sin comprometer el historial de movimientos ni relaciones previas[cite: 1].
4. **`sp_restore_product(p_product_id)`**: Reactiva un producto dado de baja lógica estableciendo su estado en `'ACTIVE'`[cite: 1].

---

## Estructura de Entregables

```text
Practicas03/
├── backups/
│   └── respado9_noviembre2026.sql           # Respaldo completo (25 tablas, 55 triggers, 25 vistas, 4 SPs y datos)
├── queries/
│   └── consultas_verificacion.sql           # Consultas de inspección de tablas, triggers, vistas y conteos
├── scripts/
│   ├── remote_users_privileges_creation.sql # Administración de usuarios remotos y permisos
│   └── stored_procedures.sql                # Definición de los 4 procedimientos almacenados
├── docs/
│   ├── diccionario_datos.md                 # Diccionario de datos de las 25 tablas
│   ├── relaciones.mmd                       # Diagrama Entidad-Relación en Mermaid
│   └── index.html                           # Visualizador web para GitHub Pages
└── README.md                                # Documentación principal de la práctica