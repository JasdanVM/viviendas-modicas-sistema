// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $ArrendatariosTable extends Arrendatarios
    with TableInfo<$ArrendatariosTable, Arrendatario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArrendatariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _identidadMeta =
      const VerificationMeta('identidad');
  @override
  late final GeneratedColumn<String> identidad = GeneratedColumn<String>(
      'identidad', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [identidad, nombre];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'arrendatarios';
  @override
  VerificationContext validateIntegrity(Insertable<Arrendatario> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('identidad')) {
      context.handle(_identidadMeta,
          identidad.isAcceptableOrUnknown(data['identidad']!, _identidadMeta));
    } else if (isInserting) {
      context.missing(_identidadMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Arrendatario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Arrendatario(
      identidad: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identidad'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
    );
  }

  @override
  $ArrendatariosTable createAlias(String alias) {
    return $ArrendatariosTable(attachedDatabase, alias);
  }
}

class Arrendatario extends DataClass implements Insertable<Arrendatario> {
  final String identidad;
  final String nombre;
  const Arrendatario({required this.identidad, required this.nombre});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['identidad'] = Variable<String>(identidad);
    map['nombre'] = Variable<String>(nombre);
    return map;
  }

  ArrendatariosCompanion toCompanion(bool nullToAbsent) {
    return ArrendatariosCompanion(
      identidad: Value(identidad),
      nombre: Value(nombre),
    );
  }

  factory Arrendatario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Arrendatario(
      identidad: serializer.fromJson<String>(json['identidad']),
      nombre: serializer.fromJson<String>(json['nombre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'identidad': serializer.toJson<String>(identidad),
      'nombre': serializer.toJson<String>(nombre),
    };
  }

  Arrendatario copyWith({String? identidad, String? nombre}) => Arrendatario(
        identidad: identidad ?? this.identidad,
        nombre: nombre ?? this.nombre,
      );
  @override
  String toString() {
    return (StringBuffer('Arrendatario(')
          ..write('identidad: $identidad, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(identidad, nombre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Arrendatario &&
          other.identidad == this.identidad &&
          other.nombre == this.nombre);
}

class ArrendatariosCompanion extends UpdateCompanion<Arrendatario> {
  final Value<String> identidad;
  final Value<String> nombre;
  final Value<int> rowid;
  const ArrendatariosCompanion({
    this.identidad = const Value.absent(),
    this.nombre = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArrendatariosCompanion.insert({
    required String identidad,
    required String nombre,
    this.rowid = const Value.absent(),
  })  : identidad = Value(identidad),
        nombre = Value(nombre);
  static Insertable<Arrendatario> custom({
    Expression<String>? identidad,
    Expression<String>? nombre,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (identidad != null) 'identidad': identidad,
      if (nombre != null) 'nombre': nombre,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArrendatariosCompanion copyWith(
      {Value<String>? identidad, Value<String>? nombre, Value<int>? rowid}) {
    return ArrendatariosCompanion(
      identidad: identidad ?? this.identidad,
      nombre: nombre ?? this.nombre,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (identidad.present) {
      map['identidad'] = Variable<String>(identidad.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArrendatariosCompanion(')
          ..write('identidad: $identidad, ')
          ..write('nombre: $nombre, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ViviendaUbicacionTable extends ViviendaUbicacion
    with TableInfo<$ViviendaUbicacionTable, ViviendaUbicacionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ViviendaUbicacionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoViviendaMeta =
      const VerificationMeta('codigoVivienda');
  @override
  late final GeneratedColumn<String> codigoVivienda = GeneratedColumn<String>(
      'codigo_vivienda', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ubicacionMeta =
      const VerificationMeta('ubicacion');
  @override
  late final GeneratedColumn<String> ubicacion = GeneratedColumn<String>(
      'ubicacion', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [codigoVivienda, ubicacion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vivienda_ubicacion';
  @override
  VerificationContext validateIntegrity(
      Insertable<ViviendaUbicacionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo_vivienda')) {
      context.handle(
          _codigoViviendaMeta,
          codigoVivienda.isAcceptableOrUnknown(
              data['codigo_vivienda']!, _codigoViviendaMeta));
    } else if (isInserting) {
      context.missing(_codigoViviendaMeta);
    }
    if (data.containsKey('ubicacion')) {
      context.handle(_ubicacionMeta,
          ubicacion.isAcceptableOrUnknown(data['ubicacion']!, _ubicacionMeta));
    } else if (isInserting) {
      context.missing(_ubicacionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigoVivienda};
  @override
  ViviendaUbicacionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ViviendaUbicacionData(
      codigoVivienda: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}codigo_vivienda'])!,
      ubicacion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ubicacion'])!,
    );
  }

  @override
  $ViviendaUbicacionTable createAlias(String alias) {
    return $ViviendaUbicacionTable(attachedDatabase, alias);
  }
}

class ViviendaUbicacionData extends DataClass
    implements Insertable<ViviendaUbicacionData> {
  final String codigoVivienda;
  final String ubicacion;
  const ViviendaUbicacionData(
      {required this.codigoVivienda, required this.ubicacion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['codigo_vivienda'] = Variable<String>(codigoVivienda);
    map['ubicacion'] = Variable<String>(ubicacion);
    return map;
  }

  ViviendaUbicacionCompanion toCompanion(bool nullToAbsent) {
    return ViviendaUbicacionCompanion(
      codigoVivienda: Value(codigoVivienda),
      ubicacion: Value(ubicacion),
    );
  }

  factory ViviendaUbicacionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ViviendaUbicacionData(
      codigoVivienda: serializer.fromJson<String>(json['codigoVivienda']),
      ubicacion: serializer.fromJson<String>(json['ubicacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codigoVivienda': serializer.toJson<String>(codigoVivienda),
      'ubicacion': serializer.toJson<String>(ubicacion),
    };
  }

  ViviendaUbicacionData copyWith({String? codigoVivienda, String? ubicacion}) =>
      ViviendaUbicacionData(
        codigoVivienda: codigoVivienda ?? this.codigoVivienda,
        ubicacion: ubicacion ?? this.ubicacion,
      );
  @override
  String toString() {
    return (StringBuffer('ViviendaUbicacionData(')
          ..write('codigoVivienda: $codigoVivienda, ')
          ..write('ubicacion: $ubicacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codigoVivienda, ubicacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ViviendaUbicacionData &&
          other.codigoVivienda == this.codigoVivienda &&
          other.ubicacion == this.ubicacion);
}

class ViviendaUbicacionCompanion
    extends UpdateCompanion<ViviendaUbicacionData> {
  final Value<String> codigoVivienda;
  final Value<String> ubicacion;
  final Value<int> rowid;
  const ViviendaUbicacionCompanion({
    this.codigoVivienda = const Value.absent(),
    this.ubicacion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ViviendaUbicacionCompanion.insert({
    required String codigoVivienda,
    required String ubicacion,
    this.rowid = const Value.absent(),
  })  : codigoVivienda = Value(codigoVivienda),
        ubicacion = Value(ubicacion);
  static Insertable<ViviendaUbicacionData> custom({
    Expression<String>? codigoVivienda,
    Expression<String>? ubicacion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (codigoVivienda != null) 'codigo_vivienda': codigoVivienda,
      if (ubicacion != null) 'ubicacion': ubicacion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ViviendaUbicacionCompanion copyWith(
      {Value<String>? codigoVivienda,
      Value<String>? ubicacion,
      Value<int>? rowid}) {
    return ViviendaUbicacionCompanion(
      codigoVivienda: codigoVivienda ?? this.codigoVivienda,
      ubicacion: ubicacion ?? this.ubicacion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigoVivienda.present) {
      map['codigo_vivienda'] = Variable<String>(codigoVivienda.value);
    }
    if (ubicacion.present) {
      map['ubicacion'] = Variable<String>(ubicacion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ViviendaUbicacionCompanion(')
          ..write('codigoVivienda: $codigoVivienda, ')
          ..write('ubicacion: $ubicacion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActualArrendatariosTable extends ActualArrendatarios
    with TableInfo<$ActualArrendatariosTable, ActualArrendatario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActualArrendatariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idArrendatarioMeta =
      const VerificationMeta('idArrendatario');
  @override
  late final GeneratedColumn<String> idArrendatario = GeneratedColumn<String>(
      'id_arrendatario', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES arrendatarios (identidad)'));
  static const VerificationMeta _cViviendaMeta =
      const VerificationMeta('cVivienda');
  @override
  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES vivienda_ubicacion (codigo_vivienda)'));
  static const VerificationMeta _fechaEntradaMeta =
      const VerificationMeta('fechaEntrada');
  @override
  late final GeneratedColumn<DateTime> fechaEntrada = GeneratedColumn<DateTime>(
      'fecha_entrada', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _precioRentaMeta =
      const VerificationMeta('precioRenta');
  @override
  late final GeneratedColumn<double> precioRenta = GeneratedColumn<double>(
      'precio_renta', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _obsMeta = const VerificationMeta('obs');
  @override
  late final GeneratedColumn<String> obs = GeneratedColumn<String>(
      'obs', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [idArrendatario, cVivienda, fechaEntrada, precioRenta, obs];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'actual_arrendatarios';
  @override
  VerificationContext validateIntegrity(Insertable<ActualArrendatario> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_arrendatario')) {
      context.handle(
          _idArrendatarioMeta,
          idArrendatario.isAcceptableOrUnknown(
              data['id_arrendatario']!, _idArrendatarioMeta));
    } else if (isInserting) {
      context.missing(_idArrendatarioMeta);
    }
    if (data.containsKey('c_vivienda')) {
      context.handle(_cViviendaMeta,
          cVivienda.isAcceptableOrUnknown(data['c_vivienda']!, _cViviendaMeta));
    } else if (isInserting) {
      context.missing(_cViviendaMeta);
    }
    if (data.containsKey('fecha_entrada')) {
      context.handle(
          _fechaEntradaMeta,
          fechaEntrada.isAcceptableOrUnknown(
              data['fecha_entrada']!, _fechaEntradaMeta));
    } else if (isInserting) {
      context.missing(_fechaEntradaMeta);
    }
    if (data.containsKey('precio_renta')) {
      context.handle(
          _precioRentaMeta,
          precioRenta.isAcceptableOrUnknown(
              data['precio_renta']!, _precioRentaMeta));
    } else if (isInserting) {
      context.missing(_precioRentaMeta);
    }
    if (data.containsKey('obs')) {
      context.handle(
          _obsMeta, obs.isAcceptableOrUnknown(data['obs']!, _obsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idArrendatario, cVivienda};
  @override
  ActualArrendatario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActualArrendatario(
      idArrendatario: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}id_arrendatario'])!,
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
      fechaEntrada: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_entrada'])!,
      precioRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}precio_renta'])!,
      obs: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}obs']),
    );
  }

  @override
  $ActualArrendatariosTable createAlias(String alias) {
    return $ActualArrendatariosTable(attachedDatabase, alias);
  }
}

class ActualArrendatario extends DataClass
    implements Insertable<ActualArrendatario> {
  final String idArrendatario;
  final String cVivienda;
  final DateTime fechaEntrada;
  final double precioRenta;
  final String? obs;
  const ActualArrendatario(
      {required this.idArrendatario,
      required this.cVivienda,
      required this.fechaEntrada,
      required this.precioRenta,
      this.obs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_arrendatario'] = Variable<String>(idArrendatario);
    map['c_vivienda'] = Variable<String>(cVivienda);
    map['fecha_entrada'] = Variable<DateTime>(fechaEntrada);
    map['precio_renta'] = Variable<double>(precioRenta);
    if (!nullToAbsent || obs != null) {
      map['obs'] = Variable<String>(obs);
    }
    return map;
  }

  ActualArrendatariosCompanion toCompanion(bool nullToAbsent) {
    return ActualArrendatariosCompanion(
      idArrendatario: Value(idArrendatario),
      cVivienda: Value(cVivienda),
      fechaEntrada: Value(fechaEntrada),
      precioRenta: Value(precioRenta),
      obs: obs == null && nullToAbsent ? const Value.absent() : Value(obs),
    );
  }

  factory ActualArrendatario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActualArrendatario(
      idArrendatario: serializer.fromJson<String>(json['idArrendatario']),
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
      fechaEntrada: serializer.fromJson<DateTime>(json['fechaEntrada']),
      precioRenta: serializer.fromJson<double>(json['precioRenta']),
      obs: serializer.fromJson<String?>(json['obs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idArrendatario': serializer.toJson<String>(idArrendatario),
      'cVivienda': serializer.toJson<String>(cVivienda),
      'fechaEntrada': serializer.toJson<DateTime>(fechaEntrada),
      'precioRenta': serializer.toJson<double>(precioRenta),
      'obs': serializer.toJson<String?>(obs),
    };
  }

  ActualArrendatario copyWith(
          {String? idArrendatario,
          String? cVivienda,
          DateTime? fechaEntrada,
          double? precioRenta,
          Value<String?> obs = const Value.absent()}) =>
      ActualArrendatario(
        idArrendatario: idArrendatario ?? this.idArrendatario,
        cVivienda: cVivienda ?? this.cVivienda,
        fechaEntrada: fechaEntrada ?? this.fechaEntrada,
        precioRenta: precioRenta ?? this.precioRenta,
        obs: obs.present ? obs.value : this.obs,
      );
  @override
  String toString() {
    return (StringBuffer('ActualArrendatario(')
          ..write('idArrendatario: $idArrendatario, ')
          ..write('cVivienda: $cVivienda, ')
          ..write('fechaEntrada: $fechaEntrada, ')
          ..write('precioRenta: $precioRenta, ')
          ..write('obs: $obs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idArrendatario, cVivienda, fechaEntrada, precioRenta, obs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActualArrendatario &&
          other.idArrendatario == this.idArrendatario &&
          other.cVivienda == this.cVivienda &&
          other.fechaEntrada == this.fechaEntrada &&
          other.precioRenta == this.precioRenta &&
          other.obs == this.obs);
}

class ActualArrendatariosCompanion extends UpdateCompanion<ActualArrendatario> {
  final Value<String> idArrendatario;
  final Value<String> cVivienda;
  final Value<DateTime> fechaEntrada;
  final Value<double> precioRenta;
  final Value<String?> obs;
  final Value<int> rowid;
  const ActualArrendatariosCompanion({
    this.idArrendatario = const Value.absent(),
    this.cVivienda = const Value.absent(),
    this.fechaEntrada = const Value.absent(),
    this.precioRenta = const Value.absent(),
    this.obs = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActualArrendatariosCompanion.insert({
    required String idArrendatario,
    required String cVivienda,
    required DateTime fechaEntrada,
    required double precioRenta,
    this.obs = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : idArrendatario = Value(idArrendatario),
        cVivienda = Value(cVivienda),
        fechaEntrada = Value(fechaEntrada),
        precioRenta = Value(precioRenta);
  static Insertable<ActualArrendatario> custom({
    Expression<String>? idArrendatario,
    Expression<String>? cVivienda,
    Expression<DateTime>? fechaEntrada,
    Expression<double>? precioRenta,
    Expression<String>? obs,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idArrendatario != null) 'id_arrendatario': idArrendatario,
      if (cVivienda != null) 'c_vivienda': cVivienda,
      if (fechaEntrada != null) 'fecha_entrada': fechaEntrada,
      if (precioRenta != null) 'precio_renta': precioRenta,
      if (obs != null) 'obs': obs,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActualArrendatariosCompanion copyWith(
      {Value<String>? idArrendatario,
      Value<String>? cVivienda,
      Value<DateTime>? fechaEntrada,
      Value<double>? precioRenta,
      Value<String?>? obs,
      Value<int>? rowid}) {
    return ActualArrendatariosCompanion(
      idArrendatario: idArrendatario ?? this.idArrendatario,
      cVivienda: cVivienda ?? this.cVivienda,
      fechaEntrada: fechaEntrada ?? this.fechaEntrada,
      precioRenta: precioRenta ?? this.precioRenta,
      obs: obs ?? this.obs,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idArrendatario.present) {
      map['id_arrendatario'] = Variable<String>(idArrendatario.value);
    }
    if (cVivienda.present) {
      map['c_vivienda'] = Variable<String>(cVivienda.value);
    }
    if (fechaEntrada.present) {
      map['fecha_entrada'] = Variable<DateTime>(fechaEntrada.value);
    }
    if (precioRenta.present) {
      map['precio_renta'] = Variable<double>(precioRenta.value);
    }
    if (obs.present) {
      map['obs'] = Variable<String>(obs.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActualArrendatariosCompanion(')
          ..write('idArrendatario: $idArrendatario, ')
          ..write('cVivienda: $cVivienda, ')
          ..write('fechaEntrada: $fechaEntrada, ')
          ..write('precioRenta: $precioRenta, ')
          ..write('obs: $obs, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HistorialArrendatariosTable extends HistorialArrendatarios
    with TableInfo<$HistorialArrendatariosTable, HistorialArrendatario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistorialArrendatariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cViviendaMeta =
      const VerificationMeta('cVivienda');
  @override
  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _idArrendatarioMeta =
      const VerificationMeta('idArrendatario');
  @override
  late final GeneratedColumn<String> idArrendatario = GeneratedColumn<String>(
      'id_arrendatario', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES arrendatarios (identidad)'));
  static const VerificationMeta _fechaEntradaMeta =
      const VerificationMeta('fechaEntrada');
  @override
  late final GeneratedColumn<DateTime> fechaEntrada = GeneratedColumn<DateTime>(
      'fecha_entrada', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _fechaSalidaMeta =
      const VerificationMeta('fechaSalida');
  @override
  late final GeneratedColumn<DateTime> fechaSalida = GeneratedColumn<DateTime>(
      'fecha_salida', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _precioRentaMeta =
      const VerificationMeta('precioRenta');
  @override
  late final GeneratedColumn<double> precioRenta = GeneratedColumn<double>(
      'precio_renta', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _deudaPendienteMeta =
      const VerificationMeta('deudaPendiente');
  @override
  late final GeneratedColumn<double> deudaPendiente = GeneratedColumn<double>(
      'deuda_pendiente', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _danoPropiedadMeta =
      const VerificationMeta('danoPropiedad');
  @override
  late final GeneratedColumn<double> danoPropiedad = GeneratedColumn<double>(
      'dano_propiedad', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _obsMeta = const VerificationMeta('obs');
  @override
  late final GeneratedColumn<String> obs = GeneratedColumn<String>(
      'obs', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        cVivienda,
        idArrendatario,
        fechaEntrada,
        fechaSalida,
        precioRenta,
        deudaPendiente,
        danoPropiedad,
        obs
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'historial_arrendatarios';
  @override
  VerificationContext validateIntegrity(
      Insertable<HistorialArrendatario> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('c_vivienda')) {
      context.handle(_cViviendaMeta,
          cVivienda.isAcceptableOrUnknown(data['c_vivienda']!, _cViviendaMeta));
    } else if (isInserting) {
      context.missing(_cViviendaMeta);
    }
    if (data.containsKey('id_arrendatario')) {
      context.handle(
          _idArrendatarioMeta,
          idArrendatario.isAcceptableOrUnknown(
              data['id_arrendatario']!, _idArrendatarioMeta));
    } else if (isInserting) {
      context.missing(_idArrendatarioMeta);
    }
    if (data.containsKey('fecha_entrada')) {
      context.handle(
          _fechaEntradaMeta,
          fechaEntrada.isAcceptableOrUnknown(
              data['fecha_entrada']!, _fechaEntradaMeta));
    } else if (isInserting) {
      context.missing(_fechaEntradaMeta);
    }
    if (data.containsKey('fecha_salida')) {
      context.handle(
          _fechaSalidaMeta,
          fechaSalida.isAcceptableOrUnknown(
              data['fecha_salida']!, _fechaSalidaMeta));
    } else if (isInserting) {
      context.missing(_fechaSalidaMeta);
    }
    if (data.containsKey('precio_renta')) {
      context.handle(
          _precioRentaMeta,
          precioRenta.isAcceptableOrUnknown(
              data['precio_renta']!, _precioRentaMeta));
    } else if (isInserting) {
      context.missing(_precioRentaMeta);
    }
    if (data.containsKey('deuda_pendiente')) {
      context.handle(
          _deudaPendienteMeta,
          deudaPendiente.isAcceptableOrUnknown(
              data['deuda_pendiente']!, _deudaPendienteMeta));
    } else if (isInserting) {
      context.missing(_deudaPendienteMeta);
    }
    if (data.containsKey('dano_propiedad')) {
      context.handle(
          _danoPropiedadMeta,
          danoPropiedad.isAcceptableOrUnknown(
              data['dano_propiedad']!, _danoPropiedadMeta));
    } else if (isInserting) {
      context.missing(_danoPropiedadMeta);
    }
    if (data.containsKey('obs')) {
      context.handle(
          _obsMeta, obs.isAcceptableOrUnknown(data['obs']!, _obsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  HistorialArrendatario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistorialArrendatario(
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
      idArrendatario: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}id_arrendatario'])!,
      fechaEntrada: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_entrada'])!,
      fechaSalida: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_salida'])!,
      precioRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}precio_renta'])!,
      deudaPendiente: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}deuda_pendiente'])!,
      danoPropiedad: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dano_propiedad'])!,
      obs: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}obs']),
    );
  }

  @override
  $HistorialArrendatariosTable createAlias(String alias) {
    return $HistorialArrendatariosTable(attachedDatabase, alias);
  }
}

class HistorialArrendatario extends DataClass
    implements Insertable<HistorialArrendatario> {
  final String cVivienda;
  final String idArrendatario;
  final DateTime fechaEntrada;
  final DateTime fechaSalida;
  final double precioRenta;
  final double deudaPendiente;
  final double danoPropiedad;
  final String? obs;
  const HistorialArrendatario(
      {required this.cVivienda,
      required this.idArrendatario,
      required this.fechaEntrada,
      required this.fechaSalida,
      required this.precioRenta,
      required this.deudaPendiente,
      required this.danoPropiedad,
      this.obs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['c_vivienda'] = Variable<String>(cVivienda);
    map['id_arrendatario'] = Variable<String>(idArrendatario);
    map['fecha_entrada'] = Variable<DateTime>(fechaEntrada);
    map['fecha_salida'] = Variable<DateTime>(fechaSalida);
    map['precio_renta'] = Variable<double>(precioRenta);
    map['deuda_pendiente'] = Variable<double>(deudaPendiente);
    map['dano_propiedad'] = Variable<double>(danoPropiedad);
    if (!nullToAbsent || obs != null) {
      map['obs'] = Variable<String>(obs);
    }
    return map;
  }

  HistorialArrendatariosCompanion toCompanion(bool nullToAbsent) {
    return HistorialArrendatariosCompanion(
      cVivienda: Value(cVivienda),
      idArrendatario: Value(idArrendatario),
      fechaEntrada: Value(fechaEntrada),
      fechaSalida: Value(fechaSalida),
      precioRenta: Value(precioRenta),
      deudaPendiente: Value(deudaPendiente),
      danoPropiedad: Value(danoPropiedad),
      obs: obs == null && nullToAbsent ? const Value.absent() : Value(obs),
    );
  }

  factory HistorialArrendatario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistorialArrendatario(
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
      idArrendatario: serializer.fromJson<String>(json['idArrendatario']),
      fechaEntrada: serializer.fromJson<DateTime>(json['fechaEntrada']),
      fechaSalida: serializer.fromJson<DateTime>(json['fechaSalida']),
      precioRenta: serializer.fromJson<double>(json['precioRenta']),
      deudaPendiente: serializer.fromJson<double>(json['deudaPendiente']),
      danoPropiedad: serializer.fromJson<double>(json['danoPropiedad']),
      obs: serializer.fromJson<String?>(json['obs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cVivienda': serializer.toJson<String>(cVivienda),
      'idArrendatario': serializer.toJson<String>(idArrendatario),
      'fechaEntrada': serializer.toJson<DateTime>(fechaEntrada),
      'fechaSalida': serializer.toJson<DateTime>(fechaSalida),
      'precioRenta': serializer.toJson<double>(precioRenta),
      'deudaPendiente': serializer.toJson<double>(deudaPendiente),
      'danoPropiedad': serializer.toJson<double>(danoPropiedad),
      'obs': serializer.toJson<String?>(obs),
    };
  }

  HistorialArrendatario copyWith(
          {String? cVivienda,
          String? idArrendatario,
          DateTime? fechaEntrada,
          DateTime? fechaSalida,
          double? precioRenta,
          double? deudaPendiente,
          double? danoPropiedad,
          Value<String?> obs = const Value.absent()}) =>
      HistorialArrendatario(
        cVivienda: cVivienda ?? this.cVivienda,
        idArrendatario: idArrendatario ?? this.idArrendatario,
        fechaEntrada: fechaEntrada ?? this.fechaEntrada,
        fechaSalida: fechaSalida ?? this.fechaSalida,
        precioRenta: precioRenta ?? this.precioRenta,
        deudaPendiente: deudaPendiente ?? this.deudaPendiente,
        danoPropiedad: danoPropiedad ?? this.danoPropiedad,
        obs: obs.present ? obs.value : this.obs,
      );
  @override
  String toString() {
    return (StringBuffer('HistorialArrendatario(')
          ..write('cVivienda: $cVivienda, ')
          ..write('idArrendatario: $idArrendatario, ')
          ..write('fechaEntrada: $fechaEntrada, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('precioRenta: $precioRenta, ')
          ..write('deudaPendiente: $deudaPendiente, ')
          ..write('danoPropiedad: $danoPropiedad, ')
          ..write('obs: $obs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cVivienda, idArrendatario, fechaEntrada,
      fechaSalida, precioRenta, deudaPendiente, danoPropiedad, obs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistorialArrendatario &&
          other.cVivienda == this.cVivienda &&
          other.idArrendatario == this.idArrendatario &&
          other.fechaEntrada == this.fechaEntrada &&
          other.fechaSalida == this.fechaSalida &&
          other.precioRenta == this.precioRenta &&
          other.deudaPendiente == this.deudaPendiente &&
          other.danoPropiedad == this.danoPropiedad &&
          other.obs == this.obs);
}

class HistorialArrendatariosCompanion
    extends UpdateCompanion<HistorialArrendatario> {
  final Value<String> cVivienda;
  final Value<String> idArrendatario;
  final Value<DateTime> fechaEntrada;
  final Value<DateTime> fechaSalida;
  final Value<double> precioRenta;
  final Value<double> deudaPendiente;
  final Value<double> danoPropiedad;
  final Value<String?> obs;
  final Value<int> rowid;
  const HistorialArrendatariosCompanion({
    this.cVivienda = const Value.absent(),
    this.idArrendatario = const Value.absent(),
    this.fechaEntrada = const Value.absent(),
    this.fechaSalida = const Value.absent(),
    this.precioRenta = const Value.absent(),
    this.deudaPendiente = const Value.absent(),
    this.danoPropiedad = const Value.absent(),
    this.obs = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HistorialArrendatariosCompanion.insert({
    required String cVivienda,
    required String idArrendatario,
    required DateTime fechaEntrada,
    required DateTime fechaSalida,
    required double precioRenta,
    required double deudaPendiente,
    required double danoPropiedad,
    this.obs = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : cVivienda = Value(cVivienda),
        idArrendatario = Value(idArrendatario),
        fechaEntrada = Value(fechaEntrada),
        fechaSalida = Value(fechaSalida),
        precioRenta = Value(precioRenta),
        deudaPendiente = Value(deudaPendiente),
        danoPropiedad = Value(danoPropiedad);
  static Insertable<HistorialArrendatario> custom({
    Expression<String>? cVivienda,
    Expression<String>? idArrendatario,
    Expression<DateTime>? fechaEntrada,
    Expression<DateTime>? fechaSalida,
    Expression<double>? precioRenta,
    Expression<double>? deudaPendiente,
    Expression<double>? danoPropiedad,
    Expression<String>? obs,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cVivienda != null) 'c_vivienda': cVivienda,
      if (idArrendatario != null) 'id_arrendatario': idArrendatario,
      if (fechaEntrada != null) 'fecha_entrada': fechaEntrada,
      if (fechaSalida != null) 'fecha_salida': fechaSalida,
      if (precioRenta != null) 'precio_renta': precioRenta,
      if (deudaPendiente != null) 'deuda_pendiente': deudaPendiente,
      if (danoPropiedad != null) 'dano_propiedad': danoPropiedad,
      if (obs != null) 'obs': obs,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HistorialArrendatariosCompanion copyWith(
      {Value<String>? cVivienda,
      Value<String>? idArrendatario,
      Value<DateTime>? fechaEntrada,
      Value<DateTime>? fechaSalida,
      Value<double>? precioRenta,
      Value<double>? deudaPendiente,
      Value<double>? danoPropiedad,
      Value<String?>? obs,
      Value<int>? rowid}) {
    return HistorialArrendatariosCompanion(
      cVivienda: cVivienda ?? this.cVivienda,
      idArrendatario: idArrendatario ?? this.idArrendatario,
      fechaEntrada: fechaEntrada ?? this.fechaEntrada,
      fechaSalida: fechaSalida ?? this.fechaSalida,
      precioRenta: precioRenta ?? this.precioRenta,
      deudaPendiente: deudaPendiente ?? this.deudaPendiente,
      danoPropiedad: danoPropiedad ?? this.danoPropiedad,
      obs: obs ?? this.obs,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cVivienda.present) {
      map['c_vivienda'] = Variable<String>(cVivienda.value);
    }
    if (idArrendatario.present) {
      map['id_arrendatario'] = Variable<String>(idArrendatario.value);
    }
    if (fechaEntrada.present) {
      map['fecha_entrada'] = Variable<DateTime>(fechaEntrada.value);
    }
    if (fechaSalida.present) {
      map['fecha_salida'] = Variable<DateTime>(fechaSalida.value);
    }
    if (precioRenta.present) {
      map['precio_renta'] = Variable<double>(precioRenta.value);
    }
    if (deudaPendiente.present) {
      map['deuda_pendiente'] = Variable<double>(deudaPendiente.value);
    }
    if (danoPropiedad.present) {
      map['dano_propiedad'] = Variable<double>(danoPropiedad.value);
    }
    if (obs.present) {
      map['obs'] = Variable<String>(obs.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistorialArrendatariosCompanion(')
          ..write('cVivienda: $cVivienda, ')
          ..write('idArrendatario: $idArrendatario, ')
          ..write('fechaEntrada: $fechaEntrada, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('precioRenta: $precioRenta, ')
          ..write('deudaPendiente: $deudaPendiente, ')
          ..write('danoPropiedad: $danoPropiedad, ')
          ..write('obs: $obs, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PagosPendientesTable extends PagosPendientes
    with TableInfo<$PagosPendientesTable, PagosPendiente> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PagosPendientesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _periodoDeudaMeta =
      const VerificationMeta('periodoDeuda');
  @override
  late final GeneratedColumn<DateTime> periodoDeuda = GeneratedColumn<DateTime>(
      'periodo_deuda', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _moraMeta = const VerificationMeta('mora');
  @override
  late final GeneratedColumn<double> mora = GeneratedColumn<double>(
      'mora', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [periodoDeuda, mora];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pagos_pendientes';
  @override
  VerificationContext validateIntegrity(Insertable<PagosPendiente> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('periodo_deuda')) {
      context.handle(
          _periodoDeudaMeta,
          periodoDeuda.isAcceptableOrUnknown(
              data['periodo_deuda']!, _periodoDeudaMeta));
    } else if (isInserting) {
      context.missing(_periodoDeudaMeta);
    }
    if (data.containsKey('mora')) {
      context.handle(
          _moraMeta, mora.isAcceptableOrUnknown(data['mora']!, _moraMeta));
    } else if (isInserting) {
      context.missing(_moraMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PagosPendiente map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PagosPendiente(
      periodoDeuda: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}periodo_deuda'])!,
      mora: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}mora'])!,
    );
  }

  @override
  $PagosPendientesTable createAlias(String alias) {
    return $PagosPendientesTable(attachedDatabase, alias);
  }
}

class PagosPendiente extends DataClass implements Insertable<PagosPendiente> {
  final DateTime periodoDeuda;
  final double mora;
  const PagosPendiente({required this.periodoDeuda, required this.mora});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['periodo_deuda'] = Variable<DateTime>(periodoDeuda);
    map['mora'] = Variable<double>(mora);
    return map;
  }

  PagosPendientesCompanion toCompanion(bool nullToAbsent) {
    return PagosPendientesCompanion(
      periodoDeuda: Value(periodoDeuda),
      mora: Value(mora),
    );
  }

  factory PagosPendiente.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PagosPendiente(
      periodoDeuda: serializer.fromJson<DateTime>(json['periodoDeuda']),
      mora: serializer.fromJson<double>(json['mora']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'periodoDeuda': serializer.toJson<DateTime>(periodoDeuda),
      'mora': serializer.toJson<double>(mora),
    };
  }

  PagosPendiente copyWith({DateTime? periodoDeuda, double? mora}) =>
      PagosPendiente(
        periodoDeuda: periodoDeuda ?? this.periodoDeuda,
        mora: mora ?? this.mora,
      );
  @override
  String toString() {
    return (StringBuffer('PagosPendiente(')
          ..write('periodoDeuda: $periodoDeuda, ')
          ..write('mora: $mora')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(periodoDeuda, mora);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PagosPendiente &&
          other.periodoDeuda == this.periodoDeuda &&
          other.mora == this.mora);
}

class PagosPendientesCompanion extends UpdateCompanion<PagosPendiente> {
  final Value<DateTime> periodoDeuda;
  final Value<double> mora;
  final Value<int> rowid;
  const PagosPendientesCompanion({
    this.periodoDeuda = const Value.absent(),
    this.mora = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PagosPendientesCompanion.insert({
    required DateTime periodoDeuda,
    required double mora,
    this.rowid = const Value.absent(),
  })  : periodoDeuda = Value(periodoDeuda),
        mora = Value(mora);
  static Insertable<PagosPendiente> custom({
    Expression<DateTime>? periodoDeuda,
    Expression<double>? mora,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (periodoDeuda != null) 'periodo_deuda': periodoDeuda,
      if (mora != null) 'mora': mora,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PagosPendientesCompanion copyWith(
      {Value<DateTime>? periodoDeuda, Value<double>? mora, Value<int>? rowid}) {
    return PagosPendientesCompanion(
      periodoDeuda: periodoDeuda ?? this.periodoDeuda,
      mora: mora ?? this.mora,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (periodoDeuda.present) {
      map['periodo_deuda'] = Variable<DateTime>(periodoDeuda.value);
    }
    if (mora.present) {
      map['mora'] = Variable<double>(mora.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PagosPendientesCompanion(')
          ..write('periodoDeuda: $periodoDeuda, ')
          ..write('mora: $mora, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EstadoCuentasTable extends EstadoCuentas
    with TableInfo<$EstadoCuentasTable, EstadoCuenta> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EstadoCuentasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _estadoIdMeta =
      const VerificationMeta('estadoId');
  @override
  late final GeneratedColumn<int> estadoId = GeneratedColumn<int>(
      'estado_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _idArrendatarioMeta =
      const VerificationMeta('idArrendatario');
  @override
  late final GeneratedColumn<String> idArrendatario = GeneratedColumn<String>(
      'id_arrendatario', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES actual_arrendatarios (id_arrendatario)'));
  static const VerificationMeta _pagoRentaMeta =
      const VerificationMeta('pagoRenta');
  @override
  late final GeneratedColumn<double> pagoRenta = GeneratedColumn<double>(
      'pago_renta', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _moraRentaMeta =
      const VerificationMeta('moraRenta');
  @override
  late final GeneratedColumn<double> moraRenta = GeneratedColumn<double>(
      'mora_renta', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _deudaElectricidadMeta =
      const VerificationMeta('deudaElectricidad');
  @override
  late final GeneratedColumn<double> deudaElectricidad =
      GeneratedColumn<double>('deuda_electricidad', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _deudaAguaMeta =
      const VerificationMeta('deudaAgua');
  @override
  late final GeneratedColumn<double> deudaAgua = GeneratedColumn<double>(
      'deuda_agua', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _fechaPagoMeta =
      const VerificationMeta('fechaPago');
  @override
  late final GeneratedColumn<DateTime> fechaPago = GeneratedColumn<DateTime>(
      'fecha_pago', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        estadoId,
        idArrendatario,
        pagoRenta,
        moraRenta,
        deudaElectricidad,
        deudaAgua,
        fechaPago
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'estado_cuentas';
  @override
  VerificationContext validateIntegrity(Insertable<EstadoCuenta> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('estado_id')) {
      context.handle(_estadoIdMeta,
          estadoId.isAcceptableOrUnknown(data['estado_id']!, _estadoIdMeta));
    }
    if (data.containsKey('id_arrendatario')) {
      context.handle(
          _idArrendatarioMeta,
          idArrendatario.isAcceptableOrUnknown(
              data['id_arrendatario']!, _idArrendatarioMeta));
    } else if (isInserting) {
      context.missing(_idArrendatarioMeta);
    }
    if (data.containsKey('pago_renta')) {
      context.handle(_pagoRentaMeta,
          pagoRenta.isAcceptableOrUnknown(data['pago_renta']!, _pagoRentaMeta));
    } else if (isInserting) {
      context.missing(_pagoRentaMeta);
    }
    if (data.containsKey('mora_renta')) {
      context.handle(_moraRentaMeta,
          moraRenta.isAcceptableOrUnknown(data['mora_renta']!, _moraRentaMeta));
    } else if (isInserting) {
      context.missing(_moraRentaMeta);
    }
    if (data.containsKey('deuda_electricidad')) {
      context.handle(
          _deudaElectricidadMeta,
          deudaElectricidad.isAcceptableOrUnknown(
              data['deuda_electricidad']!, _deudaElectricidadMeta));
    } else if (isInserting) {
      context.missing(_deudaElectricidadMeta);
    }
    if (data.containsKey('deuda_agua')) {
      context.handle(_deudaAguaMeta,
          deudaAgua.isAcceptableOrUnknown(data['deuda_agua']!, _deudaAguaMeta));
    } else if (isInserting) {
      context.missing(_deudaAguaMeta);
    }
    if (data.containsKey('fecha_pago')) {
      context.handle(_fechaPagoMeta,
          fechaPago.isAcceptableOrUnknown(data['fecha_pago']!, _fechaPagoMeta));
    } else if (isInserting) {
      context.missing(_fechaPagoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {estadoId};
  @override
  EstadoCuenta map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EstadoCuenta(
      estadoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}estado_id'])!,
      idArrendatario: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}id_arrendatario'])!,
      pagoRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}pago_renta'])!,
      moraRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}mora_renta'])!,
      deudaElectricidad: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}deuda_electricidad'])!,
      deudaAgua: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}deuda_agua'])!,
      fechaPago: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_pago'])!,
    );
  }

  @override
  $EstadoCuentasTable createAlias(String alias) {
    return $EstadoCuentasTable(attachedDatabase, alias);
  }
}

class EstadoCuenta extends DataClass implements Insertable<EstadoCuenta> {
  final int estadoId;
  final String idArrendatario;
  final double pagoRenta;
  final double moraRenta;
  final double deudaElectricidad;
  final double deudaAgua;
  final DateTime fechaPago;
  const EstadoCuenta(
      {required this.estadoId,
      required this.idArrendatario,
      required this.pagoRenta,
      required this.moraRenta,
      required this.deudaElectricidad,
      required this.deudaAgua,
      required this.fechaPago});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['estado_id'] = Variable<int>(estadoId);
    map['id_arrendatario'] = Variable<String>(idArrendatario);
    map['pago_renta'] = Variable<double>(pagoRenta);
    map['mora_renta'] = Variable<double>(moraRenta);
    map['deuda_electricidad'] = Variable<double>(deudaElectricidad);
    map['deuda_agua'] = Variable<double>(deudaAgua);
    map['fecha_pago'] = Variable<DateTime>(fechaPago);
    return map;
  }

  EstadoCuentasCompanion toCompanion(bool nullToAbsent) {
    return EstadoCuentasCompanion(
      estadoId: Value(estadoId),
      idArrendatario: Value(idArrendatario),
      pagoRenta: Value(pagoRenta),
      moraRenta: Value(moraRenta),
      deudaElectricidad: Value(deudaElectricidad),
      deudaAgua: Value(deudaAgua),
      fechaPago: Value(fechaPago),
    );
  }

  factory EstadoCuenta.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EstadoCuenta(
      estadoId: serializer.fromJson<int>(json['estadoId']),
      idArrendatario: serializer.fromJson<String>(json['idArrendatario']),
      pagoRenta: serializer.fromJson<double>(json['pagoRenta']),
      moraRenta: serializer.fromJson<double>(json['moraRenta']),
      deudaElectricidad: serializer.fromJson<double>(json['deudaElectricidad']),
      deudaAgua: serializer.fromJson<double>(json['deudaAgua']),
      fechaPago: serializer.fromJson<DateTime>(json['fechaPago']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'estadoId': serializer.toJson<int>(estadoId),
      'idArrendatario': serializer.toJson<String>(idArrendatario),
      'pagoRenta': serializer.toJson<double>(pagoRenta),
      'moraRenta': serializer.toJson<double>(moraRenta),
      'deudaElectricidad': serializer.toJson<double>(deudaElectricidad),
      'deudaAgua': serializer.toJson<double>(deudaAgua),
      'fechaPago': serializer.toJson<DateTime>(fechaPago),
    };
  }

  EstadoCuenta copyWith(
          {int? estadoId,
          String? idArrendatario,
          double? pagoRenta,
          double? moraRenta,
          double? deudaElectricidad,
          double? deudaAgua,
          DateTime? fechaPago}) =>
      EstadoCuenta(
        estadoId: estadoId ?? this.estadoId,
        idArrendatario: idArrendatario ?? this.idArrendatario,
        pagoRenta: pagoRenta ?? this.pagoRenta,
        moraRenta: moraRenta ?? this.moraRenta,
        deudaElectricidad: deudaElectricidad ?? this.deudaElectricidad,
        deudaAgua: deudaAgua ?? this.deudaAgua,
        fechaPago: fechaPago ?? this.fechaPago,
      );
  @override
  String toString() {
    return (StringBuffer('EstadoCuenta(')
          ..write('estadoId: $estadoId, ')
          ..write('idArrendatario: $idArrendatario, ')
          ..write('pagoRenta: $pagoRenta, ')
          ..write('moraRenta: $moraRenta, ')
          ..write('deudaElectricidad: $deudaElectricidad, ')
          ..write('deudaAgua: $deudaAgua, ')
          ..write('fechaPago: $fechaPago')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(estadoId, idArrendatario, pagoRenta,
      moraRenta, deudaElectricidad, deudaAgua, fechaPago);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EstadoCuenta &&
          other.estadoId == this.estadoId &&
          other.idArrendatario == this.idArrendatario &&
          other.pagoRenta == this.pagoRenta &&
          other.moraRenta == this.moraRenta &&
          other.deudaElectricidad == this.deudaElectricidad &&
          other.deudaAgua == this.deudaAgua &&
          other.fechaPago == this.fechaPago);
}

class EstadoCuentasCompanion extends UpdateCompanion<EstadoCuenta> {
  final Value<int> estadoId;
  final Value<String> idArrendatario;
  final Value<double> pagoRenta;
  final Value<double> moraRenta;
  final Value<double> deudaElectricidad;
  final Value<double> deudaAgua;
  final Value<DateTime> fechaPago;
  const EstadoCuentasCompanion({
    this.estadoId = const Value.absent(),
    this.idArrendatario = const Value.absent(),
    this.pagoRenta = const Value.absent(),
    this.moraRenta = const Value.absent(),
    this.deudaElectricidad = const Value.absent(),
    this.deudaAgua = const Value.absent(),
    this.fechaPago = const Value.absent(),
  });
  EstadoCuentasCompanion.insert({
    this.estadoId = const Value.absent(),
    required String idArrendatario,
    required double pagoRenta,
    required double moraRenta,
    required double deudaElectricidad,
    required double deudaAgua,
    required DateTime fechaPago,
  })  : idArrendatario = Value(idArrendatario),
        pagoRenta = Value(pagoRenta),
        moraRenta = Value(moraRenta),
        deudaElectricidad = Value(deudaElectricidad),
        deudaAgua = Value(deudaAgua),
        fechaPago = Value(fechaPago);
  static Insertable<EstadoCuenta> custom({
    Expression<int>? estadoId,
    Expression<String>? idArrendatario,
    Expression<double>? pagoRenta,
    Expression<double>? moraRenta,
    Expression<double>? deudaElectricidad,
    Expression<double>? deudaAgua,
    Expression<DateTime>? fechaPago,
  }) {
    return RawValuesInsertable({
      if (estadoId != null) 'estado_id': estadoId,
      if (idArrendatario != null) 'id_arrendatario': idArrendatario,
      if (pagoRenta != null) 'pago_renta': pagoRenta,
      if (moraRenta != null) 'mora_renta': moraRenta,
      if (deudaElectricidad != null) 'deuda_electricidad': deudaElectricidad,
      if (deudaAgua != null) 'deuda_agua': deudaAgua,
      if (fechaPago != null) 'fecha_pago': fechaPago,
    });
  }

  EstadoCuentasCompanion copyWith(
      {Value<int>? estadoId,
      Value<String>? idArrendatario,
      Value<double>? pagoRenta,
      Value<double>? moraRenta,
      Value<double>? deudaElectricidad,
      Value<double>? deudaAgua,
      Value<DateTime>? fechaPago}) {
    return EstadoCuentasCompanion(
      estadoId: estadoId ?? this.estadoId,
      idArrendatario: idArrendatario ?? this.idArrendatario,
      pagoRenta: pagoRenta ?? this.pagoRenta,
      moraRenta: moraRenta ?? this.moraRenta,
      deudaElectricidad: deudaElectricidad ?? this.deudaElectricidad,
      deudaAgua: deudaAgua ?? this.deudaAgua,
      fechaPago: fechaPago ?? this.fechaPago,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (estadoId.present) {
      map['estado_id'] = Variable<int>(estadoId.value);
    }
    if (idArrendatario.present) {
      map['id_arrendatario'] = Variable<String>(idArrendatario.value);
    }
    if (pagoRenta.present) {
      map['pago_renta'] = Variable<double>(pagoRenta.value);
    }
    if (moraRenta.present) {
      map['mora_renta'] = Variable<double>(moraRenta.value);
    }
    if (deudaElectricidad.present) {
      map['deuda_electricidad'] = Variable<double>(deudaElectricidad.value);
    }
    if (deudaAgua.present) {
      map['deuda_agua'] = Variable<double>(deudaAgua.value);
    }
    if (fechaPago.present) {
      map['fecha_pago'] = Variable<DateTime>(fechaPago.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EstadoCuentasCompanion(')
          ..write('estadoId: $estadoId, ')
          ..write('idArrendatario: $idArrendatario, ')
          ..write('pagoRenta: $pagoRenta, ')
          ..write('moraRenta: $moraRenta, ')
          ..write('deudaElectricidad: $deudaElectricidad, ')
          ..write('deudaAgua: $deudaAgua, ')
          ..write('fechaPago: $fechaPago')
          ..write(')'))
        .toString();
  }
}

class $DanosPropiedadTable extends DanosPropiedad
    with TableInfo<$DanosPropiedadTable, DanosPropiedadData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DanosPropiedadTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _totalReparacionesMeta =
      const VerificationMeta('totalReparaciones');
  @override
  late final GeneratedColumn<double> totalReparaciones =
      GeneratedColumn<double>('total_reparaciones', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _montoFinalMeta =
      const VerificationMeta('montoFinal');
  @override
  late final GeneratedColumn<double> montoFinal = GeneratedColumn<double>(
      'monto_final', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _cViviendaMeta =
      const VerificationMeta('cVivienda');
  @override
  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES vivienda_ubicacion (codigo_vivienda)'));
  static const VerificationMeta _idArrendatarioMeta =
      const VerificationMeta('idArrendatario');
  @override
  late final GeneratedColumn<String> idArrendatario = GeneratedColumn<String>(
      'id_arrendatario', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES arrendatarios (identidad)'));
  static const VerificationMeta _fSalidaMeta =
      const VerificationMeta('fSalida');
  @override
  late final GeneratedColumn<DateTime> fSalida = GeneratedColumn<DateTime>(
      'f_salida', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        totalReparaciones,
        montoFinal,
        descripcion,
        cVivienda,
        idArrendatario,
        fSalida
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'danos_propiedad';
  @override
  VerificationContext validateIntegrity(Insertable<DanosPropiedadData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('total_reparaciones')) {
      context.handle(
          _totalReparacionesMeta,
          totalReparaciones.isAcceptableOrUnknown(
              data['total_reparaciones']!, _totalReparacionesMeta));
    } else if (isInserting) {
      context.missing(_totalReparacionesMeta);
    }
    if (data.containsKey('monto_final')) {
      context.handle(
          _montoFinalMeta,
          montoFinal.isAcceptableOrUnknown(
              data['monto_final']!, _montoFinalMeta));
    } else if (isInserting) {
      context.missing(_montoFinalMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('c_vivienda')) {
      context.handle(_cViviendaMeta,
          cVivienda.isAcceptableOrUnknown(data['c_vivienda']!, _cViviendaMeta));
    } else if (isInserting) {
      context.missing(_cViviendaMeta);
    }
    if (data.containsKey('id_arrendatario')) {
      context.handle(
          _idArrendatarioMeta,
          idArrendatario.isAcceptableOrUnknown(
              data['id_arrendatario']!, _idArrendatarioMeta));
    } else if (isInserting) {
      context.missing(_idArrendatarioMeta);
    }
    if (data.containsKey('f_salida')) {
      context.handle(_fSalidaMeta,
          fSalida.isAcceptableOrUnknown(data['f_salida']!, _fSalidaMeta));
    } else if (isInserting) {
      context.missing(_fSalidaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DanosPropiedadData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DanosPropiedadData(
      totalReparaciones: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}total_reparaciones'])!,
      montoFinal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}monto_final'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
      idArrendatario: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}id_arrendatario'])!,
      fSalida: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}f_salida'])!,
    );
  }

  @override
  $DanosPropiedadTable createAlias(String alias) {
    return $DanosPropiedadTable(attachedDatabase, alias);
  }
}

class DanosPropiedadData extends DataClass
    implements Insertable<DanosPropiedadData> {
  final double totalReparaciones;
  final double montoFinal;
  final String descripcion;
  final String cVivienda;
  final String idArrendatario;
  final DateTime fSalida;
  const DanosPropiedadData(
      {required this.totalReparaciones,
      required this.montoFinal,
      required this.descripcion,
      required this.cVivienda,
      required this.idArrendatario,
      required this.fSalida});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['total_reparaciones'] = Variable<double>(totalReparaciones);
    map['monto_final'] = Variable<double>(montoFinal);
    map['descripcion'] = Variable<String>(descripcion);
    map['c_vivienda'] = Variable<String>(cVivienda);
    map['id_arrendatario'] = Variable<String>(idArrendatario);
    map['f_salida'] = Variable<DateTime>(fSalida);
    return map;
  }

  DanosPropiedadCompanion toCompanion(bool nullToAbsent) {
    return DanosPropiedadCompanion(
      totalReparaciones: Value(totalReparaciones),
      montoFinal: Value(montoFinal),
      descripcion: Value(descripcion),
      cVivienda: Value(cVivienda),
      idArrendatario: Value(idArrendatario),
      fSalida: Value(fSalida),
    );
  }

  factory DanosPropiedadData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DanosPropiedadData(
      totalReparaciones: serializer.fromJson<double>(json['totalReparaciones']),
      montoFinal: serializer.fromJson<double>(json['montoFinal']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
      idArrendatario: serializer.fromJson<String>(json['idArrendatario']),
      fSalida: serializer.fromJson<DateTime>(json['fSalida']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'totalReparaciones': serializer.toJson<double>(totalReparaciones),
      'montoFinal': serializer.toJson<double>(montoFinal),
      'descripcion': serializer.toJson<String>(descripcion),
      'cVivienda': serializer.toJson<String>(cVivienda),
      'idArrendatario': serializer.toJson<String>(idArrendatario),
      'fSalida': serializer.toJson<DateTime>(fSalida),
    };
  }

  DanosPropiedadData copyWith(
          {double? totalReparaciones,
          double? montoFinal,
          String? descripcion,
          String? cVivienda,
          String? idArrendatario,
          DateTime? fSalida}) =>
      DanosPropiedadData(
        totalReparaciones: totalReparaciones ?? this.totalReparaciones,
        montoFinal: montoFinal ?? this.montoFinal,
        descripcion: descripcion ?? this.descripcion,
        cVivienda: cVivienda ?? this.cVivienda,
        idArrendatario: idArrendatario ?? this.idArrendatario,
        fSalida: fSalida ?? this.fSalida,
      );
  @override
  String toString() {
    return (StringBuffer('DanosPropiedadData(')
          ..write('totalReparaciones: $totalReparaciones, ')
          ..write('montoFinal: $montoFinal, ')
          ..write('descripcion: $descripcion, ')
          ..write('cVivienda: $cVivienda, ')
          ..write('idArrendatario: $idArrendatario, ')
          ..write('fSalida: $fSalida')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(totalReparaciones, montoFinal, descripcion,
      cVivienda, idArrendatario, fSalida);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DanosPropiedadData &&
          other.totalReparaciones == this.totalReparaciones &&
          other.montoFinal == this.montoFinal &&
          other.descripcion == this.descripcion &&
          other.cVivienda == this.cVivienda &&
          other.idArrendatario == this.idArrendatario &&
          other.fSalida == this.fSalida);
}

class DanosPropiedadCompanion extends UpdateCompanion<DanosPropiedadData> {
  final Value<double> totalReparaciones;
  final Value<double> montoFinal;
  final Value<String> descripcion;
  final Value<String> cVivienda;
  final Value<String> idArrendatario;
  final Value<DateTime> fSalida;
  final Value<int> rowid;
  const DanosPropiedadCompanion({
    this.totalReparaciones = const Value.absent(),
    this.montoFinal = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.cVivienda = const Value.absent(),
    this.idArrendatario = const Value.absent(),
    this.fSalida = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DanosPropiedadCompanion.insert({
    required double totalReparaciones,
    required double montoFinal,
    required String descripcion,
    required String cVivienda,
    required String idArrendatario,
    required DateTime fSalida,
    this.rowid = const Value.absent(),
  })  : totalReparaciones = Value(totalReparaciones),
        montoFinal = Value(montoFinal),
        descripcion = Value(descripcion),
        cVivienda = Value(cVivienda),
        idArrendatario = Value(idArrendatario),
        fSalida = Value(fSalida);
  static Insertable<DanosPropiedadData> custom({
    Expression<double>? totalReparaciones,
    Expression<double>? montoFinal,
    Expression<String>? descripcion,
    Expression<String>? cVivienda,
    Expression<String>? idArrendatario,
    Expression<DateTime>? fSalida,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (totalReparaciones != null) 'total_reparaciones': totalReparaciones,
      if (montoFinal != null) 'monto_final': montoFinal,
      if (descripcion != null) 'descripcion': descripcion,
      if (cVivienda != null) 'c_vivienda': cVivienda,
      if (idArrendatario != null) 'id_arrendatario': idArrendatario,
      if (fSalida != null) 'f_salida': fSalida,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DanosPropiedadCompanion copyWith(
      {Value<double>? totalReparaciones,
      Value<double>? montoFinal,
      Value<String>? descripcion,
      Value<String>? cVivienda,
      Value<String>? idArrendatario,
      Value<DateTime>? fSalida,
      Value<int>? rowid}) {
    return DanosPropiedadCompanion(
      totalReparaciones: totalReparaciones ?? this.totalReparaciones,
      montoFinal: montoFinal ?? this.montoFinal,
      descripcion: descripcion ?? this.descripcion,
      cVivienda: cVivienda ?? this.cVivienda,
      idArrendatario: idArrendatario ?? this.idArrendatario,
      fSalida: fSalida ?? this.fSalida,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (totalReparaciones.present) {
      map['total_reparaciones'] = Variable<double>(totalReparaciones.value);
    }
    if (montoFinal.present) {
      map['monto_final'] = Variable<double>(montoFinal.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (cVivienda.present) {
      map['c_vivienda'] = Variable<String>(cVivienda.value);
    }
    if (idArrendatario.present) {
      map['id_arrendatario'] = Variable<String>(idArrendatario.value);
    }
    if (fSalida.present) {
      map['f_salida'] = Variable<DateTime>(fSalida.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DanosPropiedadCompanion(')
          ..write('totalReparaciones: $totalReparaciones, ')
          ..write('montoFinal: $montoFinal, ')
          ..write('descripcion: $descripcion, ')
          ..write('cVivienda: $cVivienda, ')
          ..write('idArrendatario: $idArrendatario, ')
          ..write('fSalida: $fSalida, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProveedoresServiciosTable extends ProveedoresServicios
    with TableInfo<$ProveedoresServiciosTable, ProveedoresServicio> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProveedoresServiciosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoProveedorMeta =
      const VerificationMeta('codigoProveedor');
  @override
  late final GeneratedColumn<String> codigoProveedor = GeneratedColumn<String>(
      'codigo_proveedor', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _proveedorNombreMeta =
      const VerificationMeta('proveedorNombre');
  @override
  late final GeneratedColumn<String> proveedorNombre = GeneratedColumn<String>(
      'proveedor_nombre', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _servicioMeta =
      const VerificationMeta('servicio');
  @override
  late final GeneratedColumn<String> servicio = GeneratedColumn<String>(
      'servicio', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [codigoProveedor, proveedorNombre, servicio];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'proveedores_servicios';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProveedoresServicio> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo_proveedor')) {
      context.handle(
          _codigoProveedorMeta,
          codigoProveedor.isAcceptableOrUnknown(
              data['codigo_proveedor']!, _codigoProveedorMeta));
    } else if (isInserting) {
      context.missing(_codigoProveedorMeta);
    }
    if (data.containsKey('proveedor_nombre')) {
      context.handle(
          _proveedorNombreMeta,
          proveedorNombre.isAcceptableOrUnknown(
              data['proveedor_nombre']!, _proveedorNombreMeta));
    } else if (isInserting) {
      context.missing(_proveedorNombreMeta);
    }
    if (data.containsKey('servicio')) {
      context.handle(_servicioMeta,
          servicio.isAcceptableOrUnknown(data['servicio']!, _servicioMeta));
    } else if (isInserting) {
      context.missing(_servicioMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ProveedoresServicio map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProveedoresServicio(
      codigoProveedor: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}codigo_proveedor'])!,
      proveedorNombre: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}proveedor_nombre'])!,
      servicio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}servicio'])!,
    );
  }

  @override
  $ProveedoresServiciosTable createAlias(String alias) {
    return $ProveedoresServiciosTable(attachedDatabase, alias);
  }
}

class ProveedoresServicio extends DataClass
    implements Insertable<ProveedoresServicio> {
  final String codigoProveedor;
  final String proveedorNombre;
  final String servicio;
  const ProveedoresServicio(
      {required this.codigoProveedor,
      required this.proveedorNombre,
      required this.servicio});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['codigo_proveedor'] = Variable<String>(codigoProveedor);
    map['proveedor_nombre'] = Variable<String>(proveedorNombre);
    map['servicio'] = Variable<String>(servicio);
    return map;
  }

  ProveedoresServiciosCompanion toCompanion(bool nullToAbsent) {
    return ProveedoresServiciosCompanion(
      codigoProveedor: Value(codigoProveedor),
      proveedorNombre: Value(proveedorNombre),
      servicio: Value(servicio),
    );
  }

  factory ProveedoresServicio.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProveedoresServicio(
      codigoProveedor: serializer.fromJson<String>(json['codigoProveedor']),
      proveedorNombre: serializer.fromJson<String>(json['proveedorNombre']),
      servicio: serializer.fromJson<String>(json['servicio']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codigoProveedor': serializer.toJson<String>(codigoProveedor),
      'proveedorNombre': serializer.toJson<String>(proveedorNombre),
      'servicio': serializer.toJson<String>(servicio),
    };
  }

  ProveedoresServicio copyWith(
          {String? codigoProveedor,
          String? proveedorNombre,
          String? servicio}) =>
      ProveedoresServicio(
        codigoProveedor: codigoProveedor ?? this.codigoProveedor,
        proveedorNombre: proveedorNombre ?? this.proveedorNombre,
        servicio: servicio ?? this.servicio,
      );
  @override
  String toString() {
    return (StringBuffer('ProveedoresServicio(')
          ..write('codigoProveedor: $codigoProveedor, ')
          ..write('proveedorNombre: $proveedorNombre, ')
          ..write('servicio: $servicio')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codigoProveedor, proveedorNombre, servicio);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProveedoresServicio &&
          other.codigoProveedor == this.codigoProveedor &&
          other.proveedorNombre == this.proveedorNombre &&
          other.servicio == this.servicio);
}

class ProveedoresServiciosCompanion
    extends UpdateCompanion<ProveedoresServicio> {
  final Value<String> codigoProveedor;
  final Value<String> proveedorNombre;
  final Value<String> servicio;
  final Value<int> rowid;
  const ProveedoresServiciosCompanion({
    this.codigoProveedor = const Value.absent(),
    this.proveedorNombre = const Value.absent(),
    this.servicio = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProveedoresServiciosCompanion.insert({
    required String codigoProveedor,
    required String proveedorNombre,
    required String servicio,
    this.rowid = const Value.absent(),
  })  : codigoProveedor = Value(codigoProveedor),
        proveedorNombre = Value(proveedorNombre),
        servicio = Value(servicio);
  static Insertable<ProveedoresServicio> custom({
    Expression<String>? codigoProveedor,
    Expression<String>? proveedorNombre,
    Expression<String>? servicio,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (codigoProveedor != null) 'codigo_proveedor': codigoProveedor,
      if (proveedorNombre != null) 'proveedor_nombre': proveedorNombre,
      if (servicio != null) 'servicio': servicio,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProveedoresServiciosCompanion copyWith(
      {Value<String>? codigoProveedor,
      Value<String>? proveedorNombre,
      Value<String>? servicio,
      Value<int>? rowid}) {
    return ProveedoresServiciosCompanion(
      codigoProveedor: codigoProveedor ?? this.codigoProveedor,
      proveedorNombre: proveedorNombre ?? this.proveedorNombre,
      servicio: servicio ?? this.servicio,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigoProveedor.present) {
      map['codigo_proveedor'] = Variable<String>(codigoProveedor.value);
    }
    if (proveedorNombre.present) {
      map['proveedor_nombre'] = Variable<String>(proveedorNombre.value);
    }
    if (servicio.present) {
      map['servicio'] = Variable<String>(servicio.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProveedoresServiciosCompanion(')
          ..write('codigoProveedor: $codigoProveedor, ')
          ..write('proveedorNombre: $proveedorNombre, ')
          ..write('servicio: $servicio, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CuentaProveedoresServiciosTable extends CuentaProveedoresServicios
    with
        TableInfo<$CuentaProveedoresServiciosTable, CuentaProveedoresServicio> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CuentaProveedoresServiciosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _proveedorIDMeta =
      const VerificationMeta('proveedorID');
  @override
  late final GeneratedColumn<String> proveedorID = GeneratedColumn<String>(
      'proveedor_i_d', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _proveedorMeta =
      const VerificationMeta('proveedor');
  @override
  late final GeneratedColumn<String> proveedor = GeneratedColumn<String>(
      'proveedor', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _servicioMeta =
      const VerificationMeta('servicio');
  @override
  late final GeneratedColumn<String> servicio = GeneratedColumn<String>(
      'servicio', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _montoTotalMeta =
      const VerificationMeta('montoTotal');
  @override
  late final GeneratedColumn<double> montoTotal = GeneratedColumn<double>(
      'monto_total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [proveedorID, proveedor, servicio, montoTotal];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cuenta_proveedores_servicios';
  @override
  VerificationContext validateIntegrity(
      Insertable<CuentaProveedoresServicio> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('proveedor_i_d')) {
      context.handle(
          _proveedorIDMeta,
          proveedorID.isAcceptableOrUnknown(
              data['proveedor_i_d']!, _proveedorIDMeta));
    } else if (isInserting) {
      context.missing(_proveedorIDMeta);
    }
    if (data.containsKey('proveedor')) {
      context.handle(_proveedorMeta,
          proveedor.isAcceptableOrUnknown(data['proveedor']!, _proveedorMeta));
    } else if (isInserting) {
      context.missing(_proveedorMeta);
    }
    if (data.containsKey('servicio')) {
      context.handle(_servicioMeta,
          servicio.isAcceptableOrUnknown(data['servicio']!, _servicioMeta));
    } else if (isInserting) {
      context.missing(_servicioMeta);
    }
    if (data.containsKey('monto_total')) {
      context.handle(
          _montoTotalMeta,
          montoTotal.isAcceptableOrUnknown(
              data['monto_total']!, _montoTotalMeta));
    } else if (isInserting) {
      context.missing(_montoTotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CuentaProveedoresServicio map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CuentaProveedoresServicio(
      proveedorID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}proveedor_i_d'])!,
      proveedor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}proveedor'])!,
      servicio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}servicio'])!,
      montoTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}monto_total'])!,
    );
  }

  @override
  $CuentaProveedoresServiciosTable createAlias(String alias) {
    return $CuentaProveedoresServiciosTable(attachedDatabase, alias);
  }
}

class CuentaProveedoresServicio extends DataClass
    implements Insertable<CuentaProveedoresServicio> {
  final String proveedorID;
  final String proveedor;
  final String servicio;
  final double montoTotal;
  const CuentaProveedoresServicio(
      {required this.proveedorID,
      required this.proveedor,
      required this.servicio,
      required this.montoTotal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['proveedor_i_d'] = Variable<String>(proveedorID);
    map['proveedor'] = Variable<String>(proveedor);
    map['servicio'] = Variable<String>(servicio);
    map['monto_total'] = Variable<double>(montoTotal);
    return map;
  }

  CuentaProveedoresServiciosCompanion toCompanion(bool nullToAbsent) {
    return CuentaProveedoresServiciosCompanion(
      proveedorID: Value(proveedorID),
      proveedor: Value(proveedor),
      servicio: Value(servicio),
      montoTotal: Value(montoTotal),
    );
  }

  factory CuentaProveedoresServicio.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CuentaProveedoresServicio(
      proveedorID: serializer.fromJson<String>(json['proveedorID']),
      proveedor: serializer.fromJson<String>(json['proveedor']),
      servicio: serializer.fromJson<String>(json['servicio']),
      montoTotal: serializer.fromJson<double>(json['montoTotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'proveedorID': serializer.toJson<String>(proveedorID),
      'proveedor': serializer.toJson<String>(proveedor),
      'servicio': serializer.toJson<String>(servicio),
      'montoTotal': serializer.toJson<double>(montoTotal),
    };
  }

  CuentaProveedoresServicio copyWith(
          {String? proveedorID,
          String? proveedor,
          String? servicio,
          double? montoTotal}) =>
      CuentaProveedoresServicio(
        proveedorID: proveedorID ?? this.proveedorID,
        proveedor: proveedor ?? this.proveedor,
        servicio: servicio ?? this.servicio,
        montoTotal: montoTotal ?? this.montoTotal,
      );
  @override
  String toString() {
    return (StringBuffer('CuentaProveedoresServicio(')
          ..write('proveedorID: $proveedorID, ')
          ..write('proveedor: $proveedor, ')
          ..write('servicio: $servicio, ')
          ..write('montoTotal: $montoTotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(proveedorID, proveedor, servicio, montoTotal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CuentaProveedoresServicio &&
          other.proveedorID == this.proveedorID &&
          other.proveedor == this.proveedor &&
          other.servicio == this.servicio &&
          other.montoTotal == this.montoTotal);
}

class CuentaProveedoresServiciosCompanion
    extends UpdateCompanion<CuentaProveedoresServicio> {
  final Value<String> proveedorID;
  final Value<String> proveedor;
  final Value<String> servicio;
  final Value<double> montoTotal;
  final Value<int> rowid;
  const CuentaProveedoresServiciosCompanion({
    this.proveedorID = const Value.absent(),
    this.proveedor = const Value.absent(),
    this.servicio = const Value.absent(),
    this.montoTotal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CuentaProveedoresServiciosCompanion.insert({
    required String proveedorID,
    required String proveedor,
    required String servicio,
    required double montoTotal,
    this.rowid = const Value.absent(),
  })  : proveedorID = Value(proveedorID),
        proveedor = Value(proveedor),
        servicio = Value(servicio),
        montoTotal = Value(montoTotal);
  static Insertable<CuentaProveedoresServicio> custom({
    Expression<String>? proveedorID,
    Expression<String>? proveedor,
    Expression<String>? servicio,
    Expression<double>? montoTotal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (proveedorID != null) 'proveedor_i_d': proveedorID,
      if (proveedor != null) 'proveedor': proveedor,
      if (servicio != null) 'servicio': servicio,
      if (montoTotal != null) 'monto_total': montoTotal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CuentaProveedoresServiciosCompanion copyWith(
      {Value<String>? proveedorID,
      Value<String>? proveedor,
      Value<String>? servicio,
      Value<double>? montoTotal,
      Value<int>? rowid}) {
    return CuentaProveedoresServiciosCompanion(
      proveedorID: proveedorID ?? this.proveedorID,
      proveedor: proveedor ?? this.proveedor,
      servicio: servicio ?? this.servicio,
      montoTotal: montoTotal ?? this.montoTotal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (proveedorID.present) {
      map['proveedor_i_d'] = Variable<String>(proveedorID.value);
    }
    if (proveedor.present) {
      map['proveedor'] = Variable<String>(proveedor.value);
    }
    if (servicio.present) {
      map['servicio'] = Variable<String>(servicio.value);
    }
    if (montoTotal.present) {
      map['monto_total'] = Variable<double>(montoTotal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CuentaProveedoresServiciosCompanion(')
          ..write('proveedorID: $proveedorID, ')
          ..write('proveedor: $proveedor, ')
          ..write('servicio: $servicio, ')
          ..write('montoTotal: $montoTotal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CuentasPSDesocupadosTable extends CuentasPSDesocupados
    with TableInfo<$CuentasPSDesocupadosTable, CuentasPSDesocupado> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CuentasPSDesocupadosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cViviendaMeta =
      const VerificationMeta('cVivienda');
  @override
  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES vivienda_ubicacion (codigo_vivienda)'));
  static const VerificationMeta _cProveedorAguaMeta =
      const VerificationMeta('cProveedorAgua');
  @override
  late final GeneratedColumn<String> cProveedorAgua = GeneratedColumn<String>(
      'c_proveedor_agua', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES proveedores_servicios (codigo_proveedor)'));
  static const VerificationMeta _montoAguaMeta =
      const VerificationMeta('montoAgua');
  @override
  late final GeneratedColumn<double> montoAgua = GeneratedColumn<double>(
      'monto_agua', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _cProveedorEnergiaMeta =
      const VerificationMeta('cProveedorEnergia');
  @override
  late final GeneratedColumn<String> cProveedorEnergia =
      GeneratedColumn<String>('c_proveedor_energia', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES proveedores_servicios (codigo_proveedor)'));
  static const VerificationMeta _montoEnergiaMeta =
      const VerificationMeta('montoEnergia');
  @override
  late final GeneratedColumn<double> montoEnergia = GeneratedColumn<double>(
      'monto_energia', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [cVivienda, cProveedorAgua, montoAgua, cProveedorEnergia, montoEnergia];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cuentas_p_s_desocupados';
  @override
  VerificationContext validateIntegrity(
      Insertable<CuentasPSDesocupado> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('c_vivienda')) {
      context.handle(_cViviendaMeta,
          cVivienda.isAcceptableOrUnknown(data['c_vivienda']!, _cViviendaMeta));
    } else if (isInserting) {
      context.missing(_cViviendaMeta);
    }
    if (data.containsKey('c_proveedor_agua')) {
      context.handle(
          _cProveedorAguaMeta,
          cProveedorAgua.isAcceptableOrUnknown(
              data['c_proveedor_agua']!, _cProveedorAguaMeta));
    } else if (isInserting) {
      context.missing(_cProveedorAguaMeta);
    }
    if (data.containsKey('monto_agua')) {
      context.handle(_montoAguaMeta,
          montoAgua.isAcceptableOrUnknown(data['monto_agua']!, _montoAguaMeta));
    } else if (isInserting) {
      context.missing(_montoAguaMeta);
    }
    if (data.containsKey('c_proveedor_energia')) {
      context.handle(
          _cProveedorEnergiaMeta,
          cProveedorEnergia.isAcceptableOrUnknown(
              data['c_proveedor_energia']!, _cProveedorEnergiaMeta));
    } else if (isInserting) {
      context.missing(_cProveedorEnergiaMeta);
    }
    if (data.containsKey('monto_energia')) {
      context.handle(
          _montoEnergiaMeta,
          montoEnergia.isAcceptableOrUnknown(
              data['monto_energia']!, _montoEnergiaMeta));
    } else if (isInserting) {
      context.missing(_montoEnergiaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CuentasPSDesocupado map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CuentasPSDesocupado(
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
      cProveedorAgua: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}c_proveedor_agua'])!,
      montoAgua: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}monto_agua'])!,
      cProveedorEnergia: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}c_proveedor_energia'])!,
      montoEnergia: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}monto_energia'])!,
    );
  }

  @override
  $CuentasPSDesocupadosTable createAlias(String alias) {
    return $CuentasPSDesocupadosTable(attachedDatabase, alias);
  }
}

class CuentasPSDesocupado extends DataClass
    implements Insertable<CuentasPSDesocupado> {
  final String cVivienda;
  final String cProveedorAgua;
  final double montoAgua;
  final String cProveedorEnergia;
  final double montoEnergia;
  const CuentasPSDesocupado(
      {required this.cVivienda,
      required this.cProveedorAgua,
      required this.montoAgua,
      required this.cProveedorEnergia,
      required this.montoEnergia});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['c_vivienda'] = Variable<String>(cVivienda);
    map['c_proveedor_agua'] = Variable<String>(cProveedorAgua);
    map['monto_agua'] = Variable<double>(montoAgua);
    map['c_proveedor_energia'] = Variable<String>(cProveedorEnergia);
    map['monto_energia'] = Variable<double>(montoEnergia);
    return map;
  }

  CuentasPSDesocupadosCompanion toCompanion(bool nullToAbsent) {
    return CuentasPSDesocupadosCompanion(
      cVivienda: Value(cVivienda),
      cProveedorAgua: Value(cProveedorAgua),
      montoAgua: Value(montoAgua),
      cProveedorEnergia: Value(cProveedorEnergia),
      montoEnergia: Value(montoEnergia),
    );
  }

  factory CuentasPSDesocupado.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CuentasPSDesocupado(
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
      cProveedorAgua: serializer.fromJson<String>(json['cProveedorAgua']),
      montoAgua: serializer.fromJson<double>(json['montoAgua']),
      cProveedorEnergia: serializer.fromJson<String>(json['cProveedorEnergia']),
      montoEnergia: serializer.fromJson<double>(json['montoEnergia']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cVivienda': serializer.toJson<String>(cVivienda),
      'cProveedorAgua': serializer.toJson<String>(cProveedorAgua),
      'montoAgua': serializer.toJson<double>(montoAgua),
      'cProveedorEnergia': serializer.toJson<String>(cProveedorEnergia),
      'montoEnergia': serializer.toJson<double>(montoEnergia),
    };
  }

  CuentasPSDesocupado copyWith(
          {String? cVivienda,
          String? cProveedorAgua,
          double? montoAgua,
          String? cProveedorEnergia,
          double? montoEnergia}) =>
      CuentasPSDesocupado(
        cVivienda: cVivienda ?? this.cVivienda,
        cProveedorAgua: cProveedorAgua ?? this.cProveedorAgua,
        montoAgua: montoAgua ?? this.montoAgua,
        cProveedorEnergia: cProveedorEnergia ?? this.cProveedorEnergia,
        montoEnergia: montoEnergia ?? this.montoEnergia,
      );
  @override
  String toString() {
    return (StringBuffer('CuentasPSDesocupado(')
          ..write('cVivienda: $cVivienda, ')
          ..write('cProveedorAgua: $cProveedorAgua, ')
          ..write('montoAgua: $montoAgua, ')
          ..write('cProveedorEnergia: $cProveedorEnergia, ')
          ..write('montoEnergia: $montoEnergia')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      cVivienda, cProveedorAgua, montoAgua, cProveedorEnergia, montoEnergia);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CuentasPSDesocupado &&
          other.cVivienda == this.cVivienda &&
          other.cProveedorAgua == this.cProveedorAgua &&
          other.montoAgua == this.montoAgua &&
          other.cProveedorEnergia == this.cProveedorEnergia &&
          other.montoEnergia == this.montoEnergia);
}

class CuentasPSDesocupadosCompanion
    extends UpdateCompanion<CuentasPSDesocupado> {
  final Value<String> cVivienda;
  final Value<String> cProveedorAgua;
  final Value<double> montoAgua;
  final Value<String> cProveedorEnergia;
  final Value<double> montoEnergia;
  final Value<int> rowid;
  const CuentasPSDesocupadosCompanion({
    this.cVivienda = const Value.absent(),
    this.cProveedorAgua = const Value.absent(),
    this.montoAgua = const Value.absent(),
    this.cProveedorEnergia = const Value.absent(),
    this.montoEnergia = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CuentasPSDesocupadosCompanion.insert({
    required String cVivienda,
    required String cProveedorAgua,
    required double montoAgua,
    required String cProveedorEnergia,
    required double montoEnergia,
    this.rowid = const Value.absent(),
  })  : cVivienda = Value(cVivienda),
        cProveedorAgua = Value(cProveedorAgua),
        montoAgua = Value(montoAgua),
        cProveedorEnergia = Value(cProveedorEnergia),
        montoEnergia = Value(montoEnergia);
  static Insertable<CuentasPSDesocupado> custom({
    Expression<String>? cVivienda,
    Expression<String>? cProveedorAgua,
    Expression<double>? montoAgua,
    Expression<String>? cProveedorEnergia,
    Expression<double>? montoEnergia,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cVivienda != null) 'c_vivienda': cVivienda,
      if (cProveedorAgua != null) 'c_proveedor_agua': cProveedorAgua,
      if (montoAgua != null) 'monto_agua': montoAgua,
      if (cProveedorEnergia != null) 'c_proveedor_energia': cProveedorEnergia,
      if (montoEnergia != null) 'monto_energia': montoEnergia,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CuentasPSDesocupadosCompanion copyWith(
      {Value<String>? cVivienda,
      Value<String>? cProveedorAgua,
      Value<double>? montoAgua,
      Value<String>? cProveedorEnergia,
      Value<double>? montoEnergia,
      Value<int>? rowid}) {
    return CuentasPSDesocupadosCompanion(
      cVivienda: cVivienda ?? this.cVivienda,
      cProveedorAgua: cProveedorAgua ?? this.cProveedorAgua,
      montoAgua: montoAgua ?? this.montoAgua,
      cProveedorEnergia: cProveedorEnergia ?? this.cProveedorEnergia,
      montoEnergia: montoEnergia ?? this.montoEnergia,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cVivienda.present) {
      map['c_vivienda'] = Variable<String>(cVivienda.value);
    }
    if (cProveedorAgua.present) {
      map['c_proveedor_agua'] = Variable<String>(cProveedorAgua.value);
    }
    if (montoAgua.present) {
      map['monto_agua'] = Variable<double>(montoAgua.value);
    }
    if (cProveedorEnergia.present) {
      map['c_proveedor_energia'] = Variable<String>(cProveedorEnergia.value);
    }
    if (montoEnergia.present) {
      map['monto_energia'] = Variable<double>(montoEnergia.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CuentasPSDesocupadosCompanion(')
          ..write('cVivienda: $cVivienda, ')
          ..write('cProveedorAgua: $cProveedorAgua, ')
          ..write('montoAgua: $montoAgua, ')
          ..write('cProveedorEnergia: $cProveedorEnergia, ')
          ..write('montoEnergia: $montoEnergia, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FacturaDanosTable extends FacturaDanos
    with TableInfo<$FacturaDanosTable, FacturaDano> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FacturaDanosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _facturaIdMeta =
      const VerificationMeta('facturaId');
  @override
  late final GeneratedColumn<int> facturaId = GeneratedColumn<int>(
      'factura_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _cViviendaMeta =
      const VerificationMeta('cVivienda');
  @override
  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES vivienda_ubicacion (codigo_vivienda)'));
  static const VerificationMeta _idArrendatarioMeta =
      const VerificationMeta('idArrendatario');
  @override
  late final GeneratedColumn<String> idArrendatario = GeneratedColumn<String>(
      'id_arrendatario', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES arrendatarios (identidad)'));
  static const VerificationMeta _motivoFacturaMeta =
      const VerificationMeta('motivoFactura');
  @override
  late final GeneratedColumn<String> motivoFactura = GeneratedColumn<String>(
      'motivo_factura', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _montoDanoMeta =
      const VerificationMeta('montoDano');
  @override
  late final GeneratedColumn<double> montoDano = GeneratedColumn<double>(
      'monto_dano', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [facturaId, cVivienda, idArrendatario, motivoFactura, montoDano, desc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'factura_danos';
  @override
  VerificationContext validateIntegrity(Insertable<FacturaDano> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('factura_id')) {
      context.handle(_facturaIdMeta,
          facturaId.isAcceptableOrUnknown(data['factura_id']!, _facturaIdMeta));
    }
    if (data.containsKey('c_vivienda')) {
      context.handle(_cViviendaMeta,
          cVivienda.isAcceptableOrUnknown(data['c_vivienda']!, _cViviendaMeta));
    } else if (isInserting) {
      context.missing(_cViviendaMeta);
    }
    if (data.containsKey('id_arrendatario')) {
      context.handle(
          _idArrendatarioMeta,
          idArrendatario.isAcceptableOrUnknown(
              data['id_arrendatario']!, _idArrendatarioMeta));
    } else if (isInserting) {
      context.missing(_idArrendatarioMeta);
    }
    if (data.containsKey('motivo_factura')) {
      context.handle(
          _motivoFacturaMeta,
          motivoFactura.isAcceptableOrUnknown(
              data['motivo_factura']!, _motivoFacturaMeta));
    } else if (isInserting) {
      context.missing(_motivoFacturaMeta);
    }
    if (data.containsKey('monto_dano')) {
      context.handle(_montoDanoMeta,
          montoDano.isAcceptableOrUnknown(data['monto_dano']!, _montoDanoMeta));
    } else if (isInserting) {
      context.missing(_montoDanoMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {facturaId};
  @override
  FacturaDano map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FacturaDano(
      facturaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}factura_id'])!,
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
      idArrendatario: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}id_arrendatario'])!,
      motivoFactura: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}motivo_factura'])!,
      montoDano: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}monto_dano'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc'])!,
    );
  }

  @override
  $FacturaDanosTable createAlias(String alias) {
    return $FacturaDanosTable(attachedDatabase, alias);
  }
}

class FacturaDano extends DataClass implements Insertable<FacturaDano> {
  final int facturaId;
  final String cVivienda;
  final String idArrendatario;
  final String motivoFactura;
  final double montoDano;
  final String desc;
  const FacturaDano(
      {required this.facturaId,
      required this.cVivienda,
      required this.idArrendatario,
      required this.motivoFactura,
      required this.montoDano,
      required this.desc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['factura_id'] = Variable<int>(facturaId);
    map['c_vivienda'] = Variable<String>(cVivienda);
    map['id_arrendatario'] = Variable<String>(idArrendatario);
    map['motivo_factura'] = Variable<String>(motivoFactura);
    map['monto_dano'] = Variable<double>(montoDano);
    map['desc'] = Variable<String>(desc);
    return map;
  }

  FacturaDanosCompanion toCompanion(bool nullToAbsent) {
    return FacturaDanosCompanion(
      facturaId: Value(facturaId),
      cVivienda: Value(cVivienda),
      idArrendatario: Value(idArrendatario),
      motivoFactura: Value(motivoFactura),
      montoDano: Value(montoDano),
      desc: Value(desc),
    );
  }

  factory FacturaDano.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FacturaDano(
      facturaId: serializer.fromJson<int>(json['facturaId']),
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
      idArrendatario: serializer.fromJson<String>(json['idArrendatario']),
      motivoFactura: serializer.fromJson<String>(json['motivoFactura']),
      montoDano: serializer.fromJson<double>(json['montoDano']),
      desc: serializer.fromJson<String>(json['desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'facturaId': serializer.toJson<int>(facturaId),
      'cVivienda': serializer.toJson<String>(cVivienda),
      'idArrendatario': serializer.toJson<String>(idArrendatario),
      'motivoFactura': serializer.toJson<String>(motivoFactura),
      'montoDano': serializer.toJson<double>(montoDano),
      'desc': serializer.toJson<String>(desc),
    };
  }

  FacturaDano copyWith(
          {int? facturaId,
          String? cVivienda,
          String? idArrendatario,
          String? motivoFactura,
          double? montoDano,
          String? desc}) =>
      FacturaDano(
        facturaId: facturaId ?? this.facturaId,
        cVivienda: cVivienda ?? this.cVivienda,
        idArrendatario: idArrendatario ?? this.idArrendatario,
        motivoFactura: motivoFactura ?? this.motivoFactura,
        montoDano: montoDano ?? this.montoDano,
        desc: desc ?? this.desc,
      );
  @override
  String toString() {
    return (StringBuffer('FacturaDano(')
          ..write('facturaId: $facturaId, ')
          ..write('cVivienda: $cVivienda, ')
          ..write('idArrendatario: $idArrendatario, ')
          ..write('motivoFactura: $motivoFactura, ')
          ..write('montoDano: $montoDano, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      facturaId, cVivienda, idArrendatario, motivoFactura, montoDano, desc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FacturaDano &&
          other.facturaId == this.facturaId &&
          other.cVivienda == this.cVivienda &&
          other.idArrendatario == this.idArrendatario &&
          other.motivoFactura == this.motivoFactura &&
          other.montoDano == this.montoDano &&
          other.desc == this.desc);
}

class FacturaDanosCompanion extends UpdateCompanion<FacturaDano> {
  final Value<int> facturaId;
  final Value<String> cVivienda;
  final Value<String> idArrendatario;
  final Value<String> motivoFactura;
  final Value<double> montoDano;
  final Value<String> desc;
  const FacturaDanosCompanion({
    this.facturaId = const Value.absent(),
    this.cVivienda = const Value.absent(),
    this.idArrendatario = const Value.absent(),
    this.motivoFactura = const Value.absent(),
    this.montoDano = const Value.absent(),
    this.desc = const Value.absent(),
  });
  FacturaDanosCompanion.insert({
    this.facturaId = const Value.absent(),
    required String cVivienda,
    required String idArrendatario,
    required String motivoFactura,
    required double montoDano,
    required String desc,
  })  : cVivienda = Value(cVivienda),
        idArrendatario = Value(idArrendatario),
        motivoFactura = Value(motivoFactura),
        montoDano = Value(montoDano),
        desc = Value(desc);
  static Insertable<FacturaDano> custom({
    Expression<int>? facturaId,
    Expression<String>? cVivienda,
    Expression<String>? idArrendatario,
    Expression<String>? motivoFactura,
    Expression<double>? montoDano,
    Expression<String>? desc,
  }) {
    return RawValuesInsertable({
      if (facturaId != null) 'factura_id': facturaId,
      if (cVivienda != null) 'c_vivienda': cVivienda,
      if (idArrendatario != null) 'id_arrendatario': idArrendatario,
      if (motivoFactura != null) 'motivo_factura': motivoFactura,
      if (montoDano != null) 'monto_dano': montoDano,
      if (desc != null) 'desc': desc,
    });
  }

  FacturaDanosCompanion copyWith(
      {Value<int>? facturaId,
      Value<String>? cVivienda,
      Value<String>? idArrendatario,
      Value<String>? motivoFactura,
      Value<double>? montoDano,
      Value<String>? desc}) {
    return FacturaDanosCompanion(
      facturaId: facturaId ?? this.facturaId,
      cVivienda: cVivienda ?? this.cVivienda,
      idArrendatario: idArrendatario ?? this.idArrendatario,
      motivoFactura: motivoFactura ?? this.motivoFactura,
      montoDano: montoDano ?? this.montoDano,
      desc: desc ?? this.desc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (facturaId.present) {
      map['factura_id'] = Variable<int>(facturaId.value);
    }
    if (cVivienda.present) {
      map['c_vivienda'] = Variable<String>(cVivienda.value);
    }
    if (idArrendatario.present) {
      map['id_arrendatario'] = Variable<String>(idArrendatario.value);
    }
    if (motivoFactura.present) {
      map['motivo_factura'] = Variable<String>(motivoFactura.value);
    }
    if (montoDano.present) {
      map['monto_dano'] = Variable<double>(montoDano.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FacturaDanosCompanion(')
          ..write('facturaId: $facturaId, ')
          ..write('cVivienda: $cVivienda, ')
          ..write('idArrendatario: $idArrendatario, ')
          ..write('motivoFactura: $motivoFactura, ')
          ..write('montoDano: $montoDano, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }
}

class vArrendatariosActuale extends DataClass {
  final String identidad;
  final String nombre;
  final String cVivienda;
  final DateTime fechaEntrada;
  final double precioRenta;
  final String? obs;
  const vArrendatariosActuale(
      {required this.identidad,
      required this.nombre,
      required this.cVivienda,
      required this.fechaEntrada,
      required this.precioRenta,
      this.obs});
  factory vArrendatariosActuale.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return vArrendatariosActuale(
      identidad: serializer.fromJson<String>(json['identidad']),
      nombre: serializer.fromJson<String>(json['nombre']),
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
      fechaEntrada: serializer.fromJson<DateTime>(json['fechaEntrada']),
      precioRenta: serializer.fromJson<double>(json['precioRenta']),
      obs: serializer.fromJson<String?>(json['obs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'identidad': serializer.toJson<String>(identidad),
      'nombre': serializer.toJson<String>(nombre),
      'cVivienda': serializer.toJson<String>(cVivienda),
      'fechaEntrada': serializer.toJson<DateTime>(fechaEntrada),
      'precioRenta': serializer.toJson<double>(precioRenta),
      'obs': serializer.toJson<String?>(obs),
    };
  }

  vArrendatariosActuale copyWith(
          {String? identidad,
          String? nombre,
          String? cVivienda,
          DateTime? fechaEntrada,
          double? precioRenta,
          Value<String?> obs = const Value.absent()}) =>
      vArrendatariosActuale(
        identidad: identidad ?? this.identidad,
        nombre: nombre ?? this.nombre,
        cVivienda: cVivienda ?? this.cVivienda,
        fechaEntrada: fechaEntrada ?? this.fechaEntrada,
        precioRenta: precioRenta ?? this.precioRenta,
        obs: obs.present ? obs.value : this.obs,
      );
  @override
  String toString() {
    return (StringBuffer('vArrendatariosActuale(')
          ..write('identidad: $identidad, ')
          ..write('nombre: $nombre, ')
          ..write('cVivienda: $cVivienda, ')
          ..write('fechaEntrada: $fechaEntrada, ')
          ..write('precioRenta: $precioRenta, ')
          ..write('obs: $obs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(identidad, nombre, cVivienda, fechaEntrada, precioRenta, obs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is vArrendatariosActuale &&
          other.identidad == this.identidad &&
          other.nombre == this.nombre &&
          other.cVivienda == this.cVivienda &&
          other.fechaEntrada == this.fechaEntrada &&
          other.precioRenta == this.precioRenta &&
          other.obs == this.obs);
}

class $vArrendatariosActualesView
    extends ViewInfo<$vArrendatariosActualesView, vArrendatariosActuale>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDb attachedDatabase;
  $vArrendatariosActualesView(this.attachedDatabase, [this._alias]);
  $ArrendatariosTable get arrendatarios =>
      attachedDatabase.arrendatarios.createAlias('t0');
  $ActualArrendatariosTable get actualarrendatarios =>
      attachedDatabase.actualArrendatarios.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns =>
      [identidad, nombre, cVivienda, fechaEntrada, precioRenta, obs];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'v_arrendatarios_actuales';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $vArrendatariosActualesView get asDslTable => this;
  @override
  vArrendatariosActuale map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return vArrendatariosActuale(
      identidad: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identidad'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
      fechaEntrada: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_entrada'])!,
      precioRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}precio_renta'])!,
      obs: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}obs']),
    );
  }

  late final GeneratedColumn<String> identidad = GeneratedColumn<String>(
      'identidad', aliasedName, false,
      generatedAs: GeneratedAs(arrendatarios.identidad, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      generatedAs: GeneratedAs(arrendatarios.nombre, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      generatedAs: GeneratedAs(actualarrendatarios.cVivienda, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> fechaEntrada = GeneratedColumn<DateTime>(
      'fecha_entrada', aliasedName, false,
      generatedAs: GeneratedAs(actualarrendatarios.fechaEntrada, false),
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<double> precioRenta = GeneratedColumn<double>(
      'precio_renta', aliasedName, false,
      generatedAs: GeneratedAs(actualarrendatarios.precioRenta, false),
      type: DriftSqlType.double);
  late final GeneratedColumn<String> obs = GeneratedColumn<String>(
      'obs', aliasedName, true,
      generatedAs: GeneratedAs(actualarrendatarios.obs, false),
      type: DriftSqlType.string);
  @override
  $vArrendatariosActualesView createAlias(String alias) {
    return $vArrendatariosActualesView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(arrendatarios)..addColumns($columns)).join([
        innerJoin(
            actualarrendatarios,
            actualarrendatarios.idArrendatario
                .equalsExp(arrendatarios.identidad))
      ]);
  @override
  Set<String> get readTables => const {'arrendatarios', 'actual_arrendatarios'};
}

class vArrendatariosHistorialData extends DataClass {
  final String identidad;
  final String nombre;
  final String cVivienda;
  final DateTime fechaEntrada;
  final DateTime fechaSalida;
  final double precioRenta;
  final String? obs;
  const vArrendatariosHistorialData(
      {required this.identidad,
      required this.nombre,
      required this.cVivienda,
      required this.fechaEntrada,
      required this.fechaSalida,
      required this.precioRenta,
      this.obs});
  factory vArrendatariosHistorialData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return vArrendatariosHistorialData(
      identidad: serializer.fromJson<String>(json['identidad']),
      nombre: serializer.fromJson<String>(json['nombre']),
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
      fechaEntrada: serializer.fromJson<DateTime>(json['fechaEntrada']),
      fechaSalida: serializer.fromJson<DateTime>(json['fechaSalida']),
      precioRenta: serializer.fromJson<double>(json['precioRenta']),
      obs: serializer.fromJson<String?>(json['obs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'identidad': serializer.toJson<String>(identidad),
      'nombre': serializer.toJson<String>(nombre),
      'cVivienda': serializer.toJson<String>(cVivienda),
      'fechaEntrada': serializer.toJson<DateTime>(fechaEntrada),
      'fechaSalida': serializer.toJson<DateTime>(fechaSalida),
      'precioRenta': serializer.toJson<double>(precioRenta),
      'obs': serializer.toJson<String?>(obs),
    };
  }

  vArrendatariosHistorialData copyWith(
          {String? identidad,
          String? nombre,
          String? cVivienda,
          DateTime? fechaEntrada,
          DateTime? fechaSalida,
          double? precioRenta,
          Value<String?> obs = const Value.absent()}) =>
      vArrendatariosHistorialData(
        identidad: identidad ?? this.identidad,
        nombre: nombre ?? this.nombre,
        cVivienda: cVivienda ?? this.cVivienda,
        fechaEntrada: fechaEntrada ?? this.fechaEntrada,
        fechaSalida: fechaSalida ?? this.fechaSalida,
        precioRenta: precioRenta ?? this.precioRenta,
        obs: obs.present ? obs.value : this.obs,
      );
  @override
  String toString() {
    return (StringBuffer('vArrendatariosHistorialData(')
          ..write('identidad: $identidad, ')
          ..write('nombre: $nombre, ')
          ..write('cVivienda: $cVivienda, ')
          ..write('fechaEntrada: $fechaEntrada, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('precioRenta: $precioRenta, ')
          ..write('obs: $obs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(identidad, nombre, cVivienda, fechaEntrada,
      fechaSalida, precioRenta, obs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is vArrendatariosHistorialData &&
          other.identidad == this.identidad &&
          other.nombre == this.nombre &&
          other.cVivienda == this.cVivienda &&
          other.fechaEntrada == this.fechaEntrada &&
          other.fechaSalida == this.fechaSalida &&
          other.precioRenta == this.precioRenta &&
          other.obs == this.obs);
}

class $vArrendatariosHistorialView
    extends ViewInfo<$vArrendatariosHistorialView, vArrendatariosHistorialData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDb attachedDatabase;
  $vArrendatariosHistorialView(this.attachedDatabase, [this._alias]);
  $ArrendatariosTable get arrendatarios =>
      attachedDatabase.arrendatarios.createAlias('t0');
  $HistorialArrendatariosTable get historialarrendatarios =>
      attachedDatabase.historialArrendatarios.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns => [
        identidad,
        nombre,
        cVivienda,
        fechaEntrada,
        fechaSalida,
        precioRenta,
        obs
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'v_arrendatarios_historial';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $vArrendatariosHistorialView get asDslTable => this;
  @override
  vArrendatariosHistorialData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return vArrendatariosHistorialData(
      identidad: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identidad'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
      fechaEntrada: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_entrada'])!,
      fechaSalida: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_salida'])!,
      precioRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}precio_renta'])!,
      obs: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}obs']),
    );
  }

  late final GeneratedColumn<String> identidad = GeneratedColumn<String>(
      'identidad', aliasedName, false,
      generatedAs: GeneratedAs(arrendatarios.identidad, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      generatedAs: GeneratedAs(arrendatarios.nombre, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      generatedAs: GeneratedAs(historialarrendatarios.cVivienda, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<DateTime> fechaEntrada = GeneratedColumn<DateTime>(
      'fecha_entrada', aliasedName, false,
      generatedAs: GeneratedAs(historialarrendatarios.fechaEntrada, false),
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<DateTime> fechaSalida = GeneratedColumn<DateTime>(
      'fecha_salida', aliasedName, false,
      generatedAs: GeneratedAs(historialarrendatarios.fechaSalida, false),
      type: DriftSqlType.dateTime);
  late final GeneratedColumn<double> precioRenta = GeneratedColumn<double>(
      'precio_renta', aliasedName, false,
      generatedAs: GeneratedAs(historialarrendatarios.precioRenta, false),
      type: DriftSqlType.double);
  late final GeneratedColumn<String> obs = GeneratedColumn<String>(
      'obs', aliasedName, true,
      generatedAs: GeneratedAs(historialarrendatarios.obs, false),
      type: DriftSqlType.string);
  @override
  $vArrendatariosHistorialView createAlias(String alias) {
    return $vArrendatariosHistorialView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(arrendatarios)..addColumns($columns)).join([
        innerJoin(
            historialarrendatarios,
            historialarrendatarios.idArrendatario
                .equalsExp(arrendatarios.identidad))
      ]);
  @override
  Set<String> get readTables =>
      const {'arrendatarios', 'historial_arrendatarios'};
}

class vViviendaDetalleData extends DataClass {
  final String codigoVivienda;
  final String ubicacion;
  final String identidad;
  final String nombre;
  const vViviendaDetalleData(
      {required this.codigoVivienda,
      required this.ubicacion,
      required this.identidad,
      required this.nombre});
  factory vViviendaDetalleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return vViviendaDetalleData(
      codigoVivienda: serializer.fromJson<String>(json['codigoVivienda']),
      ubicacion: serializer.fromJson<String>(json['ubicacion']),
      identidad: serializer.fromJson<String>(json['identidad']),
      nombre: serializer.fromJson<String>(json['nombre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codigoVivienda': serializer.toJson<String>(codigoVivienda),
      'ubicacion': serializer.toJson<String>(ubicacion),
      'identidad': serializer.toJson<String>(identidad),
      'nombre': serializer.toJson<String>(nombre),
    };
  }

  vViviendaDetalleData copyWith(
          {String? codigoVivienda,
          String? ubicacion,
          String? identidad,
          String? nombre}) =>
      vViviendaDetalleData(
        codigoVivienda: codigoVivienda ?? this.codigoVivienda,
        ubicacion: ubicacion ?? this.ubicacion,
        identidad: identidad ?? this.identidad,
        nombre: nombre ?? this.nombre,
      );
  @override
  String toString() {
    return (StringBuffer('vViviendaDetalleData(')
          ..write('codigoVivienda: $codigoVivienda, ')
          ..write('ubicacion: $ubicacion, ')
          ..write('identidad: $identidad, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codigoVivienda, ubicacion, identidad, nombre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is vViviendaDetalleData &&
          other.codigoVivienda == this.codigoVivienda &&
          other.ubicacion == this.ubicacion &&
          other.identidad == this.identidad &&
          other.nombre == this.nombre);
}

class $vViviendaDetalleView
    extends ViewInfo<$vViviendaDetalleView, vViviendaDetalleData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDb attachedDatabase;
  $vViviendaDetalleView(this.attachedDatabase, [this._alias]);
  $ViviendaUbicacionTable get viviendaubicacion =>
      attachedDatabase.viviendaUbicacion.createAlias('t0');
  $ArrendatariosTable get arrendatarios =>
      attachedDatabase.arrendatarios.createAlias('t1');
  $ActualArrendatariosTable get actualarrendatarios =>
      attachedDatabase.actualArrendatarios.createAlias('t2');
  @override
  List<GeneratedColumn> get $columns =>
      [codigoVivienda, ubicacion, identidad, nombre];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'v_vivienda_detalle';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $vViviendaDetalleView get asDslTable => this;
  @override
  vViviendaDetalleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return vViviendaDetalleData(
      codigoVivienda: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}codigo_vivienda'])!,
      ubicacion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ubicacion'])!,
      identidad: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identidad'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
    );
  }

  late final GeneratedColumn<String> codigoVivienda = GeneratedColumn<String>(
      'codigo_vivienda', aliasedName, false,
      generatedAs: GeneratedAs(viviendaubicacion.codigoVivienda, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> ubicacion = GeneratedColumn<String>(
      'ubicacion', aliasedName, false,
      generatedAs: GeneratedAs(viviendaubicacion.ubicacion, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> identidad = GeneratedColumn<String>(
      'identidad', aliasedName, false,
      generatedAs: GeneratedAs(arrendatarios.identidad, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      generatedAs: GeneratedAs(arrendatarios.nombre, false),
      type: DriftSqlType.string);
  @override
  $vViviendaDetalleView createAlias(String alias) {
    return $vViviendaDetalleView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(viviendaubicacion)..addColumns($columns))
          .join([
        innerJoin(
            actualarrendatarios,
            actualarrendatarios.cVivienda
                .equalsExp(viviendaubicacion.codigoVivienda))
      ]).join([
        innerJoin(
            arrendatarios,
            arrendatarios.identidad
                .equalsExp(actualarrendatarios.idArrendatario))
      ]);
  @override
  Set<String> get readTables =>
      const {'vivienda_ubicacion', 'arrendatarios', 'actual_arrendatarios'};
}

class vViviendasConArrendatario extends DataClass {
  final String cVivienda;
  final String ubicacion;
  const vViviendasConArrendatario(
      {required this.cVivienda, required this.ubicacion});
  factory vViviendasConArrendatario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return vViviendasConArrendatario(
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
      ubicacion: serializer.fromJson<String>(json['ubicacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cVivienda': serializer.toJson<String>(cVivienda),
      'ubicacion': serializer.toJson<String>(ubicacion),
    };
  }

  vViviendasConArrendatario copyWith({String? cVivienda, String? ubicacion}) =>
      vViviendasConArrendatario(
        cVivienda: cVivienda ?? this.cVivienda,
        ubicacion: ubicacion ?? this.ubicacion,
      );
  @override
  String toString() {
    return (StringBuffer('vViviendasConArrendatario(')
          ..write('cVivienda: $cVivienda, ')
          ..write('ubicacion: $ubicacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cVivienda, ubicacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is vViviendasConArrendatario &&
          other.cVivienda == this.cVivienda &&
          other.ubicacion == this.ubicacion);
}

class $vViviendasConArrendatariosView
    extends ViewInfo<$vViviendasConArrendatariosView, vViviendasConArrendatario>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDb attachedDatabase;
  $vViviendasConArrendatariosView(this.attachedDatabase, [this._alias]);
  $ViviendaUbicacionTable get viviendaubicacion =>
      attachedDatabase.viviendaUbicacion.createAlias('t0');
  $ActualArrendatariosTable get actualarrendatarios =>
      attachedDatabase.actualArrendatarios.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns => [cVivienda, ubicacion];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'v_viviendas_con_arrendatarios';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $vViviendasConArrendatariosView get asDslTable => this;
  @override
  vViviendasConArrendatario map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return vViviendasConArrendatario(
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
      ubicacion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ubicacion'])!,
    );
  }

  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      generatedAs: GeneratedAs(actualarrendatarios.cVivienda, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> ubicacion = GeneratedColumn<String>(
      'ubicacion', aliasedName, false,
      generatedAs: GeneratedAs(viviendaubicacion.ubicacion, false),
      type: DriftSqlType.string);
  @override
  $vViviendasConArrendatariosView createAlias(String alias) {
    return $vViviendasConArrendatariosView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(actualarrendatarios)..addColumns($columns))
          .join([
        innerJoin(
            viviendaubicacion,
            viviendaubicacion.codigoVivienda
                .equalsExp(actualarrendatarios.cVivienda))
      ]);
  @override
  Set<String> get readTables =>
      const {'vivienda_ubicacion', 'actual_arrendatarios'};
}

class vFacturaDanoConArrendatario extends DataClass {
  final String cVivienda;
  final String identidad;
  final String nombre;
  final String motivoFactura;
  final double montoDano;
  final String desc;
  const vFacturaDanoConArrendatario(
      {required this.cVivienda,
      required this.identidad,
      required this.nombre,
      required this.motivoFactura,
      required this.montoDano,
      required this.desc});
  factory vFacturaDanoConArrendatario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return vFacturaDanoConArrendatario(
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
      identidad: serializer.fromJson<String>(json['identidad']),
      nombre: serializer.fromJson<String>(json['nombre']),
      motivoFactura: serializer.fromJson<String>(json['motivoFactura']),
      montoDano: serializer.fromJson<double>(json['montoDano']),
      desc: serializer.fromJson<String>(json['desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cVivienda': serializer.toJson<String>(cVivienda),
      'identidad': serializer.toJson<String>(identidad),
      'nombre': serializer.toJson<String>(nombre),
      'motivoFactura': serializer.toJson<String>(motivoFactura),
      'montoDano': serializer.toJson<double>(montoDano),
      'desc': serializer.toJson<String>(desc),
    };
  }

  vFacturaDanoConArrendatario copyWith(
          {String? cVivienda,
          String? identidad,
          String? nombre,
          String? motivoFactura,
          double? montoDano,
          String? desc}) =>
      vFacturaDanoConArrendatario(
        cVivienda: cVivienda ?? this.cVivienda,
        identidad: identidad ?? this.identidad,
        nombre: nombre ?? this.nombre,
        motivoFactura: motivoFactura ?? this.motivoFactura,
        montoDano: montoDano ?? this.montoDano,
        desc: desc ?? this.desc,
      );
  @override
  String toString() {
    return (StringBuffer('vFacturaDanoConArrendatario(')
          ..write('cVivienda: $cVivienda, ')
          ..write('identidad: $identidad, ')
          ..write('nombre: $nombre, ')
          ..write('motivoFactura: $motivoFactura, ')
          ..write('montoDano: $montoDano, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(cVivienda, identidad, nombre, motivoFactura, montoDano, desc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is vFacturaDanoConArrendatario &&
          other.cVivienda == this.cVivienda &&
          other.identidad == this.identidad &&
          other.nombre == this.nombre &&
          other.motivoFactura == this.motivoFactura &&
          other.montoDano == this.montoDano &&
          other.desc == this.desc);
}

class $vFacturaDanoConArrendatariosView extends ViewInfo<
    $vFacturaDanoConArrendatariosView,
    vFacturaDanoConArrendatario> implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDb attachedDatabase;
  $vFacturaDanoConArrendatariosView(this.attachedDatabase, [this._alias]);
  $FacturaDanosTable get facturadanos =>
      attachedDatabase.facturaDanos.createAlias('t0');
  $ArrendatariosTable get arrendatarios =>
      attachedDatabase.arrendatarios.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns =>
      [cVivienda, identidad, nombre, motivoFactura, montoDano, desc];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'v_factura_dano_con_arrendatarios';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $vFacturaDanoConArrendatariosView get asDslTable => this;
  @override
  vFacturaDanoConArrendatario map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return vFacturaDanoConArrendatario(
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
      identidad: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identidad'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      motivoFactura: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}motivo_factura'])!,
      montoDano: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}monto_dano'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc'])!,
    );
  }

  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      generatedAs: GeneratedAs(facturadanos.cVivienda, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> identidad = GeneratedColumn<String>(
      'identidad', aliasedName, false,
      generatedAs: GeneratedAs(arrendatarios.identidad, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      generatedAs: GeneratedAs(arrendatarios.nombre, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> motivoFactura = GeneratedColumn<String>(
      'motivo_factura', aliasedName, false,
      generatedAs: GeneratedAs(facturadanos.motivoFactura, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<double> montoDano = GeneratedColumn<double>(
      'monto_dano', aliasedName, false,
      generatedAs: GeneratedAs(facturadanos.montoDano, false),
      type: DriftSqlType.double);
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, false,
      generatedAs: GeneratedAs(facturadanos.desc, false),
      type: DriftSqlType.string);
  @override
  $vFacturaDanoConArrendatariosView createAlias(String alias) {
    return $vFacturaDanoConArrendatariosView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(arrendatarios)..addColumns($columns)).join([
        innerJoin(facturadanos,
            facturadanos.idArrendatario.equalsExp(arrendatarios.identidad))
      ]);
  @override
  Set<String> get readTables => const {'factura_danos', 'arrendatarios'};
}

class vEstadoCuentaConArrendatario extends DataClass {
  final int estadoId;
  final String identidad;
  final String nombre;
  final double pagoRenta;
  final double moraRenta;
  final double deudaElectricidad;
  final double deudaAgua;
  final DateTime fechaPago;
  const vEstadoCuentaConArrendatario(
      {required this.estadoId,
      required this.identidad,
      required this.nombre,
      required this.pagoRenta,
      required this.moraRenta,
      required this.deudaElectricidad,
      required this.deudaAgua,
      required this.fechaPago});
  factory vEstadoCuentaConArrendatario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return vEstadoCuentaConArrendatario(
      estadoId: serializer.fromJson<int>(json['estadoId']),
      identidad: serializer.fromJson<String>(json['identidad']),
      nombre: serializer.fromJson<String>(json['nombre']),
      pagoRenta: serializer.fromJson<double>(json['pagoRenta']),
      moraRenta: serializer.fromJson<double>(json['moraRenta']),
      deudaElectricidad: serializer.fromJson<double>(json['deudaElectricidad']),
      deudaAgua: serializer.fromJson<double>(json['deudaAgua']),
      fechaPago: serializer.fromJson<DateTime>(json['fechaPago']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'estadoId': serializer.toJson<int>(estadoId),
      'identidad': serializer.toJson<String>(identidad),
      'nombre': serializer.toJson<String>(nombre),
      'pagoRenta': serializer.toJson<double>(pagoRenta),
      'moraRenta': serializer.toJson<double>(moraRenta),
      'deudaElectricidad': serializer.toJson<double>(deudaElectricidad),
      'deudaAgua': serializer.toJson<double>(deudaAgua),
      'fechaPago': serializer.toJson<DateTime>(fechaPago),
    };
  }

  vEstadoCuentaConArrendatario copyWith(
          {int? estadoId,
          String? identidad,
          String? nombre,
          double? pagoRenta,
          double? moraRenta,
          double? deudaElectricidad,
          double? deudaAgua,
          DateTime? fechaPago}) =>
      vEstadoCuentaConArrendatario(
        estadoId: estadoId ?? this.estadoId,
        identidad: identidad ?? this.identidad,
        nombre: nombre ?? this.nombre,
        pagoRenta: pagoRenta ?? this.pagoRenta,
        moraRenta: moraRenta ?? this.moraRenta,
        deudaElectricidad: deudaElectricidad ?? this.deudaElectricidad,
        deudaAgua: deudaAgua ?? this.deudaAgua,
        fechaPago: fechaPago ?? this.fechaPago,
      );
  @override
  String toString() {
    return (StringBuffer('vEstadoCuentaConArrendatario(')
          ..write('estadoId: $estadoId, ')
          ..write('identidad: $identidad, ')
          ..write('nombre: $nombre, ')
          ..write('pagoRenta: $pagoRenta, ')
          ..write('moraRenta: $moraRenta, ')
          ..write('deudaElectricidad: $deudaElectricidad, ')
          ..write('deudaAgua: $deudaAgua, ')
          ..write('fechaPago: $fechaPago')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(estadoId, identidad, nombre, pagoRenta,
      moraRenta, deudaElectricidad, deudaAgua, fechaPago);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is vEstadoCuentaConArrendatario &&
          other.estadoId == this.estadoId &&
          other.identidad == this.identidad &&
          other.nombre == this.nombre &&
          other.pagoRenta == this.pagoRenta &&
          other.moraRenta == this.moraRenta &&
          other.deudaElectricidad == this.deudaElectricidad &&
          other.deudaAgua == this.deudaAgua &&
          other.fechaPago == this.fechaPago);
}

class $vEstadoCuentaConArrendatariosView extends ViewInfo<
    $vEstadoCuentaConArrendatariosView,
    vEstadoCuentaConArrendatario> implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDb attachedDatabase;
  $vEstadoCuentaConArrendatariosView(this.attachedDatabase, [this._alias]);
  $EstadoCuentasTable get estadocuentas =>
      attachedDatabase.estadoCuentas.createAlias('t0');
  $ArrendatariosTable get arrendatarios =>
      attachedDatabase.arrendatarios.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns => [
        estadoId,
        identidad,
        nombre,
        pagoRenta,
        moraRenta,
        deudaElectricidad,
        deudaAgua,
        fechaPago
      ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'v_estado_cuenta_con_arrendatarios';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $vEstadoCuentaConArrendatariosView get asDslTable => this;
  @override
  vEstadoCuentaConArrendatario map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return vEstadoCuentaConArrendatario(
      estadoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}estado_id'])!,
      identidad: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identidad'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      pagoRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}pago_renta'])!,
      moraRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}mora_renta'])!,
      deudaElectricidad: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}deuda_electricidad'])!,
      deudaAgua: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}deuda_agua'])!,
      fechaPago: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_pago'])!,
    );
  }

  late final GeneratedColumn<int> estadoId = GeneratedColumn<int>(
      'estado_id', aliasedName, false,
      generatedAs: GeneratedAs(estadocuentas.estadoId, false),
      type: DriftSqlType.int);
  late final GeneratedColumn<String> identidad = GeneratedColumn<String>(
      'identidad', aliasedName, false,
      generatedAs: GeneratedAs(arrendatarios.identidad, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      generatedAs: GeneratedAs(arrendatarios.nombre, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<double> pagoRenta = GeneratedColumn<double>(
      'pago_renta', aliasedName, false,
      generatedAs: GeneratedAs(estadocuentas.pagoRenta, false),
      type: DriftSqlType.double);
  late final GeneratedColumn<double> moraRenta = GeneratedColumn<double>(
      'mora_renta', aliasedName, false,
      generatedAs: GeneratedAs(estadocuentas.moraRenta, false),
      type: DriftSqlType.double);
  late final GeneratedColumn<double> deudaElectricidad =
      GeneratedColumn<double>('deuda_electricidad', aliasedName, false,
          generatedAs: GeneratedAs(estadocuentas.deudaElectricidad, false),
          type: DriftSqlType.double);
  late final GeneratedColumn<double> deudaAgua = GeneratedColumn<double>(
      'deuda_agua', aliasedName, false,
      generatedAs: GeneratedAs(estadocuentas.deudaAgua, false),
      type: DriftSqlType.double);
  late final GeneratedColumn<DateTime> fechaPago = GeneratedColumn<DateTime>(
      'fecha_pago', aliasedName, false,
      generatedAs: GeneratedAs(estadocuentas.fechaPago, false),
      type: DriftSqlType.dateTime);
  @override
  $vEstadoCuentaConArrendatariosView createAlias(String alias) {
    return $vEstadoCuentaConArrendatariosView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(estadocuentas)..addColumns($columns)).join([
        innerJoin(arrendatarios,
            arrendatarios.identidad.equalsExp(estadocuentas.idArrendatario))
      ]);
  @override
  Set<String> get readTables => const {'estado_cuentas', 'arrendatarios'};
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $ArrendatariosTable arrendatarios = $ArrendatariosTable(this);
  late final $ViviendaUbicacionTable viviendaUbicacion =
      $ViviendaUbicacionTable(this);
  late final $ActualArrendatariosTable actualArrendatarios =
      $ActualArrendatariosTable(this);
  late final $HistorialArrendatariosTable historialArrendatarios =
      $HistorialArrendatariosTable(this);
  late final $PagosPendientesTable pagosPendientes =
      $PagosPendientesTable(this);
  late final $EstadoCuentasTable estadoCuentas = $EstadoCuentasTable(this);
  late final $DanosPropiedadTable danosPropiedad = $DanosPropiedadTable(this);
  late final $ProveedoresServiciosTable proveedoresServicios =
      $ProveedoresServiciosTable(this);
  late final $CuentaProveedoresServiciosTable cuentaProveedoresServicios =
      $CuentaProveedoresServiciosTable(this);
  late final $CuentasPSDesocupadosTable cuentasPSDesocupados =
      $CuentasPSDesocupadosTable(this);
  late final $FacturaDanosTable facturaDanos = $FacturaDanosTable(this);
  late final $vArrendatariosActualesView vArrendatariosActuales =
      $vArrendatariosActualesView(this);
  late final $vArrendatariosHistorialView vArrendatariosHistorial =
      $vArrendatariosHistorialView(this);
  late final $vViviendaDetalleView vViviendaDetalle =
      $vViviendaDetalleView(this);
  late final $vViviendasConArrendatariosView vViviendasConArrendatarios =
      $vViviendasConArrendatariosView(this);
  late final $vFacturaDanoConArrendatariosView vFacturaDanoConArrendatarios =
      $vFacturaDanoConArrendatariosView(this);
  late final $vEstadoCuentaConArrendatariosView vEstadoCuentaConArrendatarios =
      $vEstadoCuentaConArrendatariosView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        arrendatarios,
        viviendaUbicacion,
        actualArrendatarios,
        historialArrendatarios,
        pagosPendientes,
        estadoCuentas,
        danosPropiedad,
        proveedoresServicios,
        cuentaProveedoresServicios,
        cuentasPSDesocupados,
        facturaDanos,
        vArrendatariosActuales,
        vArrendatariosHistorial,
        vViviendaDetalle,
        vViviendasConArrendatarios,
        vFacturaDanoConArrendatarios,
        vEstadoCuentaConArrendatarios
      ];
}
