import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class OccupiedHousingDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Tabla de Viviendas', back: true),
      drawer:  CustomDrawer(isMainScreen: false),
      body: Center(
        child: SizedBox(
          width: 800,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Código Vivienda')),
                DataColumn(label: Text('Ubicación')),
                DataColumn(label: Text('Descripción')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('31351')),
                  DataCell(Text('epv')),
                  DataCell(Text('Hermosa casa en el centro de la ciudad')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3541354')),
                  DataCell(Text('llg')),
                  DataCell(Text('Casa frente al mar')),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


