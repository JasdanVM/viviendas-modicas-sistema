import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class PendingPaymentsDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pago Pendiente de Arrendatarios', back: true),
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
              DataColumn(label: Text('Periodo Deuda')),
              DataColumn(label: Text('Mora')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('134545')),
                DataCell(Text('Juan Pérez')),
                DataCell(Text('Enero 2024')),
                DataCell(Text('\50 lps')),
              ]),
              DataRow(cells: [
                DataCell(Text('256565')),
                DataCell(Text('María García')),
                DataCell(Text('Febrero 2024')),
                DataCell(Text('\30 lps')),
              ]),
              // ...
            ],
          ),
        ),
      ),
    );
  }
}


