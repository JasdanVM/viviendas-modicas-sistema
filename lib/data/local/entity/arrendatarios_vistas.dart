import 'package:drift/drift.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';// Replace with your actual path

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

