import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class RentersCurrentDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Tabla de Datos', back: true),
      drawer:  CustomDrawer(isMainScreen: false),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTable(
            columnSpacing: 30,
            columns: [
              DataColumn(label: Text('Codigo Vivienda')),
              DataColumn(label: Text('Identidad')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Total por Reparaciones')),
              DataColumn(label: Text('Monto Final')),
              DataColumn(label: Text('Descripciones')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('1234567890')),
                DataCell(Text('Nombre1')),
                DataCell(Text('1000')),
                DataCell(Text('500')),
                DataCell(Text('Descripción1')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('0987654321')),
                DataCell(Text('Nombre2')),
                DataCell(Text('2000')),
                DataCell(Text('700')),
                DataCell(Text('Descripción2')),
              ]),
              // ...
            ],
          ),
        ),
      ),
    );
  }
}
