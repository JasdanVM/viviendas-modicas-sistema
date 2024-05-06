
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import '../models/asset.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class OccupiedHousingScreen extends StatelessWidget {
  late int total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Total de Viviendas Ocupadas', back: true),
      drawer: CustomDrawer(isMainScreen: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Positioned(
              right: 16,
              child: Container(
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    getAssetPath(context),
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Viviendas Ocupadas',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Fecha de Emision: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  Expanded(
                    child: OccupiedHousingDTScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OccupiedHousingDTScreen extends StatefulWidget {
  const OccupiedHousingDTScreen({Key? key}) : super(key: key);

  @override
  State<OccupiedHousingDTScreen> createState() => _OccupiedHousingDTScreen();
}

class _OccupiedHousingDTScreen extends State<OccupiedHousingDTScreen> {
  late AppDb _db;
  List<ViviendaUbicacionData> _places = [];
  int _occupiedPlaces = 0;
  int _totalPlaces = 0;
  

  @override
  void initState() {
    super.initState();
    _db = AppDb();
    _loadData();
  }

  void _loadData() async {
    // (await _db.select(_db.vArrendatariosActuales).get()).forEach(print);
    final List<ViviendaUbicacionData> places = await _db.fViviendasSinArrendatario();
    final List<ViviendaUbicacionData> total = await _db.select(_db.viviendaUbicacion).get();

    setState(() {
      _places = removeDuplicates(places);
      print('HEY'); 
      print(_places.length);
      print('HEY'); 
      print(total.length);
      print('HEY'); 
      print(places.length - total.length);
      print('HEY');
      _totalPlaces = total.length;
      _occupiedPlaces = _totalPlaces - _places.length;
    });
  }

  List<ViviendaUbicacionData> removeDuplicates(List<ViviendaUbicacionData> places) {
  List<ViviendaUbicacionData> uniquePlaces = [];

  for (ViviendaUbicacionData place in places) {
    if (!uniquePlaces.contains(place)) {
      uniquePlaces.add(place);
    }
  }

  return uniquePlaces;
}

//   void _loadData() async {
//   // Get data from fViviendasSinArrendatario
//   final List<ViviendaUbicacionData> places = (await _db.fViviendasSinArrendatario())
//       .map((data) => data.item1) // Extract ViviendaUbicacionData
//       .toList();

//   // Update state with the loaded places
//   setState(() {
//     _occupiedPlaces = places.length;
//   });
// }

// void _loadData() async {
//   void printFunctionResult() async {
//     final result = await _db.fViviendasSinArrendatario();
//     print(result);
//   }

//   final List<ViviendaUbicacionData> places = await _db.fViviendasSinArrendatario();

//   setState(() {
//     _places = places;
//     // _occupiedPlaces = places.length;
//   });
// }


// void _loadData() async {
//   // Get data from fViviendasSinArrendatario
//   final List places = await _db.select(_db.fViviendasSinArrendatario as ResultSetImplementation<HasResultSet, dynamic>).get();

//   // Update state with the loaded places
//   setState(() {
//     _places = places;
//     _occupiedPlaces = places.length;
//   });
// }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 240.0,
                  lineWidth: 20.0,
                  percent: _occupiedPlaces / _totalPlaces, 
                  center: Text('$_occupiedPlaces/$_totalPlaces', style: TextStyle(fontSize: 36)),
                  progressColor: Colors.green,
                ),
                SizedBox(height: 16),
                Text(
                  'Viviendas Disponibles: ${_totalPlaces-_occupiedPlaces}',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SelectionArea(
                    child: DataTable(
                      columnSpacing: 10, 
                      headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).primaryColor,
                      ),
                      headingRowHeight: 40, 
                      headingTextStyle: TextStyle(color: Colors.white),
                      columns: [
                        DataColumn(label: Text('Código Vivienda')),
                        DataColumn(label: Text('Ubicación')),
                      ],
                      rows: _places.map((place) {
                        return DataRow(cells: [
                          DataCell(Text(place.codigoVivienda.toString())),
                          DataCell(Text(place.ubicacion.toString())),
                        ]);
                      }).toList(),
                    ),
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Place {
  final String code;
  final String location;

  Place({required this.code, required this.location});
}