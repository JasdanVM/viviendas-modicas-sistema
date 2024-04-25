import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class AccountStatusDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Estado de Cuenta del Arrendatario ...', back: true),
      drawer:  CustomDrawer(isMainScreen: false),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DataTable(
              columnSpacing: 10, // Espacio entre las columnas
              columns: [
                DataColumn(label: Text('Identidad')),
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Código Vivienda')),
                DataColumn(label: Text('Pago Renta')),
                DataColumn(label: Text('Deuda Renta')),
                DataColumn(label: Text('Pago Energía Eléctrica')),
                DataColumn(label: Text('Deuda Energía Eléctrica')),
                DataColumn(label: Text('Pago Agua Potable')),
                DataColumn(label: Text('Deuda Agua Potable')),
                DataColumn(label: Text('Observaciones')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('115551')),
                  DataCell(Text('Juan Pérez')),
                  DataCell(Text('1234')),
                  DataCell(Text('\ 200')),
                  DataCell(Text('\ 50')),
                  DataCell(Text('\ 100')),
                  DataCell(Text('\ 20')),
                  DataCell(Text('\ 30')),
                  DataCell(Text('\ 10')),
                  DataCell(Text('\ ninguno')),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}