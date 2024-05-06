import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import '../models/asset.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/popup_a.dart';
import 'package:drift/drift.dart' as drift;

// class PropertyDamageScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Viviendas Módicas', back: true),
//       drawer: CustomDrawer(isMainScreen: false),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 16),
//               Center(
//                 child: Text(
//                   'Buscar Arrendatario',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     getAssetPath(context),
//                     height: 100,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       'No. de Reporte:',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(
//                       'Fecha de Emision: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
//                       textAlign: TextAlign.end,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   _showSearchRenterPopup(context);
//                 },
//                 child: Text('Buscar Arrendatario'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showSearchRenterPopup(BuildContext context) async {
//   final searchResult = await showDialog(
//     context: context,
//     builder: (context) => SearchRenterPopup(setId: true,),
//   );
//   if (searchResult == null) return;
//   _handleSearchResult(context, searchResult);
// }

// void _handleSearchResult(BuildContext context, String searchResult) {
//   print(searchResult);
//   if (searchResult.startsWith('#')) {
//     final id = searchResult.substring(1);
//     _navigateToResultScreen(context, id);
//   } else {
//     _searchForRenterAndNavigate(context, searchResult);
//   }
// }

// Future<void> _searchForRenterAndNavigate(BuildContext context, String searchValue) async {
//   try {
//     final renterId = await _searchForRenter(searchValue);
//     if (renterId!= null) {
//       _navigateToResultScreen(context, renterId);
//     } else {
//       _showErrorDialog(context, 'No se encontró al arrendatario');
//     }
//   } catch (e) {
//     _showErrorDialog(context, 'Error al buscar arrendatario: $e');
//   }
// }

// Future<String?> _searchForRenter(String searchValue) async {
//   try {
//     final query = _db.select(_db.vFacturaDanoConArrendatarios)
//     ..where((table) => table.arrendatarios.nombre.like('%$searchValue%'));
//     final results = await query.get();
//     return results.isNotEmpty? results.first.identidad : null;
//   } catch (e) {
//     rethrow; // rethrow the exception
//   }
// }

// void _showErrorDialog(BuildContext context, String errorMessage) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text('Error'),
//         content: Text(errorMessage),
//         actions: [
//           TextButton(
//             child: Text('OK'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

//   void _navigateToResultScreen(BuildContext context, String searchResult) {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PropertyDamageResultScreen(searchResult: searchResult),
//       ),
//     );
//   }
// // }

class PropertyDamageResultScreen extends StatefulWidget {
  final String searchResult;

  const PropertyDamageResultScreen({Key? key, required this.searchResult})
      : super(key: key);

  @override
  State<PropertyDamageResultScreen> createState() => _PropertyDamageResultScreenState();
}

class _PropertyDamageResultScreenState extends State<PropertyDamageResultScreen> {
  late AppDb _db;
  int _pageNum = 1;
  int _rowsPerPage = 0;
  List<vFacturaDanoConArrendatario> _facturas = [];

  @override
  void initState() {
    super.initState();
    _loadData(widget.searchResult);
    _db = AppDb();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final dataTableHeight = screenHeight * 0.5;
    final rowHeight = 40;
    _rowsPerPage = (dataTableHeight / rowHeight).toInt();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  void _loadData(String searchQuery) async {
    final List<vFacturaDanoConArrendatario> facturas = await (_db.select(_db.vFacturaDanoConArrendatarios)..where((tbl) => tbl.identidad.equals(searchQuery))).get();
    setState(() {
      _facturas = facturas;
    });
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
              Center(
                child: Text(
                  'Factura por Daños Ocasionados a la Propiedad',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'No. de Reporte:',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Fecha de Emision: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: DataTable(
                      columnSpacing: 30,
                      headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).primaryColor,
                      ),
                      headingRowHeight: 40,
                      headingTextStyle: TextStyle(color: Colors.white),
                      columns: [
                        DataColumn(label: Text('Codigo Vivienda')),
                        DataColumn(label: Text('Identidad')),
                        DataColumn(label: Text('Nombre')),
                        DataColumn(label: Text('Monto de Reparaciones')),
                        DataColumn(label: Text('Descripción')),
                      ],
                      rows: _facturas
                        .skip((_pageNum - 1) * _rowsPerPage)
                        .take(_rowsPerPage)
                        .map((factura) => DataRow(cells: [
                            DataCell(Text(factura.cVivienda.toString())),
                            DataCell(Text(factura.identidad.toString())),
                            DataCell(Text(factura.nombre.toString())),
                            DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(factura.montoDano))),
                            DataCell(Text(factura.desc.toString())),
                          ])).toList(),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: _pageNum > 1
                      ? () {
                        setState(() {
                          _pageNum--;
                        });
                      }
                    : null,
                  ),
                  Text('Página #$_pageNum'),
                  IconButton(
                    icon: Icon(Icons.arrow_forward),
                    onPressed: _pageNum < (_facturas.length / _rowsPerPage).ceil()
                    ? () {
                        setState(() {
                          _pageNum++;
                        });
                      }
                    : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}