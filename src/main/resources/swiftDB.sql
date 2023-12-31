/*Se crea la base de datos */
drop schema if exists swiftDB;
drop user if exists admin;
CREATE SCHEMA swiftDB;

/*Se crea un usuario para la base de datos llamado "usuario_prueba" y tiene la contraseña "Usuario_Clave."*/
create user 'admin'@'%' identified by 'admin123';

/*Se asignan los prvilegios sobr ela base de datos prueba_a al usuario creado */
grant all privileges on swiftDB.* to 'admin'@'%';
flush privileges;

/*la tabla de usuarios*/
create table swiftDB.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(50) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (id_usuario))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*la tabla de prersupuestos*/
create table swiftDB.presupuesto (
  id_gasto INT NOT NULL AUTO_INCREMENT,
  nombre_Gasto VARCHAR(60) NOT NULL,
  descripcion VARCHAR(150) NOT NULL,
  monto DOUBLE NOT NULL,
  mes_Ingreso VARCHAR(40) NOT NULL,
  num_Quincena INT NOT NULL,
  PRIMARY KEY (id_gasto))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE swiftDB.ingreso (
  id_ingreso INT NOT NULL AUTO_INCREMENT,
  nombre_ingreso VARCHAR(60) NOT NULL,
  icono VARCHAR(255) NOT NULL,
  descripingreso VARCHAR(150) NOT NULL,
  monto DOUBLE NOT NULL,
  PRIMARY KEY (id_ingreso))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


/*Tabla de Credito*/
create table swiftDB.credito (
  id_credito INT NOT NULL AUTO_INCREMENT,
  nombre_Credito VARCHAR(60) NOT NULL,
  tipo_Credito VARCHAR(100) NOT NULL,
  mes_Registro VARCHAR(150) NOT NULL,
  monto DOUBLE NOT NULL,
  num_Cuotas INT NOT NULL,
  cuotas_Realizadas INT NOT NULL,
  /*id_usuario INT NOT NULL,*/
  PRIMARY KEY (id_credito))
  /*FOREIGN KEY (id_usuario) REFERENCES swiftDB.usuario(id_usuario))*/
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
ALTER TABLE swiftDB.credito ALTER cuotas_Realizadas SET DEFAULT 0;
/*ALTER TABLE swiftDB.credito ALTER id_usuario SET DEFAULT 4;*/

/*Tabla de Ahorros*/
create table swiftDB.ahorro (
  id_ahorro INT NOT NULL AUTO_INCREMENT,
  nombre_ahorro VARCHAR(60) NOT NULL,
  icono VARCHAR(255) NOT NULL,
  descripahorro VARCHAR(150) NOT NULL,
  monto DOUBLE NOT NULL,
  PRIMARY KEY (id_ahorro))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Tabla movimientos*/
create table swiftDB.movimientos (
  id_movimiento INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(60) NOT NULL,
  descripcion VARCHAR(150) NOT NULL,
  monto DOUBLE NOT NULL,
  fechaMovimiento DATE NOT NULL,
  userID INT NOT NULL,
  PRIMARY KEY (id_movimiento),
  FOREIGN KEY (userID) REFERENCES swiftDB.usuario(id_usuario))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Tabla rol*/
create table swiftDB.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO swiftDB.usuario (id_usuario, username, password, nombre, apellidos, correo, telefono, ruta_imagen, activo) VALUES
('1', 'Javier', '$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.', 'Javier', 'Madrigal Pozo', 'javier@dreamapps.com', '123456789', 'https://firebasestorage.googleapis.com/v0/b/techshop-db74d.appspot.com/o/SWIP%2Fjavi.png?alt=media&token=2ad28101-c6e8-4f6a-9a0c-a58c4e912c36', true ),
('2', 'Gabriel', '$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.', 'Gabriel', 'BARAHONA WALKER', 'gabriel@dreamapps.com', '987654321', 'https://firebasestorage.googleapis.com/v0/b/techshop-db74d.appspot.com/o/SWIP%2Fgabo.png?alt=media&token=e30c80c4-e9c1-4761-969f-c723d2693471', true),
('3', 'Joseth', '$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.', 'Joseth', 'ARAYA GONZALEZ', 'joseth@dreamapps.com', '1122334455', 'https://firebasestorage.googleapis.com/v0/b/techshop-db74d.appspot.com/o/SWIP%2FJoseth.jpeg?alt=media&token=8ff09286-34ca-46fd-a506-e180cda3f3fd', false);

INSERT INTO swiftDB.presupuesto (id_gasto, nombre_Gasto, descripcion, monto, mes_Ingreso, num_Quincena) VALUES 
('1', 'Servicios', 'pago de agua y luz', 50000, 'Noviembre', '1'),
('2', 'Internet', 'Internet', 50000, 'Noviembre', '1'),
('3', 'Comida', 'Primera parte de comrpas', 150000, 'Noviembre', '2');

INSERT INTO swiftDB.ingreso (id_ingreso, nombre_ingreso, icono, monto, descripingreso) VALUES
('1','Pago Fijo', 'fas fa-briefcase', 500000, 'Planilla'),
('2','Pago Fijo', 'fas fa-briefcase', 300000, 'Planilla'),
('3','SP', 'fas fa-handshake', 150000, 'Servicios brindados a la comunidad');

INSERT INTO swiftDB.credito (id_credito, nombre_Credito, tipo_Credito, mes_Registro, monto, num_Cuotas, cuotas_Realizadas) VALUES 
('1', 'Taladro', 'Tarjeta Credito' , 'Noviembre', 50000, 5, 1),
('2', 'Mesa', 'Tarjeta Credito','Noviembre', 20000, 2, 0),
('3', 'Tienda', 'Financiamiento', 'Noviembre', 1500, 1, 1);

INSERT INTO swiftDB.ahorro (id_ahorro, nombre_ahorro, icono, monto, descripahorro) VALUES 
('1','Pago Fijo', 'fas fa-briefcase', 500000, 'Planilla'),
('2','Pago Fijo', 'fas fa-briefcase', 300000, 'Planilla'),
('3','SP', 'fas fa-handshake', 150000, 'Servicios brindados a la comunidad');

INSERT INTO swiftDB.movimientos (id_movimiento, nombre, descripcion, monto, fechaMovimiento, userID) VALUES 
('1', 'Pago fijo', 'Planilla', 500000, '2023-11-08', 1),
('2', 'Pago fijo', 'Planilla', 300000, '2023-11-08', 2),
('3', 'SP', 'Servicios brindados a comunidad', 150000, '2023-11-08', 1);

INSERT INTO swiftDB.rol (id_rol, nombre, id_usuario) VALUES
 (1,'ROLE_ADMIN',1), (2,'ROLE_ADMIN',2), (3,'ROLE_ADMIN',3)
