import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class RentersCurrentcreen extends StatelessWidget {
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
                  'Estado de Cuenta del Arrendatario',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Expanded(
                  flex: 1,
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
              RentersCurrentDTScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
//| Identidad |  Nombre | Código de Vivienda | Fecha de Entrada | Precio Renta | Observaciones
class RentersCurrentDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
          columnSpacing: 30,
          headingRowColor: MaterialStateColor.resolveWith(
            (states) => Theme.of(context).primaryColor,
          ),
          headingRowHeight: 40,
          headingTextStyle: TextStyle(color: Colors.white),
          columns: [
            DataColumn(label: Text('Identidad')),
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Codigo Vivienda')),
            DataColumn(label: Text('Fecha de Entrada')),
            DataColumn(label: Text('Precio Renta')),
            DataColumn(label: Text('Observaciones')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1234567890')),
              DataCell(Text('Nombre1')),
              DataCell(Text('1')),
              DataCell(Text('12/03/2021')),
              DataCell(Text('2500')),
              DataCell(Text('Observación1')),
            ]),
            DataRow(cells: [
              DataCell(Text('0987654321')),
              DataCell(Text('Nombre2')),
              DataCell(Text('2')),
              DataCell(Text('03/12/2019')),
              DataCell(Text('1700')),
              DataCell(Text('Observación2')),
            ]),
            //...
          ],
        ),
      ),
    );
  }
}