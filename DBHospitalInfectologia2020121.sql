/*

	Nombre del Programador: Daniel Alejandro Juárez García.
    Código Técnico: IN5AV.
    Carné: 2020121.
    Fecha de Creación: 
		05/02/2021.
		Modificaciones:
			05/02/2021.
			06/02/2021.
			07/02/2021.
*/


create database DBHospitalInfectologia2020121;
use DBHospitalInfectologia2020121;



/*-------------------Creación de todas las tablas-------------------*/


/*-Creación de tabla Medicos-*/
create table Medicos(
	condigoMedico int not null auto_increment,
    licenciaMedica int not null,
    nombresMedico varchar(100) not null,
    apellidosMedico varchar(100) not null,
    horaEntrada DATETIME not null,
    horaSalida DATETIME not null,
    turnoMaximo int not null,
    sexo varchar(20) not null,
    primary key PK_condigoMedico(condigoMedico)
);



/*-Creación de la tabla Horarios-*/
create table Horarios(
	codigoHorario int not null auto_increment,
    horarioInicio DATETIME not null,
    horarioSalida DATETIME not null,
    lunes boolean,
    martes boolean,
    miercoles boolean,
    jueves boolean,
    viernes boolean,
    primary key PK_codigoHorario(codigoHorario)
);



/*-Creación de la tabla Especialidades-*/
create table Especialidades(
	codigoEspecialidad int not null auto_increment,
    nombreEspecialidad varchar(45) not null,
    primary key PK_codigoEspecialidad(codigoEspecialidad)
);



/*-Creación de la tabla Areas-*/
create table Areas(
	codigoArea int not null auto_increment,
    nombreArea varchar(45) not null,
    primary key PK_codigoArea(codigoArea)
);



/*-Creación de la tabla Cargos-*/
create table Cargos(
	codigoCargo int not null auto_increment,
    nombreCargo varchar(45) not null,
    primary key PK_codigoCargo(codigoCargo)
);



/*-Creación de la tabla Pacientes-*/
create table Pacientes(
	codigoPaciente int not null auto_increment,
    DPI varchar(20) not null,
    apellidosPaciente varchar(100) not null,
    nombresPaciente varchar(100) not null,
    fechaNacimiento DATE not null,
    edad int,
    direccionPaciente varchar(150) not null,
    ocupacionPaciente varchar(50) not null,
    sexo varchar(15) not null,
    primary key PK_codigoPaciente(codigoPaciente)
);




/*-Creación de la tabla TelefonoMedico-*/
create table TelefonoMedico(
	codigoTelefonoMedico int not null auto_increment,
    telefonoPersonal varchar(15) not null,
    telefonoTrabajo varchar(15),
    primary key PK_codigoTelefonoMedico(codigoTelefonoMedico),
    condigoMedico int not null,
		constraint FK_TelefonoMedico_Medicos
			foreign key (condigoMedico) references Medicos (condigoMedico)
);



/*-Creación de la tabla MedicoEspecialidad-*/
create table MedicoEspecialidad(
	codigoMedicoEspecialidad int not null auto_increment,
    primary key PK_codigoMedicoEspecialidad(codigoMedicoEspecialidad),
    condigoMedico int not null,
		constraint FK_MedicoEspecialidad_Medicos
			foreign key (condigoMedico) references Medicos (condigoMedico),
    codigoEspecialidad int not null,
		constraint FK_MedicoEspecialidad_Especialidades
			foreign key (codigoEspecialidad) references Especialidades (codigoEspecialidad),
    codigoHorario int not null,
		constraint FK_MedicoEspecialidad_Horarios
			foreign key (codigoHorario) references Horarios (codigoHorario)
    
);



/*-Creación de la tabla ResponsableTurno-*/
create table ResponsableTurno(
	codigoResponsableTurno int not null auto_increment,
    nombreResponsable varchar(75) not null,
    apellidosResponsable varchar(45) not null,
    telefonoPersonal varchar(10) not null,
    primary key PK_codigoResponsableTurno (codigoResponsableTurno),
    codigoArea int not null,
		constraint FK_ResponsableTurno_Areas
			foreign key (codigoArea) references Areas (codigoArea),
    codigoCargo int not null,
		constraint FK_ResponsableTurno_Cargos
			foreign key (codigoCargo) references Cargos (codigoCargo)
    
);



/*-Creación de la tabla Turno-*/
create table Turno(
	codigoTurno int not null auto_increment,
    fechaTurno DATE not null,
    fechaCita DATE not null,
    valorCita DECIMAL (10,2) not null,
    primary key PK_codigoTurno (codigoTurno),
    codigoResponsableTurno int not null,
		constraint FK_Turno_ResponsableTurno
			foreign key ( codigoResponsableTurno) references ResponsableTurno ( codigoResponsableTurno),
    codigoPaciente int not null,
		constraint FK_Turno_Pacientes
			foreign key (codigoPaciente) references Pacientes (codigoPaciente),
    codigoMedicoEspecialidad int not null,
		constraint FK_Turno_MedicoEspecialidad
			foreign key (codigoMedicoEspecialidad) references MedicoEspecialidad (codigoMedicoEspecialidad)
);



/*-Creación de la tabla ContactoUrgencia-*/
create table ContactoUrgencia(
	codigoContactoUrgencia int not null auto_increment,
    nombresUrgencia varchar(100) not null,
    apellidosUrgencia varchar(100) not null,
    numeroContactoUr varchar(10) not null,
    primary key PK_codigoContactoUrgencia(codigoContactoUrgencia),
    codigoPaciente int not null,
		constraint FK_ContactoUrgencia_Pacientes
			foreign key (codigoPaciente) references Pacientes (codigoPaciente)
);




/*------------Insert de 5 registros en todas las tablas-------------*/



/*-Insertando 5 registros a la tabla Medicos-*/
insert into Medicos(licenciaMedica, nombresMedico, apellidosMedico, 
	horaEntrada, horaSalida, turnoMaximo, sexo) 
		values(2-34001158,'Allan Mateo','Ramírez Werner','2013-11-24 06:00:00','2013-11-24 21:00:00',1,'Masculino');
insert into Medicos(licenciaMedica, nombresMedico, apellidosMedico, 
	horaEntrada, horaSalida, turnoMaximo, sexo) 
		values(1-78945261,'Moises Gerardo','Leiva Estrada','2013-12-25 05:30:00','2013-12-25 22:30:00',2,'Masculino');
insert into Medicos(licenciaMedica, nombresMedico, apellidosMedico, 
	horaEntrada, horaSalida, turnoMaximo, sexo) 
		values(3-10101326,'Lesvia Carolina','Orozco Ramírez','2014-01-01 07:45:00','2014-01-01 19:45:00',1,'Femenino');
insert into Medicos(licenciaMedica, nombresMedico, apellidosMedico, 
	horaEntrada, horaSalida, turnoMaximo, sexo) 
		values(4-14725890,'Elizablet Yuki','Standli Walker','2013-09-14 09:30:00','2013-09-14 22:45:00',2,'Femenino');
insert into Medicos(licenciaMedica, nombresMedico, apellidosMedico, 
	horaEntrada, horaSalida, turnoMaximo, sexo) 
		values(5-58216179,'Daniel Ale','Miranda López','2013-10-10 05:00:00','2013-10-10 23:00:00',2,'Masculino');



/*-Insertando 5 registros a la tabla Horarios-*/
insert into Horarios (horarioInicio, horarioSalida, 
	lunes, martes, miercoles, jueves, viernes) 
		values ('2013-11-24 06:00:00','2013-11-24 22:30:00',1,0,0,1,1);
insert into Horarios (horarioInicio, horarioSalida, 
	lunes, martes, miercoles, jueves, viernes) 
		values ('2013-11-25 06:00:00','2013-11-25 22:30:00',0,0,0,0,0);
insert into Horarios (horarioInicio, horarioSalida, 
	lunes, martes, miercoles, jueves, viernes) 
		values ('2013-11-26 07:00:00','2013-11-26 22:00:00',1,1,1,1,1);
insert into Horarios (horarioInicio, horarioSalida, 
	lunes, martes, miercoles, jueves, viernes) 
		values ('2013-11-27 05:00:00','2013-11-27 21:00:00',1,0,1,0,1);
insert into Horarios (horarioInicio, horarioSalida, 
	lunes, martes, miercoles, jueves, viernes) 
		values ('2013-11-28 09:00:00','2013-11-28 19:30:00',1,1,1,0,0);


 
/*-Insertando 5 registros a la tabla Especialidades-*/
insert into Especialidades (nombreEspecialidad) values ('Dermatología');
insert into Especialidades (nombreEspecialidad) values ('Oftalmología');
insert into Especialidades (nombreEspecialidad) values ('Otorrinolaringología');
insert into Especialidades (nombreEspecialidad) values ('Traumatología');
insert into Especialidades (nombreEspecialidad) values ('Urología');



/*-Insertando 5 registros a la tabla Areas-*/
insert into Areas (nombreArea) values ('Asistencial');
insert into Areas (nombreArea) values ('Investigación');
insert into Areas (nombreArea) values ('Emergencias médicas');
insert into Areas (nombreArea) values ('Medicina estética');
insert into Areas (nombreArea) values ('Informativa');



/*-Insertando 5 registros a la tabla Cargos-*/
insert into Cargos (nombreCargo) values ('Gerente');
insert into Cargos (nombreCargo) values ('Sub_Gerente');
insert into Cargos (nombreCargo) values ('Administrador de datos de pacientes');
insert into Cargos (nombreCargo) values ('Enfermero (a)');
insert into Cargos (nombreCargo) values ('Asistente medico');



/*-Insertando 5 registro a la tabla Pacientes-*/
insert into Pacientes (DPI, apellidosPaciente, nombresPaciente, 
	fechaNacimiento, edad, direccionPaciente, ocupacionPaciente, sexo) 
		values ('1002348059758','Juárez García','Eduardo Higinio','2002-09-14',18,'Lote6 MazanaB Sector2 ElBucaro Villa Nueva','Mecanico','Masculino');
insert into Pacientes (DPI, apellidosPaciente, nombresPaciente, 
	fechaNacimiento, edad, direccionPaciente, ocupacionPaciente, sexo) 
		values ('1478597853001','Miranda Hernandez','Bryan Juan','2003-10-20',17,'Lote9 MazanaA Sector1 LaSexta Villa Nueva','Programador','Masculino');
insert into Pacientes (DPI, apellidosPaciente, nombresPaciente, 
	fechaNacimiento, edad, direccionPaciente, ocupacionPaciente, sexo) 
		values ('1346798264980','Messi Cuzzitini','Lionel Andres','1987-06-24',33,'España','Futbolista','Masculino');
insert into Pacientes (DPI, apellidosPaciente, nombresPaciente, 
	fechaNacimiento, edad, direccionPaciente, ocupacionPaciente, sexo) 
		values ('3968257497804','Jose Miguel','Hernandez Dias','2003-08-10',17,'21A Avenida Villa Nueva','Contador','Masculino');
insert into Pacientes (DPI, apellidosPaciente, nombresPaciente, 
	fechaNacimiento, edad, direccionPaciente, ocupacionPaciente, sexo) 
		values ('1000210034678','Regina Elizabeth','Gonzales Woj','2003-02-17',17,'4a Calle, Zona 2, Residenciales Villa Lobos','Maestra','Femenino');
        
        
        
/*-Insertando 5 registros a la tabla TelefonoMedico-*/
insert into TelefonoMedico (telefonoPersonal,telefonoTrabajo,condigoMedico) values ('10245784','11315240',1);
insert into TelefonoMedico (telefonoPersonal,telefonoTrabajo,condigoMedico) values ('78954872','',2);
insert into TelefonoMedico (telefonoPersonal,telefonoTrabajo,condigoMedico) values ('10102360','33639682',3);
insert into TelefonoMedico (telefonoPersonal,telefonoTrabajo,condigoMedico) values ('19985230','10328977',4);
insert into TelefonoMedico (telefonoPersonal,telefonoTrabajo,condigoMedico) values ('10102121','98987414',5);



    
/*-Insertando 5 registros en la tabla MedicoEspecialidad-*/
insert into MedicoEspecialidad (condigoMedico,codigoEspecialidad,codigoHorario) values (1,1,1);
insert into MedicoEspecialidad (condigoMedico,codigoEspecialidad,codigoHorario) values (2,2,2);
insert into MedicoEspecialidad (condigoMedico,codigoEspecialidad,codigoHorario) values (3,3,3);
insert into MedicoEspecialidad (condigoMedico,codigoEspecialidad,codigoHorario) values (4,4,4);
insert into MedicoEspecialidad (condigoMedico,codigoEspecialidad,codigoHorario) values (5,5,5);

    
    
/*-Insertando 5 registros a la tabla ResponsableTurno-*/
insert into ResponsableTurno (nombreResponsable, apellidosResponsable, telefonoPersonal, 
	codigoArea, codigoCargo) 
		values ('Allan Mateo',' Ramírez Werner','14144545',1,2);
insert into ResponsableTurno (nombreResponsable, apellidosResponsable, telefonoPersonal, 
	codigoArea, codigoCargo) 
		values ('Moises Gerardo','Leiva Estrada','10121012',2,1);
insert into ResponsableTurno (nombreResponsable, apellidosResponsable, telefonoPersonal, 
	codigoArea, codigoCargo) 
		values ('Lesvia Carolina','Orozco Ramírez','58474789',3,4);
insert into ResponsableTurno (nombreResponsable, apellidosResponsable, telefonoPersonal, 
	codigoArea, codigoCargo) 
		values ('Elizablet Yuki','Standli Walker','88997744',4,5);
insert into ResponsableTurno (nombreResponsable, apellidosResponsable, telefonoPersonal, 
	codigoArea, codigoCargo) 
		values ('Daniel Ale','Miranda López','61218579',5,3);



        
/*-Insertando 5 registros a la tabla Turno-*/
insert into Turno (fechaTurno, fechaCita, valorCita, codigoResponsableTurno, 
	codigoPaciente, codigoMedicoEspecialidad) 
		values ('2014-01-25','2014-01-30',450.50,1,1,1);
insert into Turno (fechaTurno, fechaCita, valorCita, codigoResponsableTurno, 
	codigoPaciente, codigoMedicoEspecialidad) 
		values ('2014-02-01','2014-02-11',500.20,2,2,2);
insert into Turno (fechaTurno, fechaCita, valorCita, codigoResponsableTurno, 
	codigoPaciente, codigoMedicoEspecialidad) 
		values ('2014-02-25','2014-03-05',250.10,3,3,3);
insert into Turno (fechaTurno, fechaCita, valorCita, codigoResponsableTurno, 
	codigoPaciente, codigoMedicoEspecialidad) 
		values ('2014-03-15','2014-03-28',300.75,4,4,4);
insert into Turno (fechaTurno, fechaCita, valorCita, codigoResponsableTurno, 
	codigoPaciente, codigoMedicoEspecialidad) 
		values ('2014-04-10','2014-04-23',700.15,5,5,5);

        
        
/*-Insertando 5 registros a la tabla ContactoUrgencia-*/
insert into ContactoUrgencia (nombresUrgencia, apellidosUrgencia, 
	numeroContactoUr, codigoPaciente) 
		values ('Juan Luis','Blue Soul','12233665',5);
insert into ContactoUrgencia (nombresUrgencia, apellidosUrgencia, 
	numeroContactoUr, codigoPaciente) 
		values ('Davis Enrique','Lopez Cabeza','20201415',4);
insert into ContactoUrgencia (nombresUrgencia, apellidosUrgencia, 
	numeroContactoUr, codigoPaciente) 
		values ('Gary Otoniel','Navarro García','22033648',3);
insert into ContactoUrgencia (nombresUrgencia, apellidosUrgencia, 
	numeroContactoUr, codigoPaciente) 
		values ('Ezequiel Arturo','Ramíres Orozco','25836945',2);
insert into ContactoUrgencia (nombresUrgencia, apellidosUrgencia, 
	numeroContactoUr, codigoPaciente) 
		values ('Jose Isaac','Del Cid Balle','78746985',1);





/*---------------------Creación de SELECT para cada entidad---------------------*/



/*-Select para la tabla TelefonoMedico-*/
select
	TelefonoMedico.codigoTelefonoMedico, 
    TelefonoMedico.telefonoPersonal, 
    TelefonoMedico.telefonoTrabajo, 
    TelefonoMedico.condigoMedico
		from TelefonoMedico;
        
        
        
/*-Select para la tabla Medicos-*/
select
	M.condigoMedico, 
    M.licenciaMedica, 
    M.nombresMedico, 
    M.apellidosMedico, 
    M.horaEntrada, 
    M.horaSalida, 
    M.turnoMaximo, 
    M.sexo
		from Medicos M;
        
        
        
/*-Select para la tabla Horarios-*/
select
	H.codigoHorario, 
    H.horarioInicio, 
    H.horarioSalida, 
    H.lunes, 
    H.martes, 
    H.miercoles, 
    H.jueves, 
    H.viernes
		from Horarios H;
        
        
        
/*-Select para la tabla MedicoEspecialidad-*/
select
	ME.codigoMedicoEspecialidad,
    ME.condigoMedico, 
    ME.codigoEspecialidad,
    ME.codigoHorario
		from MedicoEspecialidad ME;
        
        
        
/*-Select para la tabla Especialidades-*/
select 
	E.codigoEspecialidad, 
    E.nombreEspecialidad
		from Especialidades E;
        
        
        
/*-Select para la tabla Turno-*/
select 
	T.codigoTurno, 
    T.fechaTurno, 
    T.fechaCita,
    T.valorCita, 
    T.codigoResponsableTurno,
    T.codigoPaciente, 
    T.codigoMedicoEspecialidad
		from Turno T;
        
        
        
/*-Select para la tabla ResponsableTurno-*/
select 
	Rt.codigoResponsableTurno,
    Rt.nombreResponsable,
    Rt.apellidosResponsable, 
    Rt.telefonoPersonal, 
    Rt.codigoArea, 
    Rt.codigoCargo
		from ResponsableTurno Rt;
        
        
        
/*-Select para la tabla Areas-*/
select 
	A.codigoArea,
    A.nombreArea
		from Areas A;
        
        
        
/*-Select para la tabla Cargos-*/
select 
	C.codigoCargo, 
    C.nombreCargo
		from Cargos C;
        
        
        
/*-Select para la tabla Pacientes-*/
select 
	P.codigoPaciente,
    P.DPI, 
    P.apellidosPaciente,
    P.nombresPaciente,
    P.fechaNacimiento,
    P.edad, 
    P.direccionPaciente, 
    P.ocupacionPaciente,
    P.sexo
		from Pacientes P;
        
        
        
/*-Select para la tabla ContactoUrgencia-*/
select 
	CU.codigoContactoUrgencia,
    CU.nombresUrgencia,
    CU.apellidosUrgencia, 
    CU.numeroContactoUr,
    CU.codigoPaciente
		from ContactoUrgencia CU;
        
        
        
 
/*-------------Creación de UPDATE para cada tabla-------------*/


/*-Update para la tabla TelefonoMedico-*/
 update TelefonoMedico
	set telefonoPersonal='36479820',
		telefonoTrabajo = '', 
		condigoMedico = 5
			where codigoTelefonoMedico=1;
            
 update TelefonoMedico
	set telefonoPersonal='102102255',
		telefonoTrabajo = '78965817', 
		condigoMedico = 4
			where codigoTelefonoMedico=2;
            
 update TelefonoMedico
	set telefonoPersonal='78945687',
		telefonoTrabajo = '74102102', 
		condigoMedico = 3
			where codigoTelefonoMedico=3;
            
 update TelefonoMedico
	set telefonoPersonal='99999999',
		telefonoTrabajo = '77778888', 
		condigoMedico = 2
			where codigoTelefonoMedico=4;
            
 update TelefonoMedico
	set telefonoPersonal='11110001',
		telefonoTrabajo = '22223323', 
		condigoMedico = 1
			where codigoTelefonoMedico=5;
		
        
        
/*-Update para la tabla Medicos-*/
update Medicos
	set licenciaMedica = 12451785, 
		nombresMedico = 'Juan Carlos',
        apellidosMedico = 'Rodriguez Rod',
        horaEntrada = '2013-11-24 06:00:00',
        horaSalida = '2013-11-24 21:00:00',
        turnoMaximo = 2,
        sexo = 'Masculino'
			where condigoMedico=1;
            
update Medicos
	set licenciaMedica = 10101458, 
		nombresMedico = 'Luisa Mariana',
        apellidosMedico = 'Valle Boj',
        horaEntrada = '2013-12-01 06:00:00',
        horaSalida = '2013-12-01 21:00:00',
        turnoMaximo = 1,
        sexo = 'Femenino'
			where condigoMedico=2;
            
update Medicos
	set licenciaMedica = 255847150, 
		nombresMedico = 'Armando Jorge',
        apellidosMedico = 'Juárez Gabriel',
        horaEntrada = '2014-01-01 06:00:00',
        horaSalida = '2014-01-01 22:45:00',
        turnoMaximo = 2,
        sexo = 'Masculino'
			where condigoMedico=3;
            
update Medicos
	set licenciaMedica = 10546983, 
		nombresMedico = 'Fredy Rodrigo',
        apellidosMedico = 'Lopez Bautista',
        horaEntrada = '2014-01-10 06:45:00',
        horaSalida = '2014-01-10 21:45:00',
        turnoMaximo = 2,
        sexo = 'Masculino'
			where condigoMedico=4;
            
update Medicos
	set licenciaMedica = 10203020, 
		nombresMedico = 'Lesly Julia',
        apellidosMedico = 'Gabriel Rene',
        horaEntrada = '2014-01-15 07:00:00',
        horaSalida = '2014-01-15 22:45:00',
        turnoMaximo = 2,
        sexo = 'Femenino'
			where condigoMedico=5;
            
            
            
/*-Update para la tabla Horarios-*/
update Horarios
	set horarioInicio = '2013-12-01 05:30:00', 
		horarioSalida = '2013-12-01 19:45:00', 
        lunes = 1, 
        martes = 1, 
        miercoles = 1,
        jueves = 1, 
        viernes = 0
			where codigoHorario=1;

update Horarios
	set horarioInicio = '2013-12-10 07:30:00', 
		horarioSalida = '2013-12-10 18:00:00', 
        lunes = 0, 
        martes = 1, 
        miercoles = 0,
        jueves = 1, 
        viernes = 1
			where codigoHorario=2;

update Horarios
	set horarioInicio = '2013-12-15 08:45:00', 
		horarioSalida = '2013-12-15 17:30:00', 
        lunes = 1, 
        martes = 0, 
        miercoles = 1,
        jueves = 0, 
        viernes = 1
			where codigoHorario=3;
            
update Horarios
	set horarioInicio = '2013-12-20 10:00:00', 
		horarioSalida = '2013-12-20 23:00:00', 
        lunes = 1, 
        martes = 1, 
        miercoles = 0,
        jueves = 0, 
        viernes = 0
			where codigoHorario=4;
            
update Horarios
	set horarioInicio = '2013-12-25 04:00:00', 
		horarioSalida = '2013-12-25 17:00:00', 
        lunes = 0, 
        martes = 0, 
        miercoles = 0,
        jueves = 0, 
        viernes = 0
			where codigoHorario=5;
            
            
            
/*-Update de la tabla MedicoEspecialidad-*/
update MedicoEspecialidad
	set condigoMedico =5, 
		codigoEspecialidad=5, 
        codigoHorario=5
			where codigoMedicoEspecialidad=1;
            
update MedicoEspecialidad
	set condigoMedico =4, 
		codigoEspecialidad=4, 
        codigoHorario=4
			where codigoMedicoEspecialidad=2;
            
update MedicoEspecialidad
	set condigoMedico =3, 
		codigoEspecialidad=3, 
        codigoHorario=3
			where codigoMedicoEspecialidad=3;
            
update MedicoEspecialidad
	set condigoMedico =2, 
		codigoEspecialidad=2, 
        codigoHorario=2
			where codigoMedicoEspecialidad=4;
            
update MedicoEspecialidad
	set condigoMedico =1, 
		codigoEspecialidad=1, 
        codigoHorario=1
			where codigoMedicoEspecialidad=5;
            
/*-Update de la tabla Especialidades-*/
update Especialidades
	set nombreEspecialidad = 'Toxicología'
		where codigoEspecialidad=1;
        
update Especialidades
	set nombreEspecialidad = 'Reumatología'
		where codigoEspecialidad=2;
        
update Especialidades
	set nombreEspecialidad = 'Psiquiatría'
		where codigoEspecialidad=3;
        
update Especialidades
	set nombreEspecialidad = 'Pediatría'
		where codigoEspecialidad=4;
        
update Especialidades
	set nombreEspecialidad = 'Neurología'
		where codigoEspecialidad=5;
        
        
        
/*-Update de la tabla ResponsableTurno-*/
select * from ResponsableTurno;
update ResponsableTurno
	set nombreResponsable='Osacar Emilio', 
		apellidosResponsable='Ortiz de Leon', 
		telefonoPersonal='',
        codigoArea=5, 
        codigoCargo=3
			where codigoResponsableTurno=1;
            
update ResponsableTurno
	set nombreResponsable='Diego Javier', 
		apellidosResponsable='Monterroso Altamirano', 
		telefonoPersonal='10245874',
        codigoArea=4, 
        codigoCargo=5
			where codigoResponsableTurno=2;
            
update ResponsableTurno
	set nombreResponsable='Josue Cristofher', 
		apellidosResponsable='Chajon Cano', 
		telefonoPersonal='',
        codigoArea=3, 
        codigoCargo=4
			where codigoResponsableTurno=3;
            
update ResponsableTurno
	set nombreResponsable='Henry Fernando', 
		apellidosResponsable='Lima Osorio', 
		telefonoPersonal='10003658',
        codigoArea=2, 
        codigoCargo=1
			where codigoResponsableTurno=4;
            
update ResponsableTurno
	set nombreResponsable='Edgar Carlos', 
		apellidosResponsable='Garcia Lara', 
		telefonoPersonal='',
        codigoArea=1, 
        codigoCargo=2
			where codigoResponsableTurno=5;
            
            
            
/*-Update de la tabla Turno-*/
select * from Turno;
update Turno
	set fechaTurno='2014-05-05', 
		fechaCita='2014-05-15', 
        valorCita=300.12, 
        codigoResponsableTurno=5, 
        codigoPaciente=5,
        codigoMedicoEspecialidad=5
			where codigoTurno=1;
            
update Turno
	set fechaTurno='2014-06-10', 
		fechaCita='2014-06-25', 
        valorCita=290.80, 
        codigoResponsableTurno=4, 
        codigoPaciente=4,
        codigoMedicoEspecialidad=4
			where codigoTurno=2;
            
update Turno
	set fechaTurno='2014-07-20', 
		fechaCita='2014-07-30', 
        valorCita=800.00, 
        codigoResponsableTurno=3, 
        codigoPaciente=3,
        codigoMedicoEspecialidad=3
			where codigoTurno=3;
            
update Turno
	set fechaTurno='2014-08-01', 
		fechaCita='2014-08-15', 
        valorCita=600.90, 
        codigoResponsableTurno=2, 
        codigoPaciente=2,
        codigoMedicoEspecialidad=2
			where codigoTurno=4;
            
update Turno
	set fechaTurno='2014-09-05', 
		fechaCita='2014-09-19', 
        valorCita=690.60, 
        codigoResponsableTurno=1, 
        codigoPaciente=1,
        codigoMedicoEspecialidad=1
			where codigoTurno=5;
            
            
            
/*-Update de la tabla Areas-*/
select *from Areas;
update Areas
	set nombreArea='Cardiología'
		where codigoArea=1;
	
update Areas
	set nombreArea='Endocrinología'
		where codigoArea=2;
        
update Areas
	set nombreArea='Anesteciología'
		where codigoArea=3;
        
update Areas
	set nombreArea='Medicina interna'
		where codigoArea=4;
        
update Areas
	set nombreArea='Infectología'
		where codigoArea=5;
        
        
        
/*-Update de la tabla Cargos-*/
update Cargos
	set nombreCargo='Médico responsable'
		where codigoCargo=1;
        
update Cargos
	set nombreCargo='Especialistas'
		where codigoCargo=2;
        
update Cargos
	set nombreCargo='Personal de enfermería'
		where codigoCargo=3;
        
update Cargos
	set nombreCargo='Enfermeras en prácticas y asistentes médicos'
		where codigoCargo=4;
        
update Cargos
	set nombreCargo='Auxiliares de enfermería'
		where codigoCargo=5;
        
        
        
/*-Update para la tabla Pacientes-*/
update Pacientes
	set DPI='1020312010312', 
		apellidosPaciente='Lopes Garcia',
        nombresPaciente='Evenilsa Margoli', 
        fechaNacimiento='1975-08-18', 
        edad=44, 
        direccionPaciente='17-21 Av.Aguilar Batres zona 7',
        ocupacionPaciente='Mestra', 
        sexo='Femenino'
			where codigoPaciente=1;
            
update Pacientes
	set DPI='1415263520164', 
		apellidosPaciente='Herrera Cortez',
        nombresPaciente='Karen Belli', 
        fechaNacimiento='1990-10-25', 
        edad=0, 
        direccionPaciente='20-55 Calle.45 Colonia San Juan zona 10',
        ocupacionPaciente='Abogada', 
        sexo='Femenino'
			where codigoPaciente=2;
            
update Pacientes
	set DPI='1474542105680', 
		apellidosPaciente='Poarch Gucci',
        nombresPaciente='Bella Kaity', 
        fechaNacimiento='1981-11-02', 
        edad=0, 
        direccionPaciente='30-66 Calle.11 Colonia Miguel zona 9',
        ocupacionPaciente='Cantante', 
        sexo='Femenino'
			where codigoPaciente=3;
            
update Pacientes
	set DPI='1000003120697', 
		apellidosPaciente='Rojas Ochoa',
        nombresPaciente='Darian Melizza', 
        fechaNacimiento='1989-07-09', 
        edad=0, 
        direccionPaciente='30-31 Calle.27 Colonia Los Angeles zona 11',
        ocupacionPaciente='Arquitecta', 
        sexo='Femenino'
			where codigoPaciente=4;
            
update Pacientes
	set DPI='7898564871305', 
		apellidosPaciente='Suarez Aranjo',
        nombresPaciente='Antonella Giorgina', 
        fechaNacimiento='1971-01-30', 
        edad=0, 
        direccionPaciente='45-87 Calle.30 Colonia Las Margaritas zona 12',
        ocupacionPaciente='Veterinaria', 
        sexo='Femenino'
			where codigoPaciente=5;
            
        
        
/*-Update para la tabla ContactoUrgencia-*/
update ContactoUrgencia
	set nombresUrgencia='Carlos Fernando', 
		apellidosUrgencia='Garganta Navas', 
        numeroContactoUr='10241978', 
        codigoPaciente=1
			where codigoContactoUrgencia=1;
            
update ContactoUrgencia
	set nombresUrgencia='Gregorio Higinio', 
		apellidosUrgencia='Miranda Juarez', 
        numeroContactoUr='34095523', 
        codigoPaciente=2
			where codigoContactoUrgencia=2;
            
update ContactoUrgencia
	set nombresUrgencia='Edison Noel', 
		apellidosUrgencia='Cavani Maria', 
        numeroContactoUr='45678914', 
        codigoPaciente=3
			where codigoContactoUrgencia=3;
            
update ContactoUrgencia
	set nombresUrgencia='Sergio Tito', 
		apellidosUrgencia='Aguero Kun', 
        numeroContactoUr='12345678', 
        codigoPaciente=4
			where codigoContactoUrgencia=4;
            
update ContactoUrgencia
	set nombresUrgencia='Erling Martin', 
		apellidosUrgencia='Haaland Mabappe', 
        numeroContactoUr='98765489', 
        codigoPaciente=5
			where codigoContactoUrgencia=5;
            


/*-------------Creación de DELETE para cada tabla-------------*/


/*-Delete para la tabla TelefonoMedico-*/
delete from TelefonoMedico where codigoTelefonoMedico=1;
delete from TelefonoMedico where codigoTelefonoMedico=2;
delete from TelefonoMedico where codigoTelefonoMedico=3;
delete from TelefonoMedico where codigoTelefonoMedico=4;
delete from TelefonoMedico where codigoTelefonoMedico=5;
    
/*-Delete para la tabla Medicos-*/
delete from Medicos where condigoMedico=1;
delete from Medicos where condigoMedico=2;
delete from Medicos where condigoMedico=3;
delete from Medicos where condigoMedico=4;
delete from Medicos where condigoMedico=5;
    
/*-Delete para la tabla Horarios-*/
delete from Horarios where codigoHorario=1;
delete from Horarios where codigoHorario=2;
delete from Horarios where codigoHorario=3;
delete from Horarios where codigoHorario=4;
delete from Horarios where codigoHorario=5;

/*-Delete para la tabla MedicoEspecialidad-*/
delete from MedicoEspecialidad where codigoMedicoEspecialidad=1;
delete from MedicoEspecialidad where codigoMedicoEspecialidad=2;
delete from MedicoEspecialidad where codigoMedicoEspecialidad=3;
delete from MedicoEspecialidad where codigoMedicoEspecialidad=4;
delete from MedicoEspecialidad where codigoMedicoEspecialidad=5;

/*-Delete para la tabla Especialidades-*/
delete from Especialidades where codigoEspecialidad=1;
delete from Especialidades where codigoEspecialidad=2;
delete from Especialidades where codigoEspecialidad=3;
delete from Especialidades where codigoEspecialidad=4;
delete from Especialidades where codigoEspecialidad=5;

/*-Delete para la tabla ResponsableTurno-*/
delete from ResponsableTurno where codigoResponsableTurno=1;
delete from ResponsableTurno where codigoResponsableTurno=2;
delete from ResponsableTurno where codigoResponsableTurno=3;
delete from ResponsableTurno where codigoResponsableTurno=4;
delete from ResponsableTurno where codigoResponsableTurno=5;

/*-Delete para la tabla Turno-*/
delete from Turno where codigoTurno=1;
delete from Turno where codigoTurno=2;
delete from Turno where codigoTurno=3;
delete from Turno where codigoTurno=4;
delete from Turno where codigoTurno=5;


/*-Delete para la tabla Areas-*/
delete from Areas where codigoArea=1;
delete from Areas where codigoArea=2;
delete from Areas where codigoArea=3;
delete from Areas where codigoArea=4;
delete from Areas where codigoArea=5;

/*-Delete para la tabla Cargos-*/
delete from Cargos where codigoCargo=1;
delete from Cargos where codigoCargo=2;
delete from Cargos where codigoCargo=3;
delete from Cargos where codigoCargo=4;
delete from Cargos where codigoCargo=5;

/*-Delete para la tabla Pacientes-*/
delete from Pacientes where codigoPaciente=1;
delete from Pacientes where codigoPaciente=2;
delete from Pacientes where codigoPaciente=3;
delete from Pacientes where codigoPaciente=4;
delete from Pacientes where codigoPaciente=5;

/*-Delete para la tabla ContactoUrgencia-*/
delete from ContactoUrgencia where codigoContactoUrgencia=1;
delete from ContactoUrgencia where codigoContactoUrgencia=2;
delete from ContactoUrgencia where codigoContactoUrgencia=3;
delete from ContactoUrgencia where codigoContactoUrgencia=4;
delete from ContactoUrgencia where codigoContactoUrgencia=5;



/*-------------Creación de DROP para cada tabla-------------*/


/*-Drop para la tabla TelefonoMedico-*/
drop table TelefonoMedico;

/*-Drop para la tabla Turno-*/
drop table Turno;

/*-Drop para la tabla ResponsableTurno-*/
drop table ResponsableTurno;

/*-Drop para la tabla MedicoEspecialidad-*/
drop table MedicoEspecialidad;

/*-Drop para la tabla MedicoEspecialidad-*/
drop table MedicoEspecialidad;

/*-Drop para la tabla ContactoUrgencia-*/
drop table ContactoUrgencia;

/*-Drop para la tabla Medicos-*/
drop table Medicos;

/*-Drop para la tabla Horarios-*/
drop table Horarios;

/*-Drop para la tabla Especialidades-*/
drop table Especialidades;

/*-Drop para la tabla Areas-*/
drop table Areas;

/*-Drop para la tabla Cargos-*/
drop table Cargos;

/*-Drop para la tabla Pacientes-*/
drop table Pacientes;