import 'package:drift/drift.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';

class Arrendatarios extends Table {
  TextColumn get identidad => text()();
  TextColumn get nombre => text().withLength(min: 1, max: 100)();
}

class ActualArrendatarios extends Table {
  TextColumn get idArrendatario => text().references(Arrendatarios, #identidad)();
  TextColumn get cVivienda => text().references(ViviendaUbicacion, #codigoVivienda)();
  DateTimeColumn get fechaEntrada => dateTime()();
  RealColumn get precioRenta => real()();
  TextColumn get obs => text().withLength(min: 0, max: 255).nullable()();

  @override
  Set<Column> get primaryKey => {idArrendatario, cVivienda};
}

class HistorialArrendatarios extends Table {
  TextColumn get cVivienda => text().withLength(min: 1, max: 10)();
  TextColumn get idArrendatario => text().references(Arrendatarios, #identidad)();
  DateTimeColumn get fechaEntrada => dateTime()();
  DateTimeColumn get fechaSalida => dateTime()();
  RealColumn get precioRenta => real()();
  RealColumn get deudaPendiente => real()();
  RealColumn get danoPropiedad => real()();
  TextColumn get obs => text().withLength(min: 0, max: 255).nullable()();
}

class ViviendaUbicacion extends Table {
  TextColumn get codigoVivienda => text().withLength(min: 1, max: 10)();
  TextColumn get ubicacion => text().withLength(min: 1, max: 255)();

  @override
  Set<Column> get primaryKey => {codigoVivienda};
}

class PagosPendientes extends Table {
  DateTimeColumn get periodoDeuda => dateTime()();
  RealColumn get mora => real()();
}

class EstadoCuentas extends Table {
  IntColumn get estadoId => integer().autoIncrement()();
  TextColumn get idArrendatario => text().references(ActualArrendatarios, #idArrendatario)();
  RealColumn get pagoRenta => real()();
  RealColumn get moraRenta => real()();
  RealColumn get deudaElectricidad => real()();
  RealColumn get deudaAgua => real()();
  DateTimeColumn get fechaPago => dateTime()();
}

class DanosPropiedad extends Table {
  RealColumn get totalReparaciones => real()();
  RealColumn get montoFinal => real()();
  TextColumn get descripcion => text().withLength(min: 1, max: 255)();
  TextColumn get cVivienda => text().references(ViviendaUbicacion, #codigoVivienda)();
  TextColumn get idArrendatario => text().references(Arrendatarios, #identidad)();
  DateTimeColumn get fSalida => dateTime()();
}

class CuentaProveedoresServicios extends Table {
  TextColumn get proveedorID => text().withLength(min: 1, max: 10)();
  TextColumn get proveedor => text().withLength(min: 1, max: 255)();
  TextColumn get servicio => text().withLength(min: 1, max: 255)();
  RealColumn get montoTotal => real()();
}

class ProveedoresServicios extends Table {
  TextColumn get codigoProveedor => text().withLength(min: 1, max: 10)();
  TextColumn get proveedorNombre => text().withLength(min: 1, max: 255)();
  TextColumn get servicio => text().withLength(min: 1, max: 255)();
  // RealColumn get montoTotal => real()();
}
class CuentasPSDesocupados extends Table {
  TextColumn get cVivienda => text().references(ViviendaUbicacion, #codigoVivienda)();
  TextColumn get cProveedorEnergia => text().references(ProveedoresServicios, #codigoProveedor)();
  RealColumn get montoEnergia => real()();
  TextColumn get cProveedorAgua => text().references(ProveedoresServicios, #codigoProveedor)();
  RealColumn get montoAgua => real()();

  @override
  Set<Column> get primaryKey => {cVivienda};
}

class FacturaDanos extends Table {
  IntColumn get facturaId => integer().autoIncrement()();
  TextColumn get cVivienda => text().references(ViviendaUbicacion, #codigoVivienda)();
  TextColumn get idArrendatario => text().references(Arrendatarios, #identidad)();
  TextColumn get motivoFactura => text().withLength(min: 1, max: 255)();
  RealColumn get montoDano => real()();
  TextColumn get desc => text().withLength(min: 1, max: 255)();
}

