import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class RentersHistorycreen extends StatelessWidget {
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
                  'Reporte de Historial de Arrendatarios',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Fecha de Emision: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: RentersHistoryDTScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RentersHistoryDTScreen extends StatefulWidget {
  const RentersHistoryDTScreen({Key? key}) : super(key: key);

  @override
  State<RentersHistoryDTScreen> createState() => _RentersHistoryDTScreen();
}

class _RentersHistoryDTScreen extends State<RentersHistoryDTScreen> {
  late AppDb _db;
  int _pageNum = 1;
  int _rowsPerPage = 0;
  List<Arrendatario> _arrendatarios = [];

  @override
  void initState() {
    super.initState();
    _db = AppDb();
    _loadData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final dataTableHeight = screenHeight * 0.5; // adjust this value to fit your needs
    final rowHeight = 40; // adjust this value to fit your needs
    _rowsPerPage = (dataTableHeight / rowHeight).toInt();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  void _loadData() async {
    final List<Arrendatario> arrendatarios = await _db.getArrendatarios();
    setState(() {
      _arrendatarios = arrendatarios;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DataTable(
                columnSpacing: 10, // Espacio entre columnas
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).primaryColor,
                ),
                headingRowHeight: 40,
                headingTextStyle: TextStyle(color: Colors.white),
                columns: [
                  DataColumn(label: Text('Identidad')),
                  DataColumn(label: Text('Nombre')),
                  DataColumn(label: Text('Fecha Entrada')),
                  DataColumn(label: Text('Fecha Salida')),
                  DataColumn(label: Text('Precio Renta')),
                  DataColumn(label: Text('Deuda Pendiente')),
                  DataColumn(label: Text('Daños Propiedad')),
                  DataColumn(label: Text('Observaciones')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('0506198523497')),
                    DataCell(Text('Juan Pérez')),
                    DataCell(Text('01/01/2024')),
                    DataCell(Text('15/07/2024')),
                    DataCell(Text('\ 5000 lps')),
                    DataCell(Text('\ 500 lps')),
                    DataCell(Text('0')),
                    DataCell(Text('Ninguna')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0801197524568')),
                    DataCell(Text('María López')),
                    DataCell(Text('03/04/2023')),
                    DataCell(Text('03/04/2024')),
                    DataCell(Text('\ 6000 lps')),
                    DataCell(Text('\ 0 lps')),
                    DataCell(Text('1000')),
                    DataCell(Text('Pequeños arreglos necesarios')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0106197345983')),
                    DataCell(Text('Juan Lopez')),
                    DataCell(Text('03/02/2023')),
                    DataCell(Text('03/08/2023')),
                    DataCell(Text('\ 2000 lps')),
                    DataCell(Text('\ 500 lps')),
                    DataCell(Text('1000')),
                    DataCell(Text('Pequeños arreglos necesarios')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0501197515793')),
                    DataCell(Text('Alma Garcia')),
                    DataCell(Text('10/06/2023')),
                    DataCell(Text('10/01/2024')),
                    DataCell(Text('\ 1500 lps')),
                    DataCell(Text('\ 800 lps')),
                    DataCell(Text('1000')),
                    DataCell(Text('Pequeños arreglos necesarios')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('1717196324568')),
                    DataCell(Text('Yolanda Almendarez')),
                    DataCell(Text('01/01/2023')),
                    DataCell(Text('01/01/2024')),
                    DataCell(Text('\ 4000 lps')),
                    DataCell(Text('\ 0 lps')),
                    DataCell(Text('1000')),
                    DataCell(Text('Pequeños arreglos necesarios')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0801196215748')),
                    DataCell(Text('Wilfredo Ferrufino')),
                    DataCell(Text('10/05/2024')),
                    DataCell(Text('10/05/2024')),
                    DataCell(Text('\ 5000 lps')),
                    DataCell(Text('\ 900 lps')),
                    DataCell(Text('1500')),
                    DataCell(Text('Pequeños arreglos necesarios')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0502195324568')),
                    DataCell(Text('Bayron Vega')),
                    DataCell(Text('15/01/2024')),
                    DataCell(Text('15/06/2024')),
                    DataCell(Text('\ 1500 lps')),
                    DataCell(Text('\ 0 lps')),
                    DataCell(Text('0')),
                    DataCell(Text('Nnguna')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0501198924746')),
                    DataCell(Text('Rene Ordoñez')),
                    DataCell(Text('03/04/2024')),
                    DataCell(Text('20/10/2024')),
                    DataCell(Text('\ 6000 lps')),
                    DataCell(Text('\ 0 lps')),
                    DataCell(Text('1000')),
                    DataCell(Text('Pequeños arreglos necesarios')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0101197524568')),
                    DataCell(Text('Pedro Garcia')),
                    DataCell(Text('03/04/2024')),
                    DataCell(Text('20/04/2024')),
                    DataCell(Text('\ 6000 lps')),
                    DataCell(Text('\ 0 lps')),
                    DataCell(Text('1000')),
                    DataCell(Text('ninguno')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('0501198924568')),
                    DataCell(Text('Lourdes Fernandez')),
                    DataCell(Text('03/04/2024')),
                    DataCell(Text('20/04/2024')),
                    DataCell(Text('\ 6000 lps')),
                    DataCell(Text('\ 0 lps')),
                    DataCell(Text('2000 lps')),
                    DataCell(Text('arreglos necesarios')),
                  ]),
                ],
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
              onPressed: _pageNum < (_arrendatarios.length / _rowsPerPage).ceil()
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
    );
  }
}
// class RentersHistoryDTScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Historial de arrendatarios Previos', back: true),
//       drawer:  CustomDrawer(isMainScreen: false),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           child: DataTable(
//             columnSpacing: 10, // Espacio entre columnas
//             dataRowHeight: 56, // Altura de las filas
//             columns: [
//               DataColumn(label: Text('Identidad')),
//               DataColumn(label: Text('Nombre')),
//               DataColumn(label: Text('Fecha Entrada')),
//               DataColumn(label: Text('Fecha Salida')),
//               DataColumn(label: Text('Precio Renta')),
//               DataColumn(label: Text('Deuda Pendiente')),
//               DataColumn(label: Text('Daños Propiedad')),
//               DataColumn(label: Text('Observaciones')),
//             ],
//             rows: [
//               DataRow(cells: [
//                 DataCell(Text('1')),
//                 DataCell(Text('Juan Pérez')),
//                 DataCell(Text('01/04/2024')),
//                 DataCell(Text('15/04/2024')),
//                 DataCell(Text('\5000 lps')),
//                 DataCell(Text('\500 lps')),
//                 DataCell(Text('0')),
//                 DataCell(Text('Ninguna')),
//               ]),
//               DataRow(cells: [
//                 DataCell(Text('2')),
//                 DataCell(Text('María López')),
//                 DataCell(Text('03/04/2024')),
//                 DataCell(Text('20/04/2024')),
//                 DataCell(Text('\6000 lps')),
//                 DataCell(Text('\0 lps')),
//                 DataCell(Text('1000')),
//                 DataCell(Text('Pequeños arreglos necesarios')),
//               ]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
