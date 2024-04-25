import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class AccounstToPayServicesDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Tabla de Proveedores de Servicios', back: true),
      drawer:  CustomDrawer(isMainScreen: false),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(label: Text('Proveedores')),
                DataColumn(label: Text('Servicios')),
                DataColumn(label: Text('Monto Total')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Proveedor 1')),
                  DataCell(Text('Servicio A')),
                  DataCell(Text('\$100.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Proveedor 2')),
                  DataCell(Text('Servicio B')),
                  DataCell(Text('\$200.00')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Proveedor 3')),
                  DataCell(Text('Servicio C')),
                  DataCell(Text('\$300.00')),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

