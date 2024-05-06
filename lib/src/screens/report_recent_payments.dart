import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
import '../models/asset.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import 'package:drift/drift.dart' show OrderBy, OrderingTerm,  OrderingMode;
import 'package:flutter/foundation.dart';

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
  final ValueNotifier<int> _pageNumNotifier = ValueNotifier<int>(1);
  final ValueNotifier<int> _rowsPerPageNotifier = ValueNotifier<int>(0);
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
    _rowsPerPageNotifier.value = (dataTableHeight / rowHeight).toInt();
  }

  @override
  void dispose() {
    _db.close();
    _pageNumNotifier.dispose();
    _rowsPerPageNotifier.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    final List<vEstadoCuentaConArrendatario> cuentas = await (_db.select(_db.vEstadoCuentaConArrendatarios)
  ..orderBy([
    (view) => OrderingTerm(expression: view.estadoId,  mode: OrderingMode.desc)
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
          child: FutureBuilder(
            future: _loadData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error loading data'),
                );
              } else {
                return PaginatedDataTable(
                  columnSpacing: 30,
                  horizontalMargin: 0,
                  dataRowMinHeight: 64,
                  dataRowMaxHeight: 64,
                  columns: [
                    DataColumn(label: Text('Identidad')),
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('Monto Pago de Renta')),
                    DataColumn(label: Text('Monto Mora de Renta')),
                    DataColumn(label: Text('Deuda de Electricidad')),
                    DataColumn(label: Text('Deuda de Agua')),
                    DataColumn(label: Text('Fecha de Pago')),
                  ],
                  source: _RecentPaymentsDataSource(_estadoCuentas, _pageNumNotifier, _rowsPerPageNotifier),
                  onRowsPerPageChanged: (value) {
                    _rowsPerPageNotifier.value = value!;
                  },
                  onPageChanged: (value) {
                    _pageNumNotifier.value = value + 1;
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class _RecentPaymentsDataSource extends DataTableSource {
  final List<vEstadoCuentaConArrendatario> _estadoCuentas;
  final ValueNotifier<int> _pageNumNotifier;
  final ValueNotifier<int> _rowsPerPageNotifier;

  _RecentPaymentsDataSource(this._estadoCuentas, this._pageNumNotifier, this._rowsPerPageNotifier);

  @override
  DataRow getRow(int index) {
    if (index >= _estadoCuentas.length) {
      return DataRow.byIndex(index: index, cells: []);
    }

    final cuenta = _estadoCuentas[index];

    return DataRow(
      cells: [
        DataCell(Text(cuenta.identidad.toString())),
        DataCell(Text(cuenta.nombre.toString())),
        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.pagoRenta)),),
        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.moraRenta)),),
        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.deudaElectricidad)),),
        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(cuenta.deudaAgua)),),
        DataCell(Text(DateFormat('dd-MM-yyyy').format(cuenta.fechaPago))),
      ],
    );
  }

  @override
  int get rowCount => _estadoCuentas.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}