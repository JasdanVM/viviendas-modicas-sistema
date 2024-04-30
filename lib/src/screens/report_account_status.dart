import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class AccountStatusScreen extends StatelessWidget {
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
                      'Número de Referencia:',
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
              AccountStatusDTScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
class AccountStatusDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SelectionArea(
            child: DataTable(
              columnSpacing: 10, // Espacio entre las columnas
              headingRowColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).primaryColor,
              ),
              headingRowHeight: 40, // Set the desired height here
              headingTextStyle: TextStyle(color: Colors.white),
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
                  DataCell(Text('0501158932597')),
                  DataCell(Text('Juan Pérez')),
                  DataCell(Text('EPV')),
                  DataCell(Text('\ 2000')),
                  DataCell(Text('\ 50')),
                  DataCell(Text('\ 100')),
                  DataCell(Text('\ 20')),
                  DataCell(Text('\ 30')),
                  DataCell(Text('\ 10')),
                  DataCell(Text('\ ninguno')),
                ]),
                 DataRow(cells: [
                  DataCell(Text('0506195223569')),
                  DataCell(Text('Alonso Fernandez')),
                  DataCell(Text('23A')),
                  DataCell(Text('\ 5000')),
                  DataCell(Text('\ 500')),
                  DataCell(Text('\ 450')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ 100')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ ninguno')),
                ]),
                 DataRow(cells: [
                  DataCell(Text('0101195603495')),
                  DataCell(Text('fanny Garcia')),
                  DataCell(Text('LLG')),
                  DataCell(Text('\ 2500')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ 500')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ 250')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ ninguno')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0103197603752')),
                  DataCell(Text('Amanda Lusardo')),
                  DataCell(Text('LLG')),
                  DataCell(Text('\ 5500')),
                  DataCell(Text('\ 1500')),
                  DataCell(Text('\ 800')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ 150')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ ninguno')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0101195603495')),
                  DataCell(Text('David Martinez')),
                  DataCell(Text('23A')),
                  DataCell(Text('\ 2500')),
                  DataCell(Text('\ 500')),
                  DataCell(Text('\ 800')),
                  DataCell(Text('\ 800')),
                  DataCell(Text('\ 250')),
                  DataCell(Text('\ 250')),
                  DataCell(Text('\ Debe agua y luz')),
                ]),
                DataRow(cells: [
                  DataCell(Text('0501199612953')),
                  DataCell(Text('Mario Villaueva')),
                  DataCell(Text('EPV')),
                  DataCell(Text('\ 2000')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ 500')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ 200')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ ninguno')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1782198935492')),
                  DataCell(Text('Glenda Mejia')),
                  DataCell(Text('23A')),
                  DataCell(Text('\ 3000')),
                  DataCell(Text('\ 1500')),
                  DataCell(Text('\ 500')),
                  DataCell(Text('\ 500')),
                  DataCell(Text('\ 250')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ Debe luz')),
                ]),
                DataRow(cells: [
                  DataCell(Text('1234198012345')),
                  DataCell(Text('Ferderico Gomez')),
                  DataCell(Text('LLG')),
                  DataCell(Text('\ 1500')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ 500')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ 250')),
                  DataCell(Text('\ 0')),
                  DataCell(Text('\ ninguno')),
                ]),
              ],
            ),
            
          )
        ),
      ),
    );
  }
}