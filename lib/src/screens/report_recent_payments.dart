import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
import '../models/asset.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import 'package:drift/drift.dart' show OrderBy, OrderingTerm,  OrderingMode;


class RecentPaymentsScreen extends StatelessWidget {
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
                  'Pagos y Moras Recientes de Arrendatarios',
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
              Expanded(
                child: RecentPaymentsDTScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentPaymentsDTScreen extends StatefulWidget {
  const RecentPaymentsDTScreen({Key? key}) : super(key: key);

  @override
  State<RecentPaymentsDTScreen> createState() => _RecentPaymentsDTScreen();
}

class _RecentPaymentsDTScreen extends State<RecentPaymentsDTScreen> {
  late AppDb _db;
  int _pageNum = 1;
  int _rowsPerPage = 0;
  List<vEstadoCuentaConArrendatario> _estadoCuentas = [];

  @override
  void initState() {
    super.initState();
    _db = AppDb();
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
    // (await _db.select(_db.vEstadoCuentaConArrendatarios).get()).forEach(print);
    // final List<EstadoCuenta> cuentas = await _db.getEstadoCuentas();
    // final List<vEstadoCuentaConArrendatario> cuentas = await _db.select(_db.vEstadoCuentaConArrendatarios).get();
    final List<vEstadoCuentaConArrendatario> cuentas = await (_db.select(_db.vEstadoCuentaConArrendatarios)
  ..orderBy([
    (view) => OrderingTerm(expression: view.estadoId,  mode: OrderingMode.desc)
  ]))
  .get();
    setState(() {
      _estadoCuentas = cuentas;
    });
  }

  // void _loadData() async {
  //   final List<Arrendatario> arrendatarios = await _db.getArrendatarios();
  //   setState(() {
  //     _arrendatarios = arrendatarios;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: DataTable(
                columnSpacing: 30,
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).primaryColor,
                ),
                headingRowHeight: 40,
                headingTextStyle:TextStyle(color: Colors.white),
                columns: [
                  DataColumn(label: Text('Identidad')),
                  DataColumn(label: Text('Nombre')),
                  DataColumn(label: Text('Monto Pago de Renta')),
                  DataColumn(label: Text('Monto Mora de Renta')),
                  DataColumn(label: Text('Deuda de Electricidad')),
                  DataColumn(label: Text('Deuda de Agua')),
                  DataColumn(label: Text('Fecha de Pago')),
                ],
                rows: _estadoCuentas
                  .skip((_pageNum - 1) * _rowsPerPage)
                  .take(_rowsPerPage)
                  .map((cuenta) => DataRow(
                      cells: [
                        DataCell(Text(cuenta.identidad.toString())),
                        DataCell(Text(cuenta.nombre.toString())),
                        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.pagoRenta)),),
                        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.moraRenta)),),
                        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.deudaElectricidad)),),
                        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.deudaAgua)),),
                        DataCell(Text(DateFormat('dd-MM-yyyy').format(cuenta.fechaPago))),
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