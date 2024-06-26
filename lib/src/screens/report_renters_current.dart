import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
import '../models/asset.dart';
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
              const Center(
                child: Text(
                  'Lista de Arrendatarios Actuales',
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
                child: RentersCurrentDTScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RentersCurrentDTScreen extends StatefulWidget {
  const RentersCurrentDTScreen({Key? key}) : super(key: key);

  @override
  State<RentersCurrentDTScreen> createState() => _RentersCurrentDTScreen();
}

class _RentersCurrentDTScreen extends State<RentersCurrentDTScreen> {
  late AppDb _db;
  int _pageNum = 1;
  int _rowsPerPage = 0;
  List<vArrendatariosActuale> _arrendatariosActuales = [];

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
    // (await _db.select(_db.vArrendatariosActuales).get()).forEach(print);
    final List<vArrendatariosActuale> arrendatarios = await _db.select(_db.vArrendatariosActuales).get();
    setState(() {
      _arrendatariosActuales = arrendatarios;
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
                  DataColumn(label: Text('Codigo Vivienda')),
                  DataColumn(label: Text('Fecha de Entrada')),
                  DataColumn(label: Text('Precio Renta')),
                  DataColumn(label: Text('Observaciones')),
                ],
                rows: _arrendatariosActuales
                  .skip((_pageNum - 1) * _rowsPerPage)
                  .take(_rowsPerPage)
                  .map((arrendatario) => DataRow(
                      cells: [
                        DataCell(Text(arrendatario.identidad.toString())),
                        DataCell(Text(arrendatario.nombre.toString())),
                        DataCell(Text(arrendatario.cVivienda.toString())),
                        DataCell(Text(DateFormat('dd-MM-yyyy').format(arrendatario.fechaEntrada))),
                        DataCell(Text(NumberFormat.currency(symbol: 'L. ').format(arrendatario.precioRenta)),),
                        DataCell(Text(arrendatario.obs.toString())),
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
              onPressed: _pageNum < (_arrendatariosActuales.length / _rowsPerPage).ceil()
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