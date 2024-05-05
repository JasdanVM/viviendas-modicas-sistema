import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import 'package:drift/drift.dart' as drift;

class RentersSearchResultScreen extends StatelessWidget {
  final String selectedValue;

  RentersSearchResultScreen({required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    final value = selectedValue.startsWith('#')? selectedValue.substring(1) : selectedValue;
    return Scaffold(
      appBar: CustomAppBar(title: 'Viviendas Módicas', back: true),
      drawer: CustomDrawer(isMainScreen: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Resultado de la Búsqueda',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/vm_icon.png',
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: selectedValue.startsWith('#')
                ? RentersSearchResultDTScreen(searchQuery: value,)
                  : RentersSearchResultDTScreenByName(searchQuery: value,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RentersSearchResultDTScreen extends StatefulWidget {
  final String searchQuery;

  RentersSearchResultDTScreen({Key? key, required this.searchQuery})
      : super(key: key);

  @override
  State<RentersSearchResultDTScreen> createState() =>
      _RentersCurrentDTScreenState();
}

class _RentersCurrentDTScreenState extends State<RentersSearchResultDTScreen> {
  late AppDb _db;
  late Future<vArrendatariosActuale?> arrendatarioDetalleFuture;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
    arrendatarioDetalleFuture = _loadData(widget.searchQuery);
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  Future<vArrendatariosActuale?> _loadData(String searchQuery) async {
    try {
      final arrendatario = await (_db.select(_db.vArrendatariosActuales)..where((tbl) => tbl.identidad.equals(searchQuery))).getSingle();
      return arrendatario;
    } catch (e) {
      print('Error loading data: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: arrendatarioDetalleFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _DataTable(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _DataTable(vArrendatariosActuale arrendatario) {
    return DataTable(
      columnSpacing: 30,
      headingRowColor: MaterialStateColor.resolveWith(
        (states) => Theme.of(context).primaryColor,
      ),
      headingRowHeight: 40,
      headingTextStyle: TextStyle(color: Colors.white),
      columns: [
        DataColumn(label: Text('Identidad')),
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Codigo Vivienda')),
        DataColumn(label: Text('Fecha de Entrada')),
        DataColumn(label: Text('Precio Renta')),
        DataColumn(label: Text('Observaciones')),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(Text(arrendatario.identidad.toString())),
            DataCell(Text(arrendatario.nombre.toString())),
            DataCell(Text(arrendatario.cVivienda.toString())),
            DataCell(Text(arrendatario.fechaEntrada.toString())),
            DataCell(Text(arrendatario.precioRenta.toString())),
            DataCell(Text(arrendatario.obs.toString())),
          ],
        ),
      ],
    );
  }
}

class RentersSearchResultDTScreenByName extends StatefulWidget {
  final String searchQuery;

  RentersSearchResultDTScreenByName({Key? key, required this.searchQuery})
      : super(key: key);

  @override
  State<RentersSearchResultDTScreenByName> createState() =>
      _RentersSearchResultDTScreenStateByName();
}

class _RentersSearchResultDTScreenStateByName extends State<RentersSearchResultDTScreenByName> {
  late AppDb _db;
  late Future<List<vArrendatariosActuale>> arrendatariosActualesFuture;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
    arrendatariosActualesFuture = _loadData(widget.searchQuery);
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  Future<List<vArrendatariosActuale>> _loadData(String searchQuery) async {
    try {
      final arrendatarios = await (_db.select(_db.vArrendatariosActuales)..where((tbl) => tbl.nombre.like('%${searchQuery}%'))).get();
      return arrendatarios;
    } catch (e) {
      print('Error loading data: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: FutureBuilder(
            future: arrendatariosActualesFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _DataTable(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _DataTable(List<vArrendatariosActuale> arrendatarios) {
    return DataTable(
      columnSpacing: 30,
      headingRowColor: MaterialStateColor.resolveWith(
        (states) => Theme.of(context).primaryColor,
      ),
      headingRowHeight: 40,
      headingTextStyle: TextStyle(color: Colors.white),
      columns: [
        DataColumn(label: Text('Identidad')),
        DataColumn(label: Text('Nombre')),
        DataColumn(label: Text('Codigo Vivienda')),
        DataColumn(label: Text('Fecha de Entrada')),
        DataColumn(label: Text('Precio Renta')),
        DataColumn(label: Text('Observaciones')),
      ],
      rows: arrendatarios.map((arrendatario) => DataRow(
        cells: [
          DataCell(Text(arrendatario.identidad.toString())),
          DataCell(Text(arrendatario.nombre.toString())),
          DataCell(Text(arrendatario.cVivienda.toString())),
          DataCell(Text(arrendatario.fechaEntrada.toString())),
          DataCell(Text(arrendatario.precioRenta.toString())),
          DataCell(Text(arrendatario.obs.toString())),
        ],
      )).toList(),
    );
  }
}