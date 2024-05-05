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
  Arrendatarios get arrendatarios;
  ActualArrendatarios get actualarrendatarios;

  @override
  Query as() => select([
    arrendatarios.identidad, arrendatarios.nombre, actualarrendatarios.cVivienda, actualarrendatarios.fechaEntrada, actualarrendatarios.precioRenta, actualarrendatarios.obs
  ]).from(arrendatarios).join([innerJoin(actualarrendatarios, actualarrendatarios.idArrendatario.equalsExp(arrendatarios.identidad))]);

  static get() {}
}

