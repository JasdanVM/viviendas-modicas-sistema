import 'package:drift/drift.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';

abstract class vArrendatariosActuales extends View{
  Arrendatarios get arrendatarios;
  ActualArrendatarios get actualarrendatarios;

  Expression<String> get data =>
    arrendatarios.nombre + const Constant(' - ') + actualarrendatarios.cVivienda;

  @override
  Query as() => select([
    arrendatarios.identidad, arrendatarios.nombre, actualarrendatarios.cVivienda, actualarrendatarios.fechaEntrada, actualarrendatarios.precioRenta, actualarrendatarios.obs
  ]).from(arrendatarios).join([innerJoin(actualarrendatarios, actualarrendatarios.idArrendatario.equalsExp(arrendatarios.identidad))]);

  static get() {}
}

abstract class vArrendatariosHistorial extends View{
  Arrendatarios get arrendatarios;
  HistorialArrendatarios get historialarrendatarios;

  // Expression<String> get data =>
  //   arrendatarios.nombre + const Constant(' - ') + historialarrendatarios.cVivienda;

  @override
  Query as() => select([
    arrendatarios.identidad, arrendatarios.nombre, historialarrendatarios.cVivienda, historialarrendatarios.fechaEntrada, historialarrendatarios.fechaSalida, historialarrendatarios.precioRenta, historialarrendatarios.obs
  ]).from(arrendatarios).join([innerJoin(historialarrendatarios, historialarrendatarios.idArrendatario.equalsExp(arrendatarios.identidad))]);

  static get() {}
}

abstract class vViviendaDetalle extends View{
  ViviendaUbicacion get viviendaubicacion;
  Arrendatarios get arrendatarios;
  ActualArrendatarios get actualarrendatarios;

  @override
  Query as() => select([
    viviendaubicacion.codigoVivienda, viviendaubicacion.ubicacion, arrendatarios.identidad, arrendatarios.nombre,
  ]).from(viviendaubicacion).join([innerJoin(actualarrendatarios, actualarrendatarios.cVivienda.equalsExp(viviendaubicacion.codigoVivienda))])
  .join([innerJoin(arrendatarios, arrendatarios.identidad.equalsExp(actualarrendatarios.idArrendatario))]);

  static get() {}
}

abstract class vViviendasConArrendatarios extends View {
  ViviendaUbicacion get viviendaubicacion;
  ActualArrendatarios get actualarrendatarios;

  @override
  Query as() => select([actualarrendatarios.cVivienda, viviendaubicacion.ubicacion])
    .from(actualarrendatarios).join([innerJoin(viviendaubicacion, viviendaubicacion.codigoVivienda.equalsExp(actualarrendatarios.cVivienda))]);

    static get() {}
}

abstract class vFacturaDanoConArrendatarios extends View {
  FacturaDanos get facturadanos;
  Arrendatarios get arrendatarios;

  @override
  Query as() => select([facturadanos.cVivienda, arrendatarios.identidad, arrendatarios.nombre, facturadanos.motivoFactura, facturadanos.montoDano, facturadanos.desc])
    .from(arrendatarios).join([innerJoin(facturadanos, facturadanos.idArrendatario.equalsExp(arrendatarios.identidad))]);

    static get() {}
}
// abstract class vViviendasSinArrendatarios extends View {
//   ViviendaUbicacion get viviendaubicacion;
//   ActualArrendatarios get actualarrendatarios;

//   @override
//   Query as() => select(viviendaubicacion)
//     ..where((tbl) => tbl.codigoVivienda.isNotInQuery(
//       select([actualarrendatarios.cVivienda]).from(actualarrendatarios)
//     ));

//     static get() {}
// }

abstract class vEstadoCuentaConArrendatarios extends View {
  EstadoCuentas get estadocuentas;
  Arrendatarios get arrendatarios;

  @override
  Query as() => select([estadocuentas.estadoId, arrendatarios.identidad, arrendatarios.nombre, estadocuentas.pagoRenta, estadocuentas.moraRenta, estadocuentas.deudaElectricidad, estadocuentas.deudaAgua, estadocuentas.fechaPago])
    .from(estadocuentas).join([innerJoin(arrendatarios, arrendatarios.identidad.equalsExp(estadocuentas.idArrendatario))]);

    static get() {}
}