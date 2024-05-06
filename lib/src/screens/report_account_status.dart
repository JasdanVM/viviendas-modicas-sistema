import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import '../models/asset.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import 'package:drift/drift.dart' show OrderBy, OrderingTerm, OrderingMode;

class AccountStatusScreen extends StatelessWidget {
  final String identidad;
  final AppDb _db;
  AccountStatusScreen({required this.identidad}) : _db = AppDb();

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
            const Center(
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
                  getAssetPath(context),
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FutureBuilder<String>(
              future: nombreArrendatario(identidad),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Text(
                      'Nombre de Arrendatario: ${snapshot.data}',
                      style: TextStyle(fontSize: 16),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                } else {
                  return CircularProgressIndicator();
                }
                return Container();
              },
            ),
            Text(
              'Identidad de Arrendatario: $identidad',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded(
                //   child: Text(
                //     'Número de Referencia:',
                //     style: TextStyle(fontSize: 16),
                //   ),
                // ),
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
              child: AccountStatusDTScreen(identidad: identidad, db: _db,),
            ),
          ],
        ),
      ),
    ),
  );
}
  Future<String> nombreArrendatario(String identidad) async {
    String arrendatarioName = await _db.getArrendatarioName(identidad);
    return arrendatarioName; 
  }
}

class AccountStatusDTScreen extends StatefulWidget {
  final String identidad;
  final AppDb db;

  AccountStatusDTScreen({required this.identidad, required this.db})
      : _accountStatusDTScreen = _AccountStatusDTScreen(db);

  final _AccountStatusDTScreen _accountStatusDTScreen;

  @override
  State<AccountStatusDTScreen> createState() => _accountStatusDTScreen;
}

class _AccountStatusDTScreen extends State<AccountStatusDTScreen> {
  final AppDb _db;
  int _pageNum = 1;
  int _rowsPerPage = 0;
  List<vEstadoCuentaConArrendatario> _estadoCuentas = [];

  _AccountStatusDTScreen(this._db);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final dataTableHeight = screenHeight * 0.5;
    final rowHeight = 40;
    _rowsPerPage = (dataTableHeight / rowHeight).toInt();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  void _loadData() async {
    final List<vEstadoCuentaConArrendatario> cuentas = await (_db.select(_db.vEstadoCuentaConArrendatarios)
    ..where((tbl) => tbl.identidad.equals(widget.identidad))
    ..orderBy([
        (view) => OrderingTerm(expression: view.estadoId, mode: OrderingMode.desc)
      ]))
    .get();
    setState(() {
      _estadoCuentas = cuentas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DataTable(
                columnSpacing: 10,
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).primaryColor,
                ),
                headingRowHeight: 40,
                headingTextStyle: TextStyle(color: Colors.white),
                columns: [
                  DataColumn(label: Text('Pago Renta')),
                  DataColumn(label: Text('Mora Renta')),
                  DataColumn(label: Text('Deuda Energía Eléctrica')),
                  DataColumn(label: Text('Deuda Agua Potable')),
                ],
                rows: _estadoCuentas
                  .skip((_pageNum - 1) * _rowsPerPage)
                  .take(_rowsPerPage)
                  .map((cuenta) => DataRow(
                      cells: [
                        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.pagoRenta))),
                        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.moraRenta))),
                        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.deudaElectricidad))),
                        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.deudaAgua))),
                      ],
                    )).toList(),
              ),
            ),
          ),
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
              onPressed: _pageNum < (_estadoCuentas.length / _rowsPerPage).ceil()
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