import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'arrendatarios.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    Arrendatarios,
    ActualArrendatarios,
    HistorialArrendatarios,
    ViviendaUbicacion,
    PagosPendientes,
    EstadoCuenta,
    DanosPropiedad,
    CuentaProveedoresServicios,
    CuentasPSDesocupados
  ],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Arrendatario>> getArrendatarios() async {
    return await select(arrendatarios).get();
  }

  Future<Arrendatario> getArrendatario(String nombre) async {
    return await (select(arrendatarios)
          ..where((tbl) => tbl.nombre.equals(nombre)))
        .getSingle();
  }

  Future<bool> updateArrendatario(ArrendatariosCompanion entity) async {
    return await update(arrendatarios).replace(entity);
  }

  Future<int> insertArrendatario(ArrendatariosCompanion entity) async {
    return await into(arrendatarios).insert(entity);
  }

  Future<int> deleteArrendatario(String nombre) async {
    return await (delete(arrendatarios)
          ..where((tbl) => tbl.nombre.equals(nombre)))
        .go();
  }

  //Actual arrendatarios
  Future<List<ActualArrendatario>> getActualArrendatarios() async {
    return await select(actualArrendatarios).get();
  }

  Future<ActualArrendatario> getActualArrendatario(
      String idArrendatario) async {
    return await (select(actualArrendatarios)
          ..where((tbl) => tbl.idArrendatario.equals(idArrendatario)))
        .getSingle();
  }

  Future<bool> updateActualArrendatario(
      ActualArrendatariosCompanion entity) async {
    return await update(actualArrendatarios).replace(entity);
  }

  Future<int> insertActualArrendatario(
      ActualArrendatariosCompanion entity) async {
    return await into(actualArrendatarios).insert(entity);
  }

  Future<int> deleteActualArrendatario(String idArrendatario) async {
    return await (delete(actualArrendatarios)
          ..where((tbl) => tbl.idArrendatario.equals(idArrendatario)))
        .go();
  }

  // Future<List<Map<String, dynamic>>> getJoinedArrendatarios() async {
  //   final query = select(arrendatarios).join([
  //     innerJoin(actualArrendatarios, actualArrendatarios.codVivienda.equalsExp(arrendatarios.identidad)),
  //   ]);

  //   final results = await query.get();

  //   return results.map((row) {
  //     return {
  //       'identidad': row.readTable(arrendatarios).identidad,
  //       'nombre': row.readTable(arrendatarios).nombre,
  //       'codVivienda': row.readTable(actualArrendatarios).codVivienda,
  //       'fechaEntrada': row.readTable(actualArrendatarios).fechaEntrada,
  //       'precioRenta': row.readTable(actualArrendatarios).precioRenta,
  //       'obs': row.readTable(actualArrendatarios).obs,
  //     };
  //   }).toList();
  // }

  Future<void> fillViviendaUbicacion() async {
    final existingCodigos = (select(viviendaUbicacion)
          ..addColumns([viviendaUbicacion.codigoVivienda]))
        .get();
    final missingCodigos = [
      "LLG-A01",
      "LLG-A02",
      "LLG-A03",
      "LLG-A04",
      "LLG-A05",
      "LLG-A06",
      "LLG-A07",
      "LLG-A08",
      "LLG-A09",
      "LLG-A10",
      "EPV-A01",
      "EPV-A02",
      "EPV-A03",
      "EPV-A04",
      "EPV-A05",
      "EPV-C01",
      "EPV-C02",
      "23A-C01",
    ];

    final missingRows = await (select(viviendaUbicacion)
          ..addColumns([viviendaUbicacion.codigoVivienda]))
        .get()
        .then((existingCodigos) => missingCodigos.where((codigo) =>
            !existingCodigos
                .map((row) => row.codigoVivienda)
                .contains(codigo)));

    for (final codigo in missingRows) {
      String ubicacion;
      switch (codigo.substring(0, 3)) {
        case "LLG":
          ubicacion = "La Laguna";
          break;
        case "EPV":
          ubicacion = "El Porvenir";
          break;
        case "23A":
          ubicacion = "La 23 de Abril";
          break;
        default:
          ubicacion = "";
      }

      final newRow = ViviendaUbicacionCompanion(
        codigoVivienda: Value(codigo),
        ubicacion: Value(ubicacion),
      );

      try {
        await into(viviendaUbicacion).insert(newRow);
      } catch (e) {
        if (e is Exception &&
            e.toString().contains("UNIQUE constraint failed")) {
          await update(viviendaUbicacion).replace(
            ViviendaUbicacionCompanion(
              codigoVivienda: Value(codigo),
              ubicacion: Value(ubicacion),
            ),
          );
        }
      }
    }
  }

  @override
  Future<void> onCreate(DatabaseConnection db, int version) async {
    await fillViviendaUbicacion();
  }
}
