import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_vistas.dart';
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
    EstadoCuentas,
    DanosPropiedad,
    ProveedoresServicios,
    CuentaProveedoresServicios,
    CuentasPSDesocupados,
    FacturaDanos
  ],
  views: [
    vArrendatariosActuales,
    vArrendatariosHistorial,
    vViviendaDetalle,
    vViviendasConArrendatarios,
    vFacturaDanoConArrendatarios,
    vEstadoCuentaConArrendatarios
  ]
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
    // you can keep your onCreate and onUpgrade callbacks
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = OFF;');
      }
    );
  }

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

  Future<String> getArrendatarioName(String identidad) async {
  final arrendatario = await (select(arrendatarios)
      ..where((tbl) => tbl.identidad.equals(identidad)))
    .getSingle();
  return arrendatario.nombre;
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

  // Future<bool> estaOcupadaVivienda(String cVivienda) async {
  //   try {
  //     final query = select(actualArrendatarios)
  //     ..where((tbl) => tbl.cVivienda.equals(cVivienda));
  //     final result = await query.getSingleOrNull();
  //     return result!= null;
  //   } catch (e) {
  //     print('Error: $e'); 
  //     return false;
  //   }
  // }

  // Future<int> verificarViviendaOcupacion(String codigoVivienda) async {
  //   final count = await (select(count())
  //   ..from(actualArrendatarios)
  //   ..where((t) => t.cVivienda.equals(codigoVivienda)))
  //   .getSingle();

  //   return count;
  // }

  //   Future<int> verificarViviendaOcupacion(String codigoVivienda) async {
  //   final count = actualArrendatarios.cVivienda.count();
  //   final query = select(count).from(actualArrendatarios)
  //    ..where(actualArrendatarios.cVivienda.equals(codigoVivienda));

  //   return (await query.getSingle())![0] as int;
  // }

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
  Future<int> verificarArrendatarioExistencia(String identidad) async {
    final existe = await (select(arrendatarios)
        ..where((tbl) => tbl.identidad.equals(identidad)))
      .get()
      .then((rows) => rows.length);
    return existe;
  }

  Future<int> verificarActualArrendatarioExistencia(String identidad) async {
    final existe = await (select(actualArrendatarios)
        ..where((tbl) => tbl.idArrendatario.equals(identidad)))
      .get()
      .then((rows) => rows.length);
    return existe;
  }

  Future<List<EstadoCuenta>> getEstadoCuentas() async {
    return await select(estadoCuentas).get();
  }

  Future<EstadoCuenta> getEstadoCuenta(
      String idArrendatario) async {
    return await (select(estadoCuentas)
          ..where((tbl) => tbl.idArrendatario.equals(idArrendatario)))
        .getSingle();
  }

  Future<bool> updateEstadoCuenta(EstadoCuentasCompanion entity) async {
    return await update(estadoCuentas).replace(entity);
  }

  Future<int> insertEstadoCuenta(EstadoCuentasCompanion entity) async {
    return await into(estadoCuentas).insert(entity);
  }

  Future<int> deleteEstadoCuenta(String idArrendatario) async {
    return await (delete(estadoCuentas)
      ..where((tbl) => tbl.idArrendatario.equals(idArrendatario)))
    .go();
  }

  Future<List<ViviendaUbicacionData>> getViviendaUbicacion() async {
    return await select(viviendaUbicacion).get();
  }

  Future<List<String>> getCodigoDeViviendaOptions() async {
    final viviendaUbicaciones = await select(viviendaUbicacion).get();
    return viviendaUbicaciones.map((e) => e.codigoVivienda).toList();
  }

  Future<int> verificarViviendaOcupacion(String codigoVivienda) async {
    final existe = await (select(actualArrendatarios)
        ..where((tbl) => tbl.cVivienda.equals(codigoVivienda)))
      .get()
      .then((rows) => rows.length);
    return existe;
  }

  Future<int> countViviendaUbicaciones() async {
    final count = viviendaUbicacion.codigoVivienda.count();
    final query = selectOnly(viviendaUbicacion)..addColumns([count]);
    final result = await query.getSingle();
    return result.read(count)!;
  }

  Future<List<ViviendaUbicacionData>> fViviendasSinArrendatario() async {
    final viviendasOcupadas = selectOnly(actualArrendatarios)
      ..addColumns([actualArrendatarios.cVivienda]);

    final query = select(viviendaUbicacion).join(
        [innerJoin(actualArrendatarios, viviendaUbicacion.codigoVivienda.isNotInQuery(viviendasOcupadas))]);

    return query
        .map((row) => (row.readTable(viviendaUbicacion)))
        .get();
  }

  // Future<List<(ViviendaUbicacionData, ActualArrendatario)>> fViviendasSinArrendatario() async {
  //   // final phoneNumbersForContact =
  //   //     contacts.data.jsonEach(this, r'$.phoneNumbers');
  //   final viviendasOcupadas = selectOnly(actualArrendatarios)
  //     ..addColumns([actualArrendatarios.cVivienda]);

  //   final query = select(viviendaUbicacion).join(
  //       [innerJoin(actualArrendatarios, viviendaUbicacion.codigoVivienda.isNotInQuery(viviendasOcupadas))]);

  //   return query
  //       .map((row) => (row.readTable(viviendaUbicacion), row.readTable(actualArrendatarios)))
  //       .get();
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

  Future<int> insertFacturaDano(
      FacturaDanosCompanion entity) async {
    return await into(facturaDanos).insert(entity);
  }

  Future<int> deleteFacturaDano(int facturaId) async {
    return await (delete(facturaDanos)
      ..where((tbl) => tbl.facturaId.equals(facturaId)))
    .go();
  }

  @override
  Future<void> onCreate(DatabaseConnection db, int version) async {
    await fillViviendaUbicacion();
  }
}
