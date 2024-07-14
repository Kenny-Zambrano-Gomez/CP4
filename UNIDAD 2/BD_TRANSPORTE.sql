USE bd_transporte;

CREATE TABLE Clientes (
  id_cliente INT PRIMARY KEY NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  historial_servicio TEXT
);

CREATE TABLE Vehiculos (
  id_vehiculo INT PRIMARY KEY NOT NULL,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  matricula VARCHAR(20) NOT NULL,
  estado_mantenimiento VARCHAR(50) NOT NULL
);

CREATE TABLE Rutas (
  id_ruta INT PRIMARY KEY NOT NULL,
  origen VARCHAR(100) NOT NULL,
  destino VARCHAR(100) NOT NULL,
  distancia DECIMAL(10,2) NOT NULL,
  tiempo_estimado DECIMAL(10,2) NOT NULL
);

CREATE TABLE Viajes (
  id_viaje INT PRIMARY KEY NOT NULL,
  id_cliente INT NOT NULL,
  id_vehiculo INT NOT NULL,
  id_ruta INT NOT NULL,
  fecha_inicio DATETIME NOT NULL,
  fecha_fin DATETIME NOT NULL,
  distancia DECIMAL(10,2) NOT NULL,
  duracion DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
  FOREIGN KEY (id_vehiculo) REFERENCES Vehiculos(id_vehiculo),
  FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta)
);

CREATE TABLE Incidencias (
  id_incidencia INT PRIMARY KEY NOT NULL,
  id_viaje INT NOT NULL,
  tipo_incidencia VARCHAR(50) NOT NULL,
  descripcion VARCHAR(250) NOT NULL,
  fecha_registro DATETIME NOT NULL,
  FOREIGN KEY (id_viaje) REFERENCES Viajes(id_viaje)
);
