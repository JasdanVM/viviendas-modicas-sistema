import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
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
              Text(
                  'Nombre de Arrendatario: Jesús Armando Torres',
                  style: TextStyle(fontSize: 16),
                ),
              Text(
                'Identidad de Arrendatario: 0506198723451',
                style: TextStyle(fontSize: 16),
              ),
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
              Expanded(
                child: AccountStatusDTScreen(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountStatusDTScreen extends StatefulWidget {
  const AccountStatusDTScreen({Key? key}) : super(key: key);

  @override
  State<AccountStatusDTScreen> createState() => _AccountStatusDTScreen();
}

class _AccountStatusDTScreen extends State<AccountStatusDTScreen> {
  int _pageNum = 1;
  int _rowsPerPage = 0;
  List<int> _filas = [1,2,3,4];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final dataTableHeight = screenHeight * 0.5; // adjust this value to fit your needs
    final rowHeight = 40; // adjust this value to fit your needs
    _rowsPerPage = (dataTableHeight / rowHeight).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: 
            SingleChildScrollView(
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
                          DataCell(Text('\ 2000')),
                          DataCell(Text('\ 50')),
                          DataCell(Text('\ 100')),
                          DataCell(Text('\ 20')),
                          DataCell(Text('\ 30')),
                          DataCell(Text('\ 10')),
                          DataCell(Text('\ ninguno')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('\ 5000')),
                          DataCell(Text('\ 500')),
                          DataCell(Text('\ 450')),
                          DataCell(Text('\ 0')),
                          DataCell(Text('\ 100')),
                          DataCell(Text('\ 0')),
                          DataCell(Text('\ ninguno')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('\ 2500')),
                          DataCell(Text('\ 0')),
                          DataCell(Text('\ 500')),
                          DataCell(Text('\ 0')),
                          DataCell(Text('\ 250')),
                          DataCell(Text('\ 0')),
                          DataCell(Text('\ ninguno')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('\ 5500')),
                          DataCell(Text('\ 1500')),
                          DataCell(Text('\ 800')),
                          DataCell(Text('\ 0')),
                          DataCell(Text('\ 150')),
                          DataCell(Text('\ 0')),
                          DataCell(Text('\ ninguno')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('\ 2500')),
                          DataCell(Text('\ 500')),
                          DataCell(Text('\ 800')),
                          DataCell(Text('\ 800')),
                          DataCell(Text('\ 250')),
                          DataCell(Text('\ 250')),
                          DataCell(Text('\ ninguno')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('\ 2000')),
                          DataCell(Text('\ 0')),
                          DataCell(Text('\ 500')),
                          DataCell(Text('\ 0')),
                          DataCell(Text('\ 200')),
                          DataCell(Text('\ 0')),
                          DataCell(Text('\ ninguno')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('\ 3000')),
                          DataCell(Text('\ 1500')),
                          DataCell(Text('\ 500')),
                          DataCell(Text('\ 500')),
                          DataCell(Text('\ 250')),
                          DataCell(Text('\ 0')),
                          DataCell(Text('\ ninguno')),
                        ]),
                        DataRow(cells: [
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
                  ),
                ),
              ),
            )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: _pageNum > 1
              ? () {
                  setState(() {
                    _pageNum--;
                  });
                }
              : null,
            ),
            Text('Página #$_pageNum'),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: _pageNum < (_filas.length / _rowsPerPage).ceil()
              ? () {
                  setState(() {
                    _pageNum++;
                  });
                }
              : null,
            ),
          ],
        ),
      ],
    );
  }
}