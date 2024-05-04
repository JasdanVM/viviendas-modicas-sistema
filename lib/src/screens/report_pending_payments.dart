import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class PendingPaymentsScreen extends StatelessWidget {
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
                  'Pagos Pendientes de Arrendatarios',
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
              PendingPaymentsDTScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class PendingPaymentsDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
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
              DataColumn(label: Text('Identidad')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Periodo Deuda')),
              DataColumn(label: Text('Mora')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('0508195278925')),
                DataCell(Text('Juan Pérez')),
                DataCell(Text('Enero 2024')),
                DataCell(Text('\ 6000 lps')),
              ]),
              DataRow(cells: [
                DataCell(Text('0512197400279')),
                DataCell(Text('María García')),
                DataCell(Text('Febrero 2024')),
                DataCell(Text('\ 3000 lps')),
              ]),
              DataRow(cells: [
                DataCell(Text('0502197812356')),
                DataCell(Text('Juan Pérez')),
                DataCell(Text('Diciembre 2023')),
                DataCell(Text('\ 1000 lps')),
              ]),
              DataRow(cells: [
                DataCell(Text('0501195345820')),
                DataCell(Text('Guillermo Hernandez')),
                DataCell(Text('Septiembre 2023')),
                DataCell(Text('\ 500 lps')),
              ]),
              DataRow(cells: [
                DataCell(Text('0506198213564')),
                DataCell(Text('Marcos orellana')),
                DataCell(Text('Marzo 2024')),
                DataCell(Text('\ 1000 lps')),
              ]),
              DataRow(cells: [
                DataCell(Text('1616198215340')),
                DataCell(Text('Alejandro Rodriguez')),
                DataCell(Text('Agosto 2023')),
                DataCell(Text('\ 700 lps')),
              ]),
              DataRow(cells: [
                DataCell(Text('0508197513564')),
                DataCell(Text('Josue Chirinos')),
                DataCell(Text('Marzo 2024')),
                DataCell(Text('\ 1000 lps')),
              ]),
              DataRow(cells: [
                DataCell(Text('1616198215340')),
                DataCell(Text('Genesis Rodriguez')),
                DataCell(Text('Agosto 2023')),
                DataCell(Text('\ 700 lps')),
              ]),
              // ...
            ],
          ),
        )
      ),
    );
  }
}