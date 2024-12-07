--Creacion de la base de  datos
CREATE DATABASE New_Sond
--Creación Tabla Alquileres–

CREATE TABLE Alquileres(
  Id_alquiler    INT     NOT NULL,
  Id_usuario     INT     NOT NULL,
  fecha_alquiler DATE    NULL    ,
  duracion       VARCHAR NULL    ,
  precio         DECIMAL NULL    ,
  estado         VARCHAR NULL    ,
  PRIMARY KEY (Id_alquiler));

--Creación Tabla Comentarios–

CREATE TABLE Comentarios(
  Id_comentarios   INT  NOT NULL,
  Id_usuario       INT  NOT NULL,
  comentario       TEXT NULL    ,
  fecha_comentario DATE NULL    ,
  PRIMARY KEY (Id_comentarios));


--Creación Tabla Comentarios_Salas–

CREATE TABLE Comentarios_Salas(
  Id_comentarios INT NOT NULL,
  Id_sala        INT NOT NULL,
  PRIMARY KEY (Id_comentarios, Id_sala));

--Creación Tabla Historial_Alquiler–

CREATE TABLE Historial_Alquiler(
  Id_historial     INT  NOT NULL,
  Id_usuario       INT  NOT NULL,
  Id_instrumento   INT  NOT NULL,
  fecha_alquiler   DATE NULL    ,
  fecha_devolucion DATE NULL    ,
  PRIMARY KEY (Id_historial));

--Creación Tabla Horario_Disponible–

CREATE TABLE Horario_Disponible(
  id_horario  INT  NOT NULL,
  Id_sala     INT  NOT NULL,
  fecha       DATE NULL    ,
  hora_inicio TIME NULL    ,
  hora_fin    TIME NULL    ,
  PRIMARY KEY (id_horario));

--Creación Tabla Instrumentos–

CREATE TABLE Instrumentos(
  Id_instrumento INT     NOT NULL,
  Id_venta       INT     NOT NULL,
  Id_sala        INT     NOT NULL,
  Id_alquiler    INT     NOT NULL,
  nombre         VARCHAR NULL    ,
  marca          VARCHAR NULL    ,
  tipo           VARCHAR NULL    ,
  precio_aquiler DECIMAL NULL    ,
  precio_venta   DECIMAL NULL    ,
  PRIMARY KEY (Id_instrumento));

--Creación Tabla Pagos–

CREATE TABLE Pagos(
  Id_pago     INT     NOT NULL,
  Id_usuario  INT     NOT NULL,
  monto       DECIMAL NULL    ,
  metodo_pago VARCHAR NULL    ,
  fecha_pago  DATE    NULL    ,
  PRIMARY KEY (Id_pago));

--Creación Tabla Perfil_Usuario–

CREATE TABLE Perfil_Usuario(
  Id_usuario   INT     NOT NULL,
  tipo_usuario VARCHAR NULL    ,
  dirreccion   VARCHAR NULL    ,
  descripcion  TEXT    NULL    ,
  PRIMARY KEY (Id_usuario));

–Creación Tabla Promociones–

CREATE TABLE Promociones(
  Id_promocion INT     NOT NULL,
  descripcion  TEXT    NULL    ,
  fecha_inicio DATE    NULL    ,
  fecha_fin    DATE    NULL    ,
  descuento    DECIMAL NULL    ,
  PRIMARY KEY (Id_promocion));

–Creación Tabla Promociones_Suscripciones–

CREATE TABLE Promociones_Suscripciones(
  Id_supcripcion INT NOT NULL,
  Id_promocion   INT NOT NULL,
  PRIMARY KEY (Id_supcripcion, Id_promocion));

--Creación Tabla Reservas–

CREATE TABLE Reservas(
  Id_reserva    INT  NOT NULL,
  Id_usuario    INT  NOT NULL,
  Id_sala       INT  NOT NULL,
  fecha_reserva DATE NULL    ,
  hora_inicio   TIME NULL    ,
  hora_fin      TIME NULL    ,
  PRIMARY KEY (Id_reserva));

--Creación Tabla Salas–

CREATE TABLE Salas(
  Id_sala     INT     NOT NULL,
  nombre      VARCHAR NULL    ,
  capacidad   INT     NULL    ,
  precio_hora DECIMAL NULL    ,
  PRIMARY KEY (Id_sala));

--Creación Tabla Suscripciones–

CREATE TABLE Suscripciones(
  Id_supcripcion   INT     NOT NULL,
  Id_usuario       INT     NOT NULL,
  tipo_suscripcion VARCHAR NULL    ,
  fecha_inicio     DATE    NULL    ,
  fecha_fin        DATE    NULL    ,
  PRIMARY KEY (Id_supcripcion));

--Creación Tabla Usuarios–

CREATE TABLE Usuarios(
  Id_usuario     INT     NOT NULL,
  Nombre         VARCHAR NULL    ,
  correo         VARCHAR NULL    ,
  contraseña     VARCHAR NULL    ,
  fecha_registro DATE    NULL    ,
  PRIMARY KEY (Id_usuario));

--Creación Tabla Ventas–

CREATE TABLE Ventas(
  Id_venta    INT     NOT NULL,
  Id_usuario  INT     NOT NULL,
  fecha_venta DATE    NULL    ,
  precio      DECIMAL NULL    ,
  PRIMARY KEY (Id_venta));

ALTER TABLE Promociones_Suscripciones
  ADD CONSTRAINT FK_Suscripciones_TO_Promociones_Suscripciones
    FOREIGN KEY (Id_supcripcion)
    REFERENCES Suscripciones (Id_supcripcion);

ALTER TABLE Promociones_Suscripciones
  ADD CONSTRAINT FK_Promociones_TO_Promociones_Suscripciones
    FOREIGN KEY (Id_promocion)
    REFERENCES Promociones (Id_promocion);

ALTER TABLE Pagos
  ADD CONSTRAINT FK_Usuarios_TO_Pagos
    FOREIGN KEY (Id_usuario)
    REFERENCES Usuarios (Id_usuario);

ALTER TABLE Comentarios
  ADD CONSTRAINT FK_Usuarios_TO_Comentarios
    FOREIGN KEY (Id_usuario)
    REFERENCES Usuarios (Id_usuario);

ALTER TABLE Reservas
  ADD CONSTRAINT FK_Usuarios_TO_Reservas
    FOREIGN KEY (Id_usuario)
    REFERENCES Usuarios (Id_usuario);

ALTER TABLE Alquileres
  ADD CONSTRAINT FK_Usuarios_TO_Alquileres
    FOREIGN KEY (Id_usuario)
    REFERENCES Usuarios (Id_usuario);

ALTER TABLE Reservas
  ADD CONSTRAINT FK_Salas_TO_Reservas
    FOREIGN KEY (Id_sala)
    REFERENCES Salas (Id_sala);

ALTER TABLE Horario_Disponible
  ADD CONSTRAINT FK_Salas_TO_Horario_Disponible
    FOREIGN KEY (Id_sala)
    REFERENCES Salas (Id_sala);

ALTER TABLE Ventas
  ADD CONSTRAINT FK_Usuarios_TO_Ventas
    FOREIGN KEY (Id_usuario)
    REFERENCES Usuarios (Id_usuario);

ALTER TABLE Instrumentos
  ADD CONSTRAINT FK_Ventas_TO_Instrumentos
    FOREIGN KEY (Id_venta)
    REFERENCES Ventas (Id_venta);

ALTER TABLE Historial_Alquiler
  ADD CONSTRAINT FK_Usuarios_TO_Historial_Alquiler
    FOREIGN KEY (Id_usuario)
    REFERENCES Usuarios (Id_usuario);

ALTER TABLE Historial_Alquiler
  ADD CONSTRAINT FK_Instrumentos_TO_Historial_Alquiler
    FOREIGN KEY (Id_instrumento)
    REFERENCES Instrumentos (Id_instrumento);

ALTER TABLE Suscripciones
  ADD CONSTRAINT FK_Usuarios_TO_Suscripciones
    FOREIGN KEY (Id_usuario)
    REFERENCES Usuarios (Id_usuario);

ALTER TABLE Instrumentos
  ADD CONSTRAINT FK_Salas_TO_Instrumentos
    FOREIGN KEY (Id_sala)
    REFERENCES Salas (Id_sala);

ALTER TABLE Perfil_Usuario
  ADD CONSTRAINT FK_Usuarios_TO_Perfil_Usuario
    FOREIGN KEY (Id_usuario)
    REFERENCES Usuarios (Id_usuario);

ALTER TABLE Comentarios_Salas
  ADD CONSTRAINT FK_Comentarios_TO_Comentarios_Salas
    FOREIGN KEY (Id_comentarios)
    REFERENCES Comentarios (Id_comentarios);

ALTER TABLE Comentarios_Salas
  ADD CONSTRAINT FK_Salas_TO_Comentarios_Salas
    FOREIGN KEY (Id_sala)
    REFERENCES Salas (Id_sala);
--
ALTER TABLE Instrumentos
  ADD CONSTRAINT FK_Alquileres_TO_Instrumentos
    FOREIGN KEY (Id_alquiler)
    REFERENCES Alquileres (Id_alquiler);


-- 1. Inserción de datos en la tabla Usuarios
INSERT INTO Usuarios (Id_usuario, Nombre, correo, contraseña, fecha_registro)
VALUES 
(1, 'Carlos Pérez', 'carlos.perez@email.com', 'pass1234', '2024-01-10'),
(2, 'Ana Gómez', 'ana.gomez@email.com', 'pass5678', '2024-02-15'),
(3, 'Luis Martínez', 'luis.martinez@email.com', 'pass9012', '2024-03-20'),
(4, 'María López', 'maria.lopez@email.com', 'pass3456', '2024-04-25'),
(5, 'José Fernández', 'jose.fernandez@email.com', 'pass7890', '2024-05-30');

-- 2. Inserción de datos en la tabla Perfil_Usuario
INSERT INTO Perfil_Usuario (Id_usuario, tipo_usuario, dirreccion, descripcion)
VALUES 
(1, 'Estudiante', 'Av. Siempre Viva 123', 'Apasionado por la música'),
(2, 'Profesional', 'Calle Falsa 456', 'Instructor de guitarra'),
(3, 'Hobby', 'Plaza Central 789', 'Músico aficionado'),
(4, 'Emergente', 'Carrera del Sol 101', 'Baterista en formación'),
(5, 'Profesional', 'Paseo de los Artistas 102', 'Violinista clásico');

-- 3. Inserción de datos en la tabla Salas
INSERT INTO Salas (Id_sala, nombre, capacidad, precio_hora)
VALUES 
(1, 'Sala A', 10, 50.00),
(2, 'Sala B', 15, 75.00),
(3, 'Sala C', 20, 100.00),
(4, 'Sala D', 5, 30.00),
(5, 'Sala E', 8, 45.00);

-- 4. Inserción de datos en la tabla Instrumentos
INSERT INTO Instrumentos (Id_instrumento, Id_venta, Id_sala, Id_alquiler, nombre, marca, tipo, precio_aquiler, precio_venta)
VALUES 
(1, 1, 1, 1, 'Guitarra Eléctrica', 'Fender', 'Cuerda', 20.00, 500.00),
(2, 2, 2, 'Batería', 'Yamaha', 'Percusión', 35.00, 800.00),
(3, 3, 3, 'Teclado', 'Casio', 'Teclas', 25.00, 400.00),
(4, 4, 4, 'Bajo', 'Ibanez', 'Cuerda', 22.00, 450.00),
(5, 5, 5, 'Violín', 'Stradivarius', 'Cuerda', 18.00, 600.00);

-- 5. Inserción de datos en la tabla Alquileres
INSERT INTO Alquileres (Id_alquiler, Id_usuario, fecha_alquiler, duracion, precio, estado)
VALUES 
(1, 1, '2024-01-10', '2 días', 40.00, 'Finalizado'),
(2, 2, '2024-02-15', '3 días', 105.00, 'En curso'),
(3, 3, '2024-03-20', '1 día', 25.00, 'Finalizado'),
(4, 4, '2024-04-25', '5 días', 110.00, 'Cancelado'),
(5, 5, '2024-05-30', '2 días', 36.00, 'Finalizado');

-- 6. Inserción de datos en la tabla Comentarios
INSERT INTO Comentarios (Id_comentarios, Id_usuario, comentario, fecha_comentario)
VALUES 
(1, 1, 'Excelente sala de ensayo, bien equipada', '2024-01-11'),
(2, 2, 'Me gustó el ambiente, volveré', '2024-02-16'),
(3, 3, 'Buena acústica, recomendable', '2024-03-21'),
(4, 4, 'Poco espacio en la sala, pero buen servicio', '2024-04-26'),
(5, 5, 'Instrumentos en perfecto estado', '2024-05-31');

-- 7. Inserción de datos en la tabla Comentarios_Salas
INSERT INTO Comentarios_Salas (Id_comentarios, Id_sala)
VALUES 
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5);

-- 8. Inserción de datos en la tabla Historial_Alquiler
INSERT INTO Historial_Alquiler (Id_historial, Id_usuario, Id_instrumento, fecha_alquiler, fecha_devolucion)
VALUES 
(1, 1, 1, '2024-01-10', '2024-01-12'),
(2, 2, 2, '2024-02-15', '2024-02-18'),
(3, 3, 3, '2024-03-20', '2024-03-21'),
(4, 4, 4, '2024-04-25', '2024-04-30'),
(5, 5, 5, '2024-05-30', '2024-06-01');

-- 9. Inserción de datos en la tabla Horario_Disponible
INSERT INTO Horario_Disponible (id_horario, Id_sala, fecha, hora_inicio, hora_fin)
VALUES 
(1, 1, '2024-06-01', '10:00:00', '12:00:00'),
(2, 2, '2024-06-02', '14:00:00', '16:00:00'),
(3, 3, '2024-06-03', '12:00:00', '14:00:00'),
(4, 4, '2024-06-04', '16:00:00', '18:00:00'),
(5, 5, '2024-06-05', '18:00:00', '20:00:00');

-- 10. Inserción de datos en la tabla Pagos
INSERT INTO Pagos (Id_pago, Id_usuario, monto, metodo_pago, fecha_pago)
VALUES 
(1, 1, 50.00, 'Tarjeta de Crédito', '2024-01-10'),
(2, 2, 75.00, 'PayPal', '2024-02-15'),
(3, 3, 100.00, 'Tarjeta de Débito', '2024-03-20'),
(4, 4, 30.00, 'Efectivo', '2024-04-25'),
(5, 5, 45.00, 'Transferencia Bancaria', '2024-05-30');

-- 11. Inserción de datos en la tabla Promociones
INSERT INTO Promociones (Id_promocion, descripcion, fecha_inicio, fecha_fin, descuento)
VALUES 
(1, 'Descuento de verano', '2024-06-01', '2024-07-01', 10.00),
(2, 'Promo de estudiantes', '2024-07-01', '2024-08-01', 15.00),
(3, 'Pack instrumentos', '2024-08-01', '2024-09-01', 20.00),
(4, 'Descuento por horas extras', '2024-09-01', '2024-10-01', 25.00),
(5, 'Fidelidad cliente', '2024-10-01', '2024-11-01', 30.00);

-- 12. Inserción de datos en la tabla Promociones_Suscripciones
INSERT INTO Promociones_Suscripciones (Id_supcripcion, Id_promocion)
VALUES 
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5);

-- 13. Inserción de datos en la tabla Reservas
INSERT INTO Reservas (Id_reserva, Id_usuario, Id_sala, fecha_reserva, hora_inicio, hora_fin)
VALUES 
(1, 1, 1, '2024-06-01', '10:00:00', '12:00:00'),
(2, 2, 2, '2024-06-02', '14:00:00', '16:00:00'),
(3, 3, 3, '2024-06-03', '12:00:00', '14:00:00'),
(4, 4, 4, '2024-06-04', '16:00:00', '18:00:00'),
(5, 5, 5, '2024-06-05', '18:00:00', '20:00:00');

-- 14. Inserción de datos en la tabla Suscripciones
INSERT INTO Suscripciones (Id_supcripcion, Id_usuario, tipo_suscripcion, fecha_inicio, fecha_fin)
VALUES 
(1, 1, 'Free', '2024-01-01', '2024-01-31'),
(2, 2, 'Gold', '2024-02-01', '2024-02-28'),
(3, 3, 'Platinum', '2024-03-01', '2024-03-31'),
(4, 4, 'Free', '2024-04-01', '2024-04-30'),
(5, 5, 'Gold', '2024-05-01', '2024-05-31');

-- 15. Inserción de datos en la tabla Ventas
INSERT INTO Ventas (Id_venta, Id_usuario, fecha_venta, precio)
VALUES 
(1, 1, '2024-01-10', 500.00),
(2, 2, '2024-02-15', 800.00),
(3, 3, '2024-03-20', 400.00),
(4, 4, '2024-04-25', 450.00),
(5, 5, '2024-05-30', 600.00);

-- cnsultas
create function ObtenerAlquileresActivosUsuario(@IdUsuario int)
returns int
as
begin
    declare @TotalAlquileres int
    select @TotalAlquileres = count(*)
    from Alquileres
    where Id_usuario = @IdUsuario
      and estado = 'Activo'

    return @TotalAlquileres
end

select dbo.ObtenerAlquileresActivosUsuario(1) as AlquileresActivos
go


--fuction
create function CalcularTotalPagadoPorUsuario(@IdUsuario int)
returns decimal(10, 2)
as
begin
declare @TotalPagado decimal(10, 2)
select @TotalPagado = sum(monto)
from Pagos
 where Id_usuario = @IdUsuario

return @TotalPagado
end

select dbo.CalcularTotalPagadoPorUsuario(1) as TotalPagado
go
--procedure
create procedure ActualizarEstadoAlquiler(@IdAlquiler int, @NuevoEstado varchar(20))
as
begin
    UPDATE Alquileres
    set estado = @NuevoEstado
    where Id_alquiler = @IdAlquiler

    print 'El estado del alquiler ha sido actualizado exitosamente.'
end

EXEC ActualizarEstadoAlquiler @IdAlquiler = 5, @NuevoEstado = 'Finalizado'
go

