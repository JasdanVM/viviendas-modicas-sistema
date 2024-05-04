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
}

class HistorialArrendatarios extends Table {
  TextColumn get cVivienda => text().withLength(min: 1, max: 10)();
  TextColumn get idArrendatario => text().references(Arrendatarios, #identidad)();
  DateTimeColumn get fEntrada => dateTime().references(ActualArrendatarios,#fechaEntrada)();
  DateTimeColumn get fechaSalida => dateTime()();
  RealColumn get pRenta => real().references(ActualArrendatarios, #precioRenta)();
  RealColumn get deudaPendiente => real()();
  RealColumn get danoPropiedad => real()();
  TextColumn get observaciones => text().withLength(min: 0, max: 255).nullable()();
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

class EstadoCuenta extends Table {
  RealColumn get pagoRenta => real()();
  RealColumn get deudaRenta => real()();
  RealColumn get pagoElectricidad => real()();
  RealColumn get deudaElectricidad => real()();
  RealColumn get pagoAgua => real()();
  RealColumn get deudaAgua => real()();
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
  TextColumn get cProveedorAgua => text().references(ProveedoresServicios, #codigoProveedor)();
  RealColumn get montoAgua => real()();
  TextColumn get cProveedorEnergia => text().references(ProveedoresServicios, #codigoProveedor)();
  RealColumn get montoEnergia => real()();
}

// class FacturaDano extends Table {
//   TextColumn get idArrendatario => text().references(Arrendatarios, #identidad)();
//   TextColumn get cVivienda =>
//       text().references(ViviendaUbicacion, #codigoVivienda)();
//   TextColumn get motivoFactura => text().withLength(min: 1, max: 255)();
//   RealColumn get montoDano => real()();
//   TextColumn get descripcion => text().withLength(min: 1, max: 255)();
// }