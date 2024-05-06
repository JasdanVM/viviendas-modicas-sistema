import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import '../models/asset.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import 'package:drift/drift.dart' as drift;

// class PlaceSearchResultScreen extends StatelessWidget {
//   final String selectedValue;

//   PlaceSearchResultScreen({required this.selectedValue});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Selected Value'),
//       ),
//       body: Center(
//         child: Text(
//           'Código Elegido: $selectedValue',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
class PlaceSearchResultScreen extends StatefulWidget {
  final String selectedValue;
  

  PlaceSearchResultScreen({required this.selectedValue});

  @override
  _PlaceSearchResultScreenState createState() => _PlaceSearchResultScreenState();
}

class _PlaceSearchResultScreenState extends State<PlaceSearchResultScreen> {
  late AppDb _db;
  late int _viviendaCheck;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
    _initViviendaCheck();
  }

  Future<void> _initViviendaCheck() async {
    print(widget.selectedValue);
    _viviendaCheck = await _db.verificarViviendaOcupacion(widget.selectedValue);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
              const Center(
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
                    getAssetPath(context),
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _viviendaCheck > 0 //En caso de que la vivienda esté ocupada
                ? PlaceSearchResultDTScreen(searchQuery: widget.selectedValue,) 
                  : PlaceSearchResultDTScreenEmpty(searchQuery: widget.selectedValue,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceSearchResultDTScreen extends StatefulWidget {
  final String searchQuery;

  PlaceSearchResultDTScreen({Key? key, required this.searchQuery})
      : super(key: key);

  @override
  State<PlaceSearchResultDTScreen> createState() =>
      _PlaceSearchResultDTScreen();
}

class _PlaceSearchResultDTScreen extends State<PlaceSearchResultDTScreen> {
  late AppDb _db;
  late Future<vViviendaDetalleData?> viviendaDetalleFuture;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
    viviendaDetalleFuture = _loadData(widget.searchQuery);
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  Future<vViviendaDetalleData?> _loadData(String searchQuery) async {
    try {
      final vivienda = await (_db.select(_db.vViviendaDetalle)..where((tbl) => tbl.codigoVivienda.equals(searchQuery))).getSingle();
      return vivienda;
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
            future: viviendaDetalleFuture,
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

  Widget _DataTable(vViviendaDetalleData vivienda) {
    return DataTable(
      columnSpacing: 30,
      headingRowColor: MaterialStateColor.resolveWith(
        (states) => Theme.of(context).primaryColor,
      ),
      headingRowHeight: 40,
      headingTextStyle: TextStyle(color: Colors.white),
      columns: [
        DataColumn(label: Text('Código Vivienda')),
        DataColumn(label: Text('Ubicación')),
        DataColumn(label: Text('Identidad del Arrendatario')),
        DataColumn(label: Text('Nombre del Arrendatario')),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(Text(vivienda.codigoVivienda.toString())),
            DataCell(Text(vivienda.ubicacion.toString())),
            DataCell(Text(vivienda.identidad.toString())),
            DataCell(Text(vivienda.nombre.toString())),
          ],
        ),
      ],
    );
  }
}

class PlaceSearchResultDTScreenEmpty extends StatefulWidget {
  final String searchQuery;

  PlaceSearchResultDTScreenEmpty({Key? key, required this.searchQuery})
      : super(key: key);

  @override
  State<PlaceSearchResultDTScreenEmpty> createState() =>
      _PlaceSearchResultDTScreenEmpty();
}

class _PlaceSearchResultDTScreenEmpty extends State<PlaceSearchResultDTScreenEmpty> {
  late AppDb _db;
  late Future<ViviendaUbicacionData?> viviendaFuture;
  // late Future<List<vArrendatariosActuale>> arrendatariosActualesFuture;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
    viviendaFuture = _loadData(widget.searchQuery);
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  Future<ViviendaUbicacionData?> _loadData(String searchQuery) async {
    try {
      final vivendaubic = await (_db.select(_db.viviendaUbicacion)..where((tbl) => tbl.codigoVivienda.equals(searchQuery))).getSingle();
      return vivendaubic;
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
            future: viviendaFuture,
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

  Widget _DataTable(ViviendaUbicacionData viviendaubic) {
    return DataTable(
      columnSpacing: 30,
      headingRowColor: MaterialStateColor.resolveWith(
        (states) => Theme.of(context).primaryColor,
      ),
      headingRowHeight: 40,
      headingTextStyle: TextStyle(color: Colors.white),
      columns: const [
        DataColumn(label: Text('Código Vivienda')),
        DataColumn(label: Text('Ubicación')),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(Text(viviendaubic.codigoVivienda.toString())),
            DataCell(Text(viviendaubic.ubicacion.toString())),
          ],
        ),
      ],
    );
  }
}