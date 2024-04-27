import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class OccupiedHousingScreen extends StatelessWidget {
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
                    'assets/vm_icon.png',
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
                      'Fecha de Emisión: ',
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

class OccupiedHousingDTScreen extends StatelessWidget {
  final int _totalHouses = 20; // Replace with your total houses variable
  final int _occupiedHouses = 5; // Replace with your occupied houses variable

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
                  percent: _occupiedHouses / _totalHouses, 
                  center: Text('$_occupiedHouses/$_totalHouses', style: TextStyle(fontSize: 36)),
                  progressColor: Colors.green,
                ),
                SizedBox(height: 16),
                Text(
                  'Viviendas Disponibles: ${_totalHouses-_occupiedHouses}',
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
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('31351')),
                          DataCell(Text('epv')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('3541354')),
                          DataCell(Text('llg')),
                        ]),
                      ],
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