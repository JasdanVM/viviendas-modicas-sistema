import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/popup_a.dart';

class PropertyDamageScreen extends StatelessWidget {
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
                  'Buscar Arrendatario',
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
              ElevatedButton(
                onPressed: () {
                  _showSearchRenterPopup(context);
                },
                child: Text('Buscar Arrendatario'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSearchRenterPopup(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) => SearchRenterPopup(),
    );
    if (result != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              PropertyDamageResultScreen(searchResult: result),
        ),
      );
    }
  }
}

class PropertyDamageResultScreen extends StatelessWidget {
  final String searchResult;

  const PropertyDamageResultScreen({Key? key, required this.searchResult})
      : super(key: key);

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
                    'assets/vm_icon.png',
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: SelectionArea(
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
                            DataColumn(label: Text('Total por Reparaciones')),
                            DataColumn(label: Text('Monto Final')),
                            DataColumn(label: Text('Descripciones')),
                          ],
                          rows: _getRows(searchResult),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DataRow> _getRows(String searchResult) {
    final List<DataRow> rows = [];
    // Use the search result to filter the data in the DataTable
    if (searchResult.isNotEmpty) {
      // Replace this with the actual data source
      final List<Map<String, String>> data = [
        {
          'codigoVivienda': 'LLG-A09',
          'identidad': '0506198703415',
          'nombre': 'Mario Luis Chavez',
          'totalReparaciones': '1000',
          'montoFinal': '500',
          'descripciones': 'Quebro una ventana',
        },
      ];
      for (final item in data) {
        rows.add(DataRow(cells: [
          DataCell(Text(item['codigoVivienda']!)),
          DataCell(Text(item['identidad']!)),
          DataCell(Text(item['nombre']!)),
          DataCell(Text(item['totalReparaciones']!)),
          DataCell(Text(item['montoFinal']!)),
          DataCell(Text(item['descripciones']!)),
        ]));
      }
    }
    return rows;
  }
}
