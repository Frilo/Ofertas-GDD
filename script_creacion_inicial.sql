USE GD2C2019
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (
		SELECT *
		FROM sys.schemas
		WHERE name = 'NUNCA_INJOIN'
		)
BEGIN
	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'Entrega'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.Entrega

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'Cupon'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.Cupon

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'FacturaProveedor'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.FacturaProveedor

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'Oferta'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.Oferta

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'Proveedor'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.Proveedor

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'Rubro'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.Rubro

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'Carga'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.Carga

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'Tarjeta'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.Tarjeta

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'Cliente'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.Cliente

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'Usuario'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.Usuario

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'FuncionalidadPorRol'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.FuncionalidadPorRol

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'Rol'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.Rol

	IF EXISTS (
			SELECT *
			FROM sys.tables
			WHERE object_name(object_id) = 'Funcionalidad'
				AND schema_name(schema_id) = 'NUNCA_INJOIN'
			)
		DROP TABLE NUNCA_INJOIN.Funcionalidad
END
ELSE
BEGIN
	EXEC ('create schema NUNCA_INJOIN authorization [gdCupon2019]')

	PRINT 'Creado schema NUNCA_INJOIN'
END
GO

IF EXISTS (
		SELECT *
		FROM sys.VIEWS
		WHERE object_name(object_id) = 'RolesActivos'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP VIEW NUNCA_INJOIN.RolesActivos
END
GO

IF EXISTS (
		SELECT *
		FROM sys.VIEWS
		WHERE object_name(object_id) = 'UsuariosHabilitados'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP VIEW NUNCA_INJOIN.UsuariosHabilitados
END
GO

IF EXISTS (
		SELECT *
		FROM sys.VIEWS
		WHERE object_name(object_id) = 'CuponesEntregados'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP VIEW NUNCA_INJOIN.CuponesEntregados
END
GO

--Functions
IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'OfertasActivas'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP FUNCTION NUNCA_INJOIN.OfertasActivas
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'VerUsuarios'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP FUNCTION NUNCA_INJOIN.VerUsuarios
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'CargasRealizadas'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP FUNCTION NUNCA_INJOIN.CargasRealizadas
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'FacturasEmitidas'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP FUNCTION NUNCA_INJOIN.FacturasEmitidas
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'CuponesReales'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP FUNCTION NUNCA_INJOIN.CuponesReales
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'verProveedores'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP FUNCTION NUNCA_INJOIN.verProveedores
END
GO

IF EXISTS (
		SELECT *
		FROM sys.procedures
		WHERE name = 'sp_validarUsuario'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.sp_validarUsuario
END
GO

IF EXISTS (
		SELECT *
		FROM sys.procedures
		WHERE name = 'AgregarFuncionalidad'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.AgregarFuncionalidad
END
GO

IF EXISTS (
		SELECT *
		FROM sys.procedures
		WHERE name = 'ActualizarRol'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.ActualizarRol
END
GO

IF EXISTS (
		SELECT *
		FROM sys.procedures
		WHERE name = 'CrearOferta'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.CrearOferta
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'verClientes'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP FUNCTION NUNCA_INJOIN.verClientes
END
GO

IF EXISTS (
		SELECT *
		FROM sys.procedures
		WHERE name = 'nombreUsuarioDisponible'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.nombreUsuarioDisponible
END
GO

IF EXISTS (
		SELECT *
		FROM sys.procedures
		WHERE name = 'registrarUsuario'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.registrarUsuario
END
GO

IF EXISTS (
		SELECT *
		FROM sys.procedures
		WHERE name = 'altaProveedor'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.altaProveedor
END
GO

IF EXISTS (
		SELECT *
		FROM sys.procedures
		WHERE name = 'altaCliente'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.altaCliente
END
GO

IF EXISTS (
		SELECT *
		FROM sys.procedures
		WHERE name = 'esUsuarioExistente'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.esUsuarioExistente
END
GO

IF OBJECT_ID('NUNCA_INJOIN.sp_obtenerFuncionalidades', 'P') IS NOT NULL
	DROP PROCEDURE NUNCA_INJOIN.sp_obtenerFuncionalidades;

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'yaExistePersona'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP FUNCTION NUNCA_INJOIN.yaExistePersona
END
GO

IF OBJECT_ID('NUNCA_INJOIN.modificarProveedor', 'P') IS NOT NULL
	DROP PROCEDURE NUNCA_INJOIN.modificarProveedor;
GO

IF OBJECT_ID('NUNCA_INJOIN.modificarCliente', 'P') IS NOT NULL
	DROP PROCEDURE NUNCA_INJOIN.modificarCliente;
GO
/*
 *	CREACI�N DE TABLAS
 */
USE GD2C2019
GO

CREATE TABLE NUNCA_INJOIN.Funcionalidad ("funcionalidad_id" VARCHAR(50) PRIMARY KEY);

CREATE TABLE NUNCA_INJOIN.Rol (
	"rol_id" NUMERIC(9) identity PRIMARY KEY,
	nombre_rol VARCHAR(50) UNIQUE NOT NULL,
	"baja_logica" CHAR(1) NOT NULL DEFAULT 'N' CHECK (baja_logica IN ('S', 'N'))
	);

CREATE TABLE NUNCA_INJOIN.FuncionalidadPorRol (
	"funcionalidad_id" VARCHAR(50) REFERENCES NUNCA_INJOIN.Funcionalidad,
	"rol_id" NUMERIC(9) REFERENCES NUNCA_INJOIN.Rol,
	PRIMARY KEY (
		rol_id,
		funcionalidad_id
		)
	);

CREATE TABLE NUNCA_INJOIN.Usuario (
	"usuario_id" VARCHAR(50) PRIMARY KEY,
	"rol_id" NUMERIC(9) REFERENCES NUNCA_INJOIN.Rol,
	"contrasenia" VARBINARY(32) NOT NULL,
	"intentos_fallidos" SMALLINT DEFAULT 0,
	"baja_logica" CHAR(1) NOT NULL DEFAULT 'N' CHECK (baja_logica IN ('S', 'N'))
	);

CREATE TABLE NUNCA_INJOIN.Cliente (
	"cliente_id" NUMERIC(9) identity PRIMARY KEY,
	"usuario_id" VARCHAR(50) REFERENCES NUNCA_INJOIN.Usuario,
	"nombre" NVARCHAR(255),
	"apellido" NVARCHAR(255),
	"dni" NUMERIC(18, 0),
	"mail" NVARCHAR(255),
	"telefono" NUMERIC(18, 0),
	"domicilio" NVARCHAR(255),
	"localidad" NVARCHAR(255),
	"codigo_postal" NVARCHAR(8),
	"fecha_nac" DATETIME,
	"credito" NUMERIC(18, 2) NOT NULL DEFAULT 200,
	"baja_logica" CHAR(1) NOT NULL DEFAULT 'N' CHECK (baja_logica IN ('S', 'N'))
	);

CREATE TABLE NUNCA_INJOIN.Tarjeta (
	"tarjeta_id" NUMERIC(9) identity PRIMARY KEY,
	"cliente_id" NUMERIC(9) REFERENCES NUNCA_INJOIN.Cliente,
	"duenio" NVARCHAR(255),
	numero NUMERIC(19)
	);

CREATE TABLE NUNCA_INJOIN.Carga (
	"carga_id" NUMERIC(9) identity PRIMARY KEY,
	"cliente_id" NUMERIC(9) REFERENCES NUNCA_INJOIN.Cliente,
	"tarjeta_id" NUMERIC(9) REFERENCES NUNCA_INJOIN.Tarjeta,
	"fecha" DATETIME NOT NULL,
	"tipo_pago" NVARCHAR(100),
	"monto" NUMERIC(18, 2)
	);

CREATE TABLE NUNCA_INJOIN.Rubro (
	"rubro_id" NUMERIC(9) identity PRIMARY KEY,
	"nombre_rubro" NVARCHAR(100)
	);

CREATE TABLE NUNCA_INJOIN.Proveedor (
	"proveedor_id" NUMERIC(9) identity PRIMARY KEY,
	"rubro_id" NUMERIC(9) REFERENCES NUNCA_INJOIN.Rubro,
	"usuario_id" VARCHAR(50) REFERENCES NUNCA_INJOIN.Usuario,
	"razon_social" NVARCHAR(100),
	"mail" NVARCHAR(255),
	"telefono" NUMERIC(18, 0),
	"domicilio" NVARCHAR(255),
	"localidad" NVARCHAR(255),
	"ciudad" NVARCHAR(255),
	"codigo_postal" NVARCHAR(8),
	"cuit" NVARCHAR(20),
	"nombre_contacto" NVARCHAR(255),
	"baja_logica" CHAR(1) NOT NULL DEFAULT 'N' CHECK (baja_logica IN ('S', 'N'))
	);

CREATE TABLE NUNCA_INJOIN.Oferta (
	oferta_codigo NVARCHAR(50) PRIMARY KEY,
	proveedor_id NUMERIC(9) REFERENCES NUNCA_INJOIN.Proveedor,
	descripcion NVARCHAR(255),
	fecha_publicacion DATETIME,
	fecha_vencimiento DATETIME,
	precio_oferta NUMERIC(18, 2),
	precio_lista NUMERIC(18, 2),
	cantidad_disponible NUMERIC(18, 0),
	cantidad_maxima_usuario NUMERIC(18, 0),
	plazo_entrega_dias NUMERIC(9)
	)

CREATE TABLE NUNCA_INJOIN.FacturaProveedor (
	factura_numero NUMERIC(18, 0) identity PRIMARY KEY,
	proveedor_id NUMERIC(9) REFERENCES NUNCA_INJOIN.Proveedor,
	fecha DATETIME,
	importe NUMERIC(26, 2)
	)

SET IDENTITY_INSERT NUNCA_INJOIN.FacturaProveedor ON

CREATE TABLE NUNCA_INJOIN.Cupon (
	cupon_id NUMERIC(9) identity PRIMARY KEY,
	oferta_codigo NVARCHAR(50) REFERENCES NUNCA_INJOIN.Oferta,
	cliente_compra_id NUMERIC(9) REFERENCES NUNCA_INJOIN.Cliente,
	factura_id NUMERIC(18, 0) REFERENCES NUNCA_INJOIN.FacturaProveedor,
	fecha_compra DATETIME,
	cantidad_comprada NUMERIC(18, 0),
	vencimiento DATETIME,
	fecha_entrega DATETIME -- Droppeada al terminar la migraci�n
	)

CREATE TABLE NUNCA_INJOIN.Entrega (
	entrega_id NUMERIC(9) identity,
	cupon_id NUMERIC(9) REFERENCES NUNCA_INJOIN.Cupon,
	cliente_entrega_id NUMERIC(9) REFERENCES NUNCA_INJOIN.Cliente,
	fecha_consumo DATETIME
	)

/*
 *
 *	INSERTS
 *
 */
/* Funcionalidades */
INSERT INTO NUNCA_INJOIN.Funcionalidad (funcionalidad_id)
VALUES ('abm de rol')

INSERT INTO NUNCA_INJOIN.Funcionalidad (funcionalidad_id)
VALUES ('registro de usuario')

INSERT INTO NUNCA_INJOIN.Funcionalidad (funcionalidad_id)
VALUES ('abm de clientes')

INSERT INTO NUNCA_INJOIN.Funcionalidad (funcionalidad_id)
VALUES ('abm de proveedor')

INSERT INTO NUNCA_INJOIN.Funcionalidad (funcionalidad_id)
VALUES ('carga de credito')

INSERT INTO NUNCA_INJOIN.Funcionalidad (funcionalidad_id)
VALUES ('confeccion y publicacion de ofertas')

INSERT INTO NUNCA_INJOIN.Funcionalidad (funcionalidad_id)
VALUES ('comprar oferta')

INSERT INTO NUNCA_INJOIN.Funcionalidad (funcionalidad_id)
VALUES ('entrega de oferta')

INSERT INTO NUNCA_INJOIN.Funcionalidad (funcionalidad_id)
VALUES ('facturacion a proveedor')

INSERT INTO NUNCA_INJOIN.Funcionalidad (funcionalidad_id)
VALUES ('listado estadistico')
GO

/* Roles */
INSERT INTO NUNCA_INJOIN.Rol (nombre_rol)
VALUES ('administrador general') -- Lo que usan durante los tests - tiene todas las funcionalidades (Pag 14)

INSERT INTO NUNCA_INJOIN.Rol (nombre_rol)
VALUES ('administrativo')

INSERT INTO NUNCA_INJOIN.Rol (nombre_rol)
VALUES ('cliente')

INSERT INTO NUNCA_INJOIN.Rol (nombre_rol)
VALUES ('proveedor')
GO

/* Funcionalidades por rol */
--Administrador general (Todas las funcionalidades)
INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrador general'
		),
	'abm de rol'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrador general'
		),
	'registro de usuario'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrador general'
		),
	'abm de clientes'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrador general'
		),
	'abm de proveedor'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrador general'
		),
	'carga de credito'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrador general'
		),
	'comprar oferta'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrador general'
		),
	'confeccion y publicacion de ofertas'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrador general'
		),
	'entrega de oferta'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrador general'
		),
	'facturacion a proveedor'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrador general'
		),
	'listado estadistico'
	)

--Administrativo
INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrativo'
		),
	'abm de rol'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrativo'
		),
	'registro de usuario'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrativo'
		),
	'abm de clientes'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrativo'
		),
	'abm de proveedor'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrativo'
		),
	'facturacion a proveedor'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrativo'
		),
	'listado estadistico'
	)

-- Cliente
/*INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'cliente'
		),
	'abm de clientes'
	)
	*/
INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'cliente'
		),
	'carga de credito'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'cliente'
		),
	'comprar oferta'
	)

/*
INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'proveedor'
		),
	'abm de proveedor'
	)
	*/
INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'proveedor'
		),
	'confeccion y publicacion de ofertas'
	)

INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol (
	rol_id,
	funcionalidad_id
	)
VALUES (
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'proveedor'
		),
	'entrega de oferta'
	)

/*
 * Contrase�as
 */
DECLARE @PassGeneral NVARCHAR(32)

SET @PassGeneral = 'w23e'

DECLARE @HashedPass VARBINARY(32)

SET @HashedPass = hashbytes('SHA2_256', @PassGeneral)

--ADMINISTRADOR GENERAL
INSERT INTO NUNCA_INJOIN.Usuario (
	usuario_id,
	rol_id,
	contrasenia
	)
VALUES (
	'admin',
	(
		SELECT rol_id
		FROM NUNCA_INJOIN.Rol
		WHERE nombre_rol = 'administrador general'
		),
	@HashedPass
	)

/*
 *MIGRACION
 */
/* CLIENTES */
INSERT INTO NUNCA_INJOIN.Cliente (
	nombre,
	apellido,
	dni,
	mail,
	telefono,
	domicilio,
	localidad,
	fecha_nac
	)
SELECT DISTINCT Cli_Nombre,
	Cli_Apellido,
	Cli_Dni,
	Cli_Mail,
	Cli_Telefono,
	Cli_Direccion,
	Cli_Ciudad,
	Cli_Fecha_Nac
FROM gd_esquema.Maestra
GO

INSERT INTO NUNCA_INJOIN.Cliente (
	nombre,
	apellido,
	dni,
	mail,
	telefono,
	domicilio,
	localidad,
	fecha_nac
	)
SELECT DISTINCT Cli_Dest_Nombre,
	Cli_Dest_Apellido,
	Cli_Dest_Dni,
	Cli_Dest_Mail,
	Cli_Dest_Telefono,
	Cli_Dest_Direccion,
	Cli_Dest_Ciudad,
	Cli_Dest_Fecha_Nac
FROM gd_esquema.Maestra
GO

/* VER QUE HACER CON LAS CARGAS DE MARGA SUAREZ */
/* RUBROS */
INSERT INTO NUNCA_INJOIN.Rubro (nombre_rubro)
SELECT DISTINCT Provee_Rubro
FROM gd_esquema.Maestra
WHERE Provee_Rubro IS NOT NULL
GO

/* PROVEEDORES */
INSERT INTO NUNCA_INJOIN.Proveedor (
	razon_social,
	telefono,
	domicilio,
	ciudad,
	cuit,
	rubro_id
	)
SELECT DISTINCT Provee_RS,
	Provee_Telefono,
	Provee_Dom,
	Provee_Ciudad,
	Provee_CUIT,
	(
		SELECT rubro_id
		FROM NUNCA_INJOIN.Rubro
		WHERE Provee_Rubro = nombre_rubro
		)
FROM gd_esquema.Maestra
WHERE Provee_CUIT IS NOT NULL

/* OFERTAS */
INSERT INTO NUNCA_INJOIN.Oferta (
	oferta_codigo,
	proveedor_id,
	descripcion,
	fecha_publicacion,
	fecha_vencimiento,
	precio_oferta,
	precio_lista,
	cantidad_disponible
	)
SELECT DISTINCT Oferta_Codigo,
	(
		SELECT proveedor_id
		FROM NUNCA_INJOIN.Proveedor
		WHERE Provee_RS = razon_social
			AND Provee_CUIT = cuit
		),
	Oferta_Descripcion,
	Oferta_Fecha,
	Oferta_Fecha_Venc,
	Oferta_Precio,
	Oferta_Precio_Ficticio,
	Oferta_Cantidad
FROM gd_esquema.Maestra
WHERE Oferta_Codigo IS NOT NULL

/* FACTURAS */
INSERT INTO NUNCA_INJOIN.FacturaProveedor (
	factura_numero,
	proveedor_id,
	fecha,
	importe
	)
SELECT Factura_Nro,
	(
		SELECT proveedor_id
		FROM NUNCA_INJOIN.Proveedor
		WHERE Provee_RS = razon_social
			AND Provee_CUIT = cuit
		),
	Factura_Fecha,
	sum(Oferta_Precio)
FROM gd_esquema.Maestra
WHERE Factura_Fecha IS NOT NULL
	AND Factura_Nro IS NOT NULL
GROUP BY Factura_Fecha,
	Factura_Nro,
	Provee_RS,
	Provee_CUIT

SET IDENTITY_INSERT NUNCA_INJOIN.FacturaProveedor OFF

/* VER QUE HAY ALGUNAS OFERTAS QUE SE REPITEN, AUNQUE TENGAN DIFERENTE CODIGO DE OFERTA */
/* CUPONES */
USE GD2C2019
GO

/*
Los casos que tienen todos los campos iguales salvo [Oferta_Entregado_Fecha],
[Factura_Nro] y [Factura_Fecha] se apalnaron y se consideraron como una sola compra
*/
INSERT INTO NUNCA_INJOIN.Cupon (
	oferta_codigo,
	cliente_compra_id,
	factura_id,
	fecha_compra,
	fecha_entrega, -- Droppeado al terminar la migracion de Entrega
	cantidad_comprada
	)
SELECT Oferta_Codigo,
	(
		SELECT cliente_id
		FROM NUNCA_INJOIN.Cliente
		WHERE Cli_Dni = dni
			AND Cli_Nombre = nombre
			AND Cli_Apellido = apellido
			AND Cli_Mail = mail
			AND Cli_Ciudad = localidad
		) id_cli,
	numero_factura,
	Oferta_Fecha_Compra,
	fecha_entregado,
	cant_compra
FROM (
	SELECT [Cli_Nombre],
		[Cli_Apellido],
		[Cli_Dni],
		[Oferta_Codigo],
		[Cli_Mail],
		[Cli_Ciudad],
		Max([Oferta_Entregado_Fecha]) AS fecha_entregado,
		Max([Factura_Nro]) AS numero_factura,
		Max([Factura_Fecha]) AS fecha_factura,
		Oferta_Fecha_Compra,
		-- Consideramos que cada nueva compra en la Maestra siempre tiene esos 3 campos en NULL
		SUM(CASE 
				WHEN [Oferta_Entregado_Fecha] IS NULL
					AND [Factura_Nro] IS NULL
					AND [Factura_Fecha] IS NULL
					THEN 1
				ELSE 0
				END) AS cant_compra
	FROM [GD2C2019].[gd_esquema].[Maestra]
	GROUP BY [Cli_Nombre],
		[Cli_Apellido],
		[Cli_Dni],
		[Oferta_Codigo],
		[Cli_Mail],
		[Cli_Ciudad],
		Oferta_Fecha_Compra
	) cupones_normales
WHERE Oferta_Fecha_Compra IS NOT NULL

INSERT INTO NUNCA_INJOIN.Entrega (
	cupon_id,
	--cliente_entrega_id, No vale la pena - no estaba implementado en el sist anterior
	fecha_consumo
	)
SELECT cupon_id,
	fecha_entrega
FROM NUNCA_INJOIN.Cupon
WHERE fecha_entrega IS NOT NULL
GO

ALTER TABLE NUNCA_INJOIN.Cupon

DROP COLUMN fecha_entrega
GO

INSERT INTO NUNCA_INJOIN.Carga (
	cliente_id,
	fecha,
	tipo_pago,
	monto
	)
SELECT (
		SELECT cliente_id
		FROM NUNCA_INJOIN.Cliente
		WHERE Cli_Dni = dni
			AND Cli_Nombre = nombre
			AND Cli_Apellido = apellido
			AND Cli_Mail = mail
			AND Cli_Ciudad = localidad
		),
	Carga_Fecha,
	Tipo_Pago_Desc,
	Carga_Credito
FROM gd_esquema.Maestra
WHERE Carga_Credito IS NOT NULL
	AND Carga_Fecha IS NOT NULL
GO

/*
 * VIEWS Y FUNCIONES
 */
/*Drops*/
--Views
--Roles activos
USE GD2C2019
GO

CREATE VIEW NUNCA_INJOIN.RolesActivos
AS
SELECT rol_id,
	nombre_rol
FROM NUNCA_INJOIN.Rol
WHERE baja_logica = 'N'
GO

--Usuarios habilitados
USE GD2C2019
GO

CREATE VIEW NUNCA_INJOIN.UsuariosHabilitados
AS
SELECT usuario_id
FROM NUNCA_INJOIN.Usuario
WHERE baja_logica = 'N'
	AND intentos_fallidos <= 3
GO

--Ofertas Activas (Es una funcion para que pueda recibir la fecha y tratarse como view)
CREATE FUNCTION NUNCA_INJOIN.OfertasActivas (@fechaActual DATETIME)
RETURNS TABLE
AS
RETURN (
		SELECT *
		FROM NUNCA_INJOIN.Oferta
		WHERE @fechaActual BETWEEN fecha_publicacion AND fecha_vencimiento
		)
GO

-- Cargas que ya se acreditaron
CREATE FUNCTION NUNCA_INJOIN.CargasRealizadas (@fechaActual DATETIME)
RETURNS TABLE
AS
RETURN (
		SELECT *
		FROM NUNCA_INJOIN.Carga
		WHERE fecha < @fechaActual
		)
GO

-- Facturas que ya se emitieron
CREATE FUNCTION NUNCA_INJOIN.FacturasEmitidas (@fechaActual DATETIME)
RETURNS TABLE
AS
RETURN (
		SELECT *
		FROM NUNCA_INJOIN.FacturaProveedor
		WHERE fecha < @fechaActual
		)
GO

-- Cupones que verdaderamente ya se compraron
CREATE FUNCTION NUNCA_INJOIN.CuponesReales (@fechaActual DATETIME)
RETURNS TABLE
AS
RETURN (
		SELECT *
		FROM NUNCA_INJOIN.Cupon
		WHERE fecha_compra <= @fechaActual
		)
GO

CREATE FUNCTION NUNCA_INJOIN.VerProveedores (
	@MostrarHabilitados INT,
	@MostrarInhabilitados INT,
	@razonSocial NVARCHAR(100),
	@usuario VARCHAR(50),
	@rubro NVARCHAR(100),
	@email NVARCHAR(255),
	@localidad NVARCHAR(255),
	@nombreDeContacto NVARCHAR(255),
	@ciudad NVARCHAR(255),
	@codigoPostal NVARCHAR(8)
	)
RETURNS TABLE
AS
RETURN (
		SELECT 
			razon_social AS [Razon Social],
			ISNULL(usuario_id, 'NO USER') AS Usuario,
			r.nombre_rubro AS [Rubro],
			cuit AS CUIT,
			telefono AS Telefono,
			ISNULL(mail, 'NO MAIL') AS Email,
			ISNULL(localidad, 'SIN LOCALIDAD') AS Localidad,
			ISNULL(nombre_contacto, 'NO NAME') AS Nombre,
			ciudad AS Ciudad,
			ISNULL(codigo_postal, 'NO CP') AS [Codigo Postal],
			baja_logica AS [Inhabilitado],
			proveedor_id AS ID
		FROM NUNCA_INJOIN.Proveedor,
			NUNCA_INJOIN.Rubro r
		WHERE Proveedor.rubro_id = r.rubro_id
			AND baja_logica LIKE (
				CASE 
					WHEN (@MostrarHabilitados & @MostrarInhabilitados) = 1
						THEN '%'
					ELSE CASE 
							WHEN @MostrarHabilitados = 1
								THEN 'N'
							ELSE CASE 
									WHEN @MostrarInhabilitados = 1
										THEN 'S'
									ELSE 'VACIO'
									END
							END
					END
				)
			AND ISNULL(nombre_contacto, 'NO NAME') LIKE CONCAT('%',@nombreDeContacto,'%')
			AND ISNULL(usuario_id, 'NO USER') LIKE CONCAT('%',@usuario,'%')
			AND ISNULL(mail, 'NO MAIL') LIKE CONCAT('%',@email,'%')
			AND ISNULL(localidad, 'SIN LOCALIDAD') LIKE CONCAT('%',@localidad,'%')
			AND razon_social LIKE CONCAT('%',@razonSocial,'%')
			AND r.nombre_rubro LIKE CONCAT('%',@rubro,'%')
			AND ciudad LIKE CONCAT('%',@ciudad,'%')
			AND ISNULL(codigo_postal, 'NO CP') LIKE CONCAT('%',@codigoPostal,'%')
		)
GO

CREATE FUNCTION NUNCA_INJOIN.VerUsuarios (
	@MostrarHabilitados INT,
	@MostrarInhabilitados INT,
	@usuario VARCHAR(50),
	@rol VARCHAR(50)
	)
RETURNS TABLE
AS
RETURN (
		SELECT usuario_id AS Usuario,
			r.nombre_rol AS Rol,
			u.baja_logica AS [Inhabilitado]
		FROM NUNCA_INJOIN.Usuario as u, NUNCA_INJOIN.Rol as r
		WHERE r.rol_id = u.rol_id
		AND u.baja_logica LIKE (
				CASE 
					WHEN (@MostrarHabilitados & @MostrarInhabilitados) = 1
						THEN '%'
					ELSE CASE 
							WHEN @MostrarHabilitados = 1
								THEN 'N'
							ELSE CASE 
									WHEN @MostrarInhabilitados = 1
										THEN 'S'
									ELSE 'VACIO'
									END
							END
					END
				)
				AND usuario_id LIKE '%' + @usuario + '%'
				AND r.nombre_rol LIKE '%' + @rol + '%'
				
		)
GO

CREATE FUNCTION NUNCA_INJOIN.VerClientes (
	@MostrarHabilitados INT,
	@MostrarInhabilitados INT,
	@nombre NVARCHAR(255),
	@apellido NVARCHAR(255),
	@email NVARCHAR(255),
	@ciudad NVARCHAR(255),
	@localidad NVARCHAR(255)
	)
RETURNS TABLE
AS
RETURN (
		SELECT 
			ISNULL(usuario_id, 'NO USER') AS Usuario,
			nombre AS Nombre,
			apellido AS Apellido,
			dni AS DNI,
			mail AS Email,
			telefono AS Telefono,
			domicilio AS Domicilio,
			localidad AS Localidad,
			ISNULL(codigo_postal, 'NO CP') AS Codigo_Postal,
			fecha_nac AS Nacimiento,
			credito AS Credito,
			baja_logica AS [Inhabilitado],
			cliente_id AS ID
		FROM NUNCA_INJOIN.Cliente
		WHERE baja_logica LIKE (
				CASE 
					WHEN (@MostrarHabilitados & @MostrarInhabilitados) = 1
						THEN '%'
					ELSE CASE 
							WHEN @MostrarHabilitados = 1
								THEN 'N'
							ELSE CASE 
									WHEN @MostrarInhabilitados = 1
										THEN 'S'
									ELSE 'VACIO'
									END
							END
					END
				)
				AND nombre LIKE '%' + @nombre + '%'
				AND apellido LIKE '%' + @apellido + '%'
				AND mail LIKE '%' + @email + '%'
				AND localidad LIKE '%' + @ciudad + '%'
				AND domicilio LIKE '%' + @localidad + '%'
		)
GO

/*
 * PROCEDURES
 */
USE GD2C2019
GO

--Procedure para validar usuario y contrasenia ingresados
IF OBJECT_ID('NUNCA_INJOIN.sp_validarUsuario', 'P') IS NOT NULL
	DROP PROCEDURE NUNCA_INJOIN.sp_validarUsuario;
GO

CREATE PROCEDURE NUNCA_INJOIN.sp_validarUsuario (
	@id_ingresado NVARCHAR(50),
	@contra_ingresada NVARCHAR(32)
	)
AS
BEGIN
	DECLARE @intentos_fallidos SMALLINT,
		@contra_hasheada VARBINARY(32),
		@contra_real VARBINARY(32),
		@valor_retorno SMALLINT,
		@baja_logica NCHAR(1)

	SET @intentos_fallidos = (
			SELECT intentos_fallidos
			FROM [NUNCA_INJOIN].Usuario
			WHERE usuario_id = @id_ingresado
			)
	SET @contra_hasheada = hashbytes('SHA2_256', @contra_ingresada)
	SET @contra_real = (
			SELECT contrasenia
			FROM [NUNCA_INJOIN].Usuario
			WHERE usuario_id = @id_ingresado
			)
	SET @baja_logica = (
			SELECT baja_logica
			FROM [NUNCA_INJOIN].Usuario
			WHERE usuario_id = @id_ingresado
			)

	IF NOT EXISTS (
			SELECT usuario_id
			FROM [NUNCA_INJOIN].Usuario
			WHERE usuario_id = @id_ingresado
				AND baja_logica = 'N'
			) --veo si no existe el usuario
		SET @valor_retorno = - 2 --no pudo loggear, no existe el usuario
	ELSE IF (
			@intentos_fallidos < 3
			AND @baja_logica = 'N'
			) --usuario existe y puede intentar todavia
	BEGIN
		IF (@contra_real = @contra_hasheada)
		BEGIN
			SET @valor_retorno = 1 --logg posible, salio todo bien 

			UPDATE [NUNCA_INJOIN].Usuario
			SET intentos_fallidos = 0
			WHERE usuario_id = @id_ingresado
		END
		ELSE
		BEGIN
			SET @valor_retorno = 0 --ingreso mal la contra pero tiene intentos posibles

			UPDATE [NUNCA_INJOIN].Usuario
			SET intentos_fallidos = intentos_fallidos + 1
			WHERE usuario_id = @id_ingresado
		END
	END
	ELSE
	BEGIN
		UPDATE [NUNCA_INJOIN].Usuario
		SET baja_logica = 'S'
		WHERE usuario_id = @id_ingresado

		SET @valor_retorno = - 1 --El usuario excedio esas tres oportunidades y fue dado de baja (por ahora borrado)
	END

	RETURN @valor_retorno
END
GO

USE GD2C2019
GO

IF OBJECT_ID('NUNCA_INJOIN.sp_cargarProveedor', 'P') IS NOT NULL
	DROP PROCEDURE NUNCA_INJOIN.sp_cargarProveedor;
GO

CREATE PROCEDURE [NUNCA_INJOIN].sp_cargarProveedor (
	@rubro_id NUMERIC(9, 0),
	@razon_social NVARCHAR(100),
	@mail NVARCHAR(255),
	@telefono NUMERIC,
	@domicilio NVARCHAR(255),
	@localidad NVARCHAR(255),
	@ciudad NVARCHAR(255),
	@codigo_postal NVARCHAR(8),
	@cuit NVARCHAR(20),
	@nombre_contacto NVARCHAR(255)
	)
AS
BEGIN
	DECLARE @usuario_id NVARCHAR(50),
		@baja_logica CHAR(1)

	SET @usuario_id = 'admin'
	SET @baja_logica = 'N'

	INSERT INTO NUNCA_INJOIN.Proveedor (
		rubro_id,
		usuario_id,
		razon_social,
		mail,
		telefono,
		domicilio,
		localidad,
		ciudad,
		codigo_postal,
		cuit,
		nombre_contacto,
		baja_logica
		)
	VALUES (
		@rubro_id,
		@usuario_id,
		@razon_social,
		@mail,
		@telefono,
		@domicilio,
		@localidad,
		@ciudad,
		@codigo_postal,
		@cuit,
		@nombre_contacto,
		@baja_logica
		)
END
GO

IF OBJECT_ID('NUNCA_INJOIN.sp_obtenerFuncionalidades', 'P') IS NOT NULL
	DROP PROCEDURE NUNCA_INJOIN.sp_obtenerFuncionalidades;
GO

CREATE PROCEDURE NUNCA_INJOIN.sp_obtenerFuncionalidades (
	@id_usuario NVARCHAR(50),
	@puedeRol SMALLINT OUT,
	@puedeRegUser SMALLINT OUT,
	@puedeAbmCli SMALLINT OUT,
	@puedeAbmPro SMALLINT OUT,
	@puedeCargar SMALLINT OUT,
	@puedeComprar SMALLINT OUT,
	@puedeOfertar SMALLINT OUT,
	@puedeFacturar SMALLINT OUT,
	@puedeEst SMALLINT OUT,
	@puedeEntregar SMALLINT OUT
	)
AS
BEGIN
	DECLARE @idRol NVARCHAR(255)

	SELECT @idRol = rol_id
	FROM NUNCA_INJOIN.Usuario
	WHERE usuario_id = @id_usuario

	SET @puedeRol = 0
	SET @puedeRegUser = 0
	SET @puedeAbmCli = 0
	SET @puedeAbmPro = 0
	SET @puedeCargar = 0
	SET @puedeComprar = 0
	SET @puedeOfertar = 0
	SET @puedeFacturar = 0
	SET @puedeEst = 0
	SET @puedeEntregar = 0

	IF EXISTS (
			SELECT 1
			FROM NUNCA_INJOIN.FuncionalidadPorRol
			WHERE rol_id = @idRol
				AND funcionalidad_id = 'abm de rol'
			)
		SET @puedeRol = 1

	IF EXISTS (
			SELECT 1
			FROM NUNCA_INJOIN.FuncionalidadPorRol
			WHERE rol_id = @idRol
				AND funcionalidad_id = 'registro de usuario'
			)
		SET @puedeRegUser = 1

	IF EXISTS (
			SELECT 1
			FROM NUNCA_INJOIN.FuncionalidadPorRol
			WHERE rol_id = @idRol
				AND funcionalidad_id = 'abm de clientes'
			)
		SET @puedeAbmCli = 1

	IF EXISTS (
			SELECT 1
			FROM NUNCA_INJOIN.FuncionalidadPorRol
			WHERE rol_id = @idRol
				AND funcionalidad_id = 'abm de proveedor'
			)
		SET @puedeAbmPro = 1

	IF EXISTS (
			SELECT 1
			FROM NUNCA_INJOIN.FuncionalidadPorRol
			WHERE rol_id = @idRol
				AND funcionalidad_id = 'carga de credito'
			)
		SET @puedeCargar = 1

	IF EXISTS (
			SELECT 1
			FROM NUNCA_INJOIN.FuncionalidadPorRol
			WHERE rol_id = @idRol
				AND funcionalidad_id = 'comprar oferta'
			)
		SET @puedeComprar = 1

	IF EXISTS (
			SELECT 1
			FROM NUNCA_INJOIN.FuncionalidadPorRol
			WHERE rol_id = @idRol
				AND funcionalidad_id = 'confeccion y publicacion de ofertas'
			)
		SET @puedeOfertar = 1

	IF EXISTS (
			SELECT 1
			FROM NUNCA_INJOIN.FuncionalidadPorRol
			WHERE rol_id = @idRol
				AND funcionalidad_id = 'facturacion a proveedor'
			)
		SET @puedeFacturar = 1

	IF EXISTS (
			SELECT 1
			FROM NUNCA_INJOIN.FuncionalidadPorRol
			WHERE rol_id = @idRol
				AND funcionalidad_id = 'listado estadistico'
			)
		SET @puedeEst = 1

	IF EXISTS (
			SELECT 1
			FROM NUNCA_INJOIN.FuncionalidadPorRol
			WHERE rol_id = @idRol
				AND funcionalidad_id = 'entrega de oferta'
			)
		SET @puedeEntregar = 1
END
GO

CREATE PROC NUNCA_INJOIN.esUsuarioExistente (
	@usuario_id VARCHAR(50),
	@rol_id NUMERIC(9)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Usuario.usuario_id
			FROM usuario
			WHERE usuario_id = @usuario_id
			)
	BEGIN
			;

		throw 51234,
			'No existe el usuario solicitado',
			1
	END
	ELSE IF NOT EXISTS (
			SELECT Usuario.usuario_id
			FROM usuario
			WHERE usuario_id = @usuario_id
				AND rol_id = @rol_id
			)
	BEGIN
			;

		throw 51238,
			'No se pudo crear. El usuario tiene otro rol asignado.',
			1
	END
END
GO

-- Dos usuarios son iguales si tienen mismo DNI/CUIT y el mismo rol
CREATE FUNCTION NUNCA_INJOIN.yaExistePersona (
	@CUI NVARCHAR(20),
	@rol_id VARCHAR(50) -- Se usa el numero de rol porque el nombre del rol puede ser modificado
	)
RETURNS SMALLINT
AS
BEGIN
	RETURN CASE 
			WHEN (
					EXISTS (
						SELECT rol_id
						FROM usuario
						JOIN cliente ON cliente.usuario_id = usuario.usuario_id
						JOIN proveedor ON proveedor.usuario_id = usuario.usuario_id
						WHERE rol_id = @rol_id
							AND (
								convert(NVARCHAR(20), cliente.dni) LIKE @CUI
								OR proveedor.cuit LIKE @CUI
								)
						)
					)
				THEN 1
			ELSE 0
			END
END
GO

USE GD2C2019
GO

CREATE PROCEDURE NUNCA_INJOIN.altaProveedor (
	@rubro_id NVARCHAR(100),
	@usuario_id VARCHAR(50),
	@razon_social NVARCHAR(100),
	@mail NVARCHAR(255),
	@telefono NUMERIC(18, 0),
	@domicilio NVARCHAR(255),
	@localidad NVARCHAR(255),
	@ciudad NVARCHAR(255),
	@codigo_postal NVARCHAR(8),
	@cuit NVARCHAR(20),
	@nombre_contacto NVARCHAR(255)
	)
AS
BEGIN
	IF (NUNCA_INJOIN.yaExistePersona(@CUIT, 4) = 0)
	BEGIN
		EXEC NUNCA_INJOIN.esUsuarioExistente @usuario_id,
			4

		INSERT INTO NUNCA_INJOIN.Proveedor (
			"rubro_id",
			"usuario_id",
			"razon_social",
			"mail",
			"telefono",
			"domicilio",
			"localidad",
			"ciudad",
			"codigo_postal",
			"cuit",
			"nombre_contacto"
			)
		VALUES (
			(
				SELECT rubro_id
				FROM RUBRO
				WHERE Rubro.rubro_id = @rubro_id
				),
			(
				SELECT @usuario_id
				FROM Usuario
				WHERE Usuario.usuario_id LIKE @usuario_id
				),
			@razon_social,
			@mail,
			@telefono,
			@domicilio,
			@localidad,
			@ciudad,
			@codigo_postal,
			@cuit,
			@nombre_contacto
			)
	END
	ELSE
	BEGIN
			;

		throw 51234,
			'Ya existe un usuario para ese proveedor',
			1
	END
END
GO

USE GD2C2019
GO

CREATE PROCEDURE NUNCA_INJOIN.altaCliente (
	@usuario_id VARCHAR(50),
	@nombre NVARCHAR(255),
	@apellido NVARCHAR(255),
	@dni NUMERIC(18, 0),
	@mail NVARCHAR(255),
	@telefono NUMERIC(18, 0),
	@domicilio NVARCHAR(255),
	@localidad NVARCHAR(255),
	@codigo_postal NVARCHAR(8),
	@fecha_nac DATETIME
	)
AS
BEGIN
	IF (NUNCA_INJOIN.yaExistePersona(convert(NVARCHAR(20), @dni), 3) = 0)
	BEGIN
		EXEC NUNCA_INJOIN.esUsuarioExistente @usuario_id,
			3

		INSERT INTO NUNCA_INJOIN.Cliente (
			"usuario_id",
			"nombre",
			"apellido",
			"dni",
			"mail",
			"telefono",
			"domicilio",
			"localidad",
			"codigo_postal",
			"fecha_nac",
			"credito"
			)
		VALUES (
			@usuario_id,
			@nombre,
			@apellido,
			@dni,
			@mail,
			@telefono,
			@domicilio,
			@localidad,
			@codigo_postal,
			@fecha_nac,
			200
			)
	END
	ELSE
	BEGIN
			;

		throw 51234,
			'Ya existe un usuario para ese cliente',
			1
	END
END
GO

USE GD2C2019
GO

CREATE PROC NUNCA_INJOIN.nombreUsuarioDisponible (@usuario_id VARCHAR(50))
AS
BEGIN
	IF EXISTS (
			SELECT Usuario.usuario_id
			FROM usuario
			WHERE usuario_id = @usuario_id
			)
	BEGIN
			;

		throw 51234,
			'Nombre de usuario no disponible',
			1
	END
END
GO

CREATE PROC NUNCA_INJOIN.registrarUsuario (
	@usuario_id VARCHAR(50),
	@rol_id NUMERIC(6),
	@contrasenia NVARCHAR(32)
	)
AS
BEGIN
	DECLARE @HashedPass VARBINARY(32)

	SET @HashedPass = hashbytes('SHA2_256', @contrasenia)

	EXEC NUNCA_INJOIN.nombreUsuarioDisponible @usuario_id

	INSERT INTO NUNCA_INJOIN.Usuario (
		usuario_id,
		rol_id,
		contrasenia
		)
	VALUES (
		@usuario_id,
		@rol_id,
		@HashedPass
		)
END
GO

CREATE PROC NUNCA_INJOIN.CrearOferta (
	@oferta_codigo NVARCHAR(50),
	@proveedor_id NVARCHAR(50),
	@descripcion NVARCHAR(255),
	@fecha_publicacion NVARCHAR(50),
	@fecha_vencimiento NVARCHAR(50),
	@precio_oferta NVARCHAR(50),
	@precio_lista NVARCHAR(50),
	@cantidad_disponible NVARCHAR(50),
	@cantidad_maxima_usuario NVARCHAR(50),
	@plazo_entrega_dias NVARCHAR(50)
	)
AS
BEGIN
	INSERT INTO NUNCA_INJOIN.Oferta (
		oferta_codigo,
		proveedor_id,
		descripcion,
		fecha_publicacion,
		fecha_vencimiento,
		precio_oferta,
		precio_lista,
		cantidad_disponible,
		cantidad_maxima_usuario,
		plazo_entrega_dias
		)
	VALUES (
		@oferta_codigo,
		@proveedor_id,
		@descripcion,
		(CONVERT(DATETIME, @fecha_publicacion, 121)),
		(CONVERT(DATETIME, @fecha_vencimiento, 121)),
		CONVERT(NUMERIC(18, 2), @precio_oferta),
		CONVERT(NUMERIC(18, 2), @precio_lista),
		CONVERT(NUMERIC(18, 0), @cantidad_disponible),
		CONVERT(NUMERIC(18, 0), @cantidad_maxima_usuario),
		CONVERT(NUMERIC(9,0), @plazo_entrega_dias)
		)
END
GO

USE GD2C2019
go

create procedure NUNCA_INJOIN.modificarProveedor(
	@proveedor_id numeric(9,0),
	@rubro_id NVARCHAR(100),
	@razon_social NVARCHAR(100),
	@mail NVARCHAR(255),
	@telefono NUMERIC(18, 0),
	@domicilio NVARCHAR(255),
	@localidad NVARCHAR(255),
	@ciudad NVARCHAR(255),
	@codigo_postal NVARCHAR(8),
	@cuit NVARCHAR(20),
	@nombre_contacto NVARCHAR(255)
	)
as
	begin
		update NUNCA_INJOIN.Proveedor
		set 
			rubro_id = @rubro_id,
			razon_social = @razon_social,
			mail = @mail,
			telefono = @telefono,
			domicilio = @domicilio,
			localidad = @localidad,
			ciudad = @ciudad,
			codigo_postal = @codigo_postal,
			cuit = @cuit,
			nombre_contacto = @nombre_contacto 
		where proveedor_id = @proveedor_id
	end
go

create procedure NUNCA_INJOIN.modificarCliente(
	@cliente_id numeric(9,0),
	@nombre NVARCHAR(255),
	@apellido NVARCHAR(255),
	@dni NUMERIC(18, 0),
	@mail NVARCHAR(255),
	@telefono NUMERIC(18, 0),
	@domicilio NVARCHAR(255),
	@localidad NVARCHAR(255),
	@codigo_postal NVARCHAR(8),
	@fecha_nac DATETIME
	)
as
	begin
		update NUNCA_INJOIN.Cliente
		set 
			nombre = @nombre,
			apellido = @apellido,
			dni = @dni,
			mail = @mail,
			telefono = @telefono,
			domicilio = @domicilio,
			localidad = @localidad,
			codigo_postal = @codigo_postal,
			fecha_nac = @fecha_nac
		where cliente_id = @cliente_id
	end
go

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'cantidadCompradaPorUsuario'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP FUNCTION NUNCA_INJOIN.cantidadCompradaPorUsuario
END
GO

--no se si tendria que hacerlo sobre NUNCA_INJOIN.CuponesReales
CREATE FUNCTION NUNCA_INJOIN.cantidadCompradaPorUsuario(@cliente_id numeric(9,0),@oferta_codigo nvarchar(50),@fecha datetime)
RETURNS NUMERIC(18,0)
AS
BEGIN
return (SELECT sum(cantidad_comprada) 
		FROM NUNCA_INJOIN.CuponesReales(@fecha) 
		WHERE cliente_compra_id = @cliente_id and oferta_codigo = @oferta_codigo 
		GROUP BY cliente_compra_id,oferta_codigo);
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'puedeComprar'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.puedeComprar
END
GO

CREATE PROCEDURE NUNCA_INJOIN.puedeComprar	(@cliente_id NUMERIC(9,0),@oferta_codigo nvarchar(50),
											@cantidad numeric(18,0),@fecha datetime)
AS
BEGIN
DECLARE @cantMaxima numeric(18,0),@cantDisponible numeric(18,0),@cantYaComprada numeric(18,0),
		@credito numeric(18,2),@monto numeric(18,2),@mensaje varchar(100);

SET @cantMaxima =		(SELECT cantidad_maxima_usuario FROM NUNCA_INJOIN.Oferta WHERE oferta_codigo = @oferta_codigo);
SET @cantDisponible =	(SELECT cantidad_disponible FROM NUNCA_INJOIN.Oferta WHERE oferta_codigo = @oferta_codigo);
SET @cantYaComprada =	NUNCA_INJOIN.cantidadCompradaPorUsuario(@cliente_id,@oferta_codigo,@fecha);
SET @credito =			(SELECT credito FROM NUNCA_INJOIN.Cliente WHERE cliente_id=@cliente_id);
SET @monto = @cantidad *(SELECT precio_oferta FROM NUNCA_INJOIN.Oferta WHERE oferta_codigo = @oferta_codigo);

IF(@cantidad + @cantYaComprada > @cantMaxima or @cantidad > @cantMaxima)
	BEGIN
	SET @mensaje = 'Cantidad maxima por usuario: '+convert(nvarchar(18),@cantMaxima);
	THROW 51234,@mensaje,1
	END;

ELSE IF(@cantidad > @cantDisponible)
	BEGIN
	SET @mensaje = 'Cantidad maxima disponible: '+convert(nvarchar(18),@cantDisponible);
	THROW 51234,@mensaje,1
	END;

ELSE IF(@monto > @credito)
	BEGIN
	SET @mensaje = 'Su credito es insuficiente: '+convert(nvarchar(18),@credito);
	THROW 51234,@mensaje,1
	END;
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'armarFactura'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.armarFactura
END
GO

CREATE PROC NUNCA_INJOIN.armarFactura	(@proveedor_id numeric(9,0),@importe numeric(26,2),
										@fecha datetime, @factura_numero numeric(18,0) OUT)
AS
BEGIN
INSERT INTO NUNCA_INJOIN.FacturaProveedor(proveedor_id,fecha,importe)
VALUES(@proveedor_id,@fecha,@importe);

SET @factura_numero = scope_identity();
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'armarCupon'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.armarCupon
END
GO

CREATE PROC NUNCA_INJOIN.armarCupon	(@oferta_codigo NVARCHAR(50),@cliente_id numeric(9,0),
									@factura_numero NUMERIC(18,0),@fecha DATETIME,@cantidad NUMERIC(18,0))
AS
BEGIN
DECLARE @vencimiento datetime;
SET @vencimiento = (SELECT fecha_vencimiento FROM NUNCA_INJOIN.Oferta WHERE oferta_codigo=@oferta_codigo);

INSERT INTO NUNCA_INJOIN.Cupon(oferta_codigo,cliente_compra_id,factura_id,fecha_compra,cantidad_comprada,vencimiento)
VALUES(@oferta_codigo,@cliente_id,@factura_numero,@fecha,@cantidad,@vencimiento);
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'bajarSaldoCliente'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.bajarSaldoCliente
END
GO

CREATE PROC NUNCA_INJOIN.bajarSaldoCliente(@usuario_id VARCHAR(50),@importe NUMERIC(26,2))
AS
BEGIN
UPDATE  NUNCA_INJOIN.Cliente
SET credito -= @importe
WHERE usuario_id=@usuario_id;
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'bajarCantidadOferta'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.bajarCantidadOferta
END
GO

CREATE PROC NUNCA_INJOIN.bajarCantidadOferta(@oferta_codigo NVARCHAR(50),@cantidad NUMERIC(18,0))
AS
BEGIN
UPDATE  NUNCA_INJOIN.Oferta
SET cantidad_disponible -= @cantidad
WHERE oferta_codigo=@oferta_codigo;
END
GO

IF EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_name(object_id) = 'comprarOferta'
			AND schema_name(schema_id) = 'NUNCA_INJOIN'
		)
BEGIN
	DROP PROCEDURE NUNCA_INJOIN.comprarOferta
END
GO

CREATE PROC NUNCA_INJOIN.comprarOferta (@usuario_id varchar(50),@oferta_codigo nvarchar(50),
										@cantidad numeric(18,0),@fecha datetime)
AS
BEGIN
	DECLARE @factura_numero NUMERIC(18,0),@importe NUMERIC(26,2),@proveedor_id NUMERIC(9,0),@cliente_id NUMERIC(9,0);
	SET @importe = @cantidad * (SELECT precio_oferta FROM NUNCA_INJOIN.Oferta where oferta_codigo=@oferta_codigo);
	SET @proveedor_id = (SELECT proveedor_id FROM NUNCA_INJOIN.Oferta where oferta_codigo=@oferta_codigo)
	SET @cliente_id = (SELECT cliente_id FROM NUNCA_INJOIN.Cliente WHERE usuario_id=@usuario_id);

	EXEC NUNCA_INJOIN.puedeComprar @cliente_id,@oferta_codigo,@cantidad,@fecha;
	
	EXEC NUNCA_INJOIN.armarFactura @proveedor_id,@importe,@fecha,@factura_numero;

	EXEC NUNCA_INJOIN.armarCupon @oferta_codigo,@cliente_id,@factura_numero,@fecha,@cantidad;

	EXEC NUNCA_INJOIN.bajarSaldoCliente @usuario_id,@importe;

	EXEC NUNCA_INJOIN.bajarCantidadOferta @oferta_codigo,@cantidad;
END
GO

CREATE PROC NUNCA_INJOIN.actualizarRol(
	@rol_id NUMERIC(9),
	@nuevo_nombre VARCHAR(50),
	@baja_logica CHAR(1)
	)
AS
BEGIN
	DELETE
	FROM NUNCA_INJOIN.FuncionalidadPorRol
	WHERE rol_id = @rol_id

	UPDATE NUNCA_INJOIN.Rol
	SET nombre_rol = @nuevo_nombre,
	baja_logica = @baja_logica
	where rol_id = @rol_id
END
GO

CREATE PROC NUNCA_INJOIN.AgregarFuncionalidad(
@rol_id NUMERIC(9), @funcionalidad VARCHAR(50))
AS
BEGIN
	INSERT INTO NUNCA_INJOIN.FuncionalidadPorRol(rol_id, funcionalidad_id)
	VALUES(@rol_id, @funcionalidad)
END
GO