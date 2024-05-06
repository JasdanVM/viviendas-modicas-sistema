import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/local/db/app_db.dart';
import '../../data/local/entity/arrendatarios_entidad.dart';
import '../models/asset.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class AccounstToPayServicesScreen extends StatelessWidget {
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
                  'Total de Cuentas por pagar a proveedores de un Servicio',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Periodo del ${DateFormat('MM/yyyy').format(DateTime.now())} al  ${DateFormat('MM/yyyy').format(DateTime.now().add(Duration(days: 30)))}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                child: AccounstToPayServicesDTScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccounstToPayServicesDTScreen extends StatefulWidget {
  const AccounstToPayServicesDTScreen({Key? key}) : super(key: key);

  @override
  State<AccounstToPayServicesDTScreen> createState() => _AccounstToPayServicesDTScreen();
}

class _AccounstToPayServicesDTScreen extends State<AccounstToPayServicesDTScreen> {
  late AppDb _db;
  List<CuentasPSDesocupado> _cuentasConexiones = [];

  @override
  void initState() {
    super.initState();
    _db = AppDb();
    _loadData();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  Future<List<CuentasPSDesocupado>> _loadData() async {
    final List<CuentasPSDesocupado> conexionesCuentas = await _db.getCuentasPSDesocupados();
    setState(() {
      _cuentasConexiones = conexionesCuentas;
    });
    return conexionesCuentas;
  }

List<CuentasPSDesocupado> _sumData(List<CuentasPSDesocupado> data) {
  final summedData = <CuentasPSDesocupado>[];
  final proveedores = <String, double>{};

  for (final d in data) {
    proveedores.putIfAbsent(d.cProveedorEnergia, () => 0);
    proveedores[d.cProveedorEnergia] = (proveedores[d.cProveedorEnergia] ?? 0) + d.montoEnergia!;

    proveedores.putIfAbsent(d.cProveedorAgua, () => 0);
    proveedores[d.cProveedorAgua] = (proveedores[d.cProveedorAgua] ?? 0) + d.montoAgua!;
  }

  proveedores.forEach((key, value) {
    summedData.add(CuentasPSDesocupado(
      cVivienda: 'some value', // add a value for cVivienda
      cProveedorEnergia: key,
      montoEnergia: value,
      cProveedorAgua: key,
      montoAgua: value,
    ));
  });

  return summedData;
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CuentasPSDesocupado>>(
      future: _loadData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<CuentasPSDesocupado> conexionesCuentas = snapshot.data!;
          final summedData = _sumData(conexionesCuentas);

          return 
          Column(
            children: [
              const Text(
                'Proveedores de Servicios',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
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
                      headingTextStyle: TextStyle(color: Colors.white),
                      columns: const [
                        DataColumn(label: Text('Código Proveedor')),
                        DataColumn(label: Text('Nombre Proveedor')),
                        DataColumn(label: Text('Monto Total')),
                      ],
                      rows: summedData.map((conexion) {
                        return DataRow(
                          cells: [
                            DataCell(Text(conexion.cProveedorEnergia)),
                            DataCell(Text(conexion.cProveedorEnergia)), // Assuming nombre proveedor is same as cProveedorEnergia
                            DataCell(Text(conexion.montoEnergia.toString())),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Ha ocurrido un error: ${snapshot.error}'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}