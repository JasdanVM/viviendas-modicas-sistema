import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class RentersHistoryDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Historial de arrendatarios Previos', back: true),
      drawer:  CustomDrawer(isMainScreen: false),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTable(
            columnSpacing: 10, // Espacio entre columnas
            dataRowHeight: 56, // Altura de las filas
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
                DataCell(Text('1')),
                DataCell(Text('Juan Pérez')),
                DataCell(Text('01/04/2024')),
                DataCell(Text('15/04/2024')),
                DataCell(Text('\5000 lps')),
                DataCell(Text('\500 lps')),
                DataCell(Text('0')),
                DataCell(Text('Ninguna')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('María López')),
                DataCell(Text('03/04/2024')),
                DataCell(Text('20/04/2024')),
                DataCell(Text('\6000 lps')),
                DataCell(Text('\0 lps')),
                DataCell(Text('1000')),
                DataCell(Text('Pequeños arreglos necesarios')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
