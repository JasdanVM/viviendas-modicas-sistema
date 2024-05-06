import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../data/local/entity/arrendatarios_entidad.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/tooltip.dart';
import '../widgets/popup_v.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';

import 'package:drift/drift.dart' as drift;


class EditPaymentsEmptyPlace extends StatefulWidget {
  @override
  _EditPaymentsEmptyPlaceState createState() => _EditPaymentsEmptyPlaceState();
}

class _EditPaymentsEmptyPlaceState extends State<EditPaymentsEmptyPlace> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hasUnsavedChanges = false;
  late int _viviendaCheck = 0;
  final FocusNode _focusNode = FocusNode();
  late AppDb _db;
  List<CuentasPSDesocupado> _cuentasPSDesocupados = [];
  List<Map<String, TextEditingController>> _rows = [];

  @override
  void initState() {
    super.initState();
    _db = AppDb();
    _loadData();
  }

  void _loadData() async {
  final List<CuentasPSDesocupado> cuentasPSDesocupados = await _db.getCuentasPSDesocupados();
  setState(() {
    _cuentasPSDesocupados = cuentasPSDesocupados;
    _rows = _cuentasPSDesocupados.map((cuenta) => {
      'codigoVivienda': TextEditingController(text: cuenta.cVivienda),
      'ubicacion': TextEditingController(text: _getUbicacionFromCVivienda(cuenta.cVivienda)),
      'proveedorEnergia': TextEditingController(text: cuenta.cProveedorEnergia),
      'montoEnergia': TextEditingController(text: cuenta.montoEnergia.toString()),
      'proveedorAgua': TextEditingController(text: cuenta.cProveedorAgua),
      'montoAgua': TextEditingController(text: cuenta.montoAgua.toString()),
    }).toList();
  });
}

String _getUbicacionFromCVivienda(String cVivienda) {
  switch (cVivienda.substring(0, 3)) {
    case 'LLG':
      return 'La Laguna';
    case 'EPV':
      return 'El Porvenir';
    case '23A':
      return '23 de Abril';
    default:
      return '';
  }
}

  void _addRow() {
    setState(() {
      _rows.add({
        'codigoVivienda': TextEditingController(),
        'ubicacion': TextEditingController(),
        'proveedorEnergia': TextEditingController(),
        'montoEnergia': TextEditingController(),
        'proveedorAgua': TextEditingController(),
        'montoAgua': TextEditingController(),
      });
    });
  }

  void _removeRow(int index) {
    setState(() {
      _rows.removeAt(index);
    });
  }

  Future<void> _selectPlace(BuildContext context, dynamic controllerData) async {
    if (controllerData is TextEditingController) {
      final String? picked = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SearchByHousingPopup();
        },
      );
      if (picked!= null) {
        setState(() {
          controllerData.text = picked;
        });
      }
    }
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      for (var row in _rows) {
        _viviendaCheck = await _db.verificarViviendaOcupacion(row['codigoVivienda']!.text);
        if(_viviendaCheck > 0){
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Introduce vivendas desocupadas')),);
        } else {
          // Create or update CuentasPSDesocupados objects based on form data
          final String viviendaCode = (row['codigoVivienda']!.text);
          final CuentasPSDesocupadoEntity = CuentasPSDesocupadosCompanion(
          cVivienda: drift.Value(row['codigoVivienda']!.text),
          cProveedorEnergia: drift.Value(row['proveedorEnergia']!.text),
          montoEnergia: drift.Value(double.parse(row['montoEnergia']!.text)),
          cProveedorAgua: drift.Value(row['proveedorAgua']!.text),
          montoAgua: drift.Value(double.parse(row['montoAgua']!.text)),
        );

          bool updated = await _db.updateCuentaPSDesocupado(viviendaCode, CuentasPSDesocupadoEntity);
          if (!updated) {
            await _db.insertCuentasPSDesocupados(CuentasPSDesocupadoEntity);
          }
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Información guardada exitosamente')),
      );
      _hasUnsavedChanges = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: CustomAppBar(title: 'Montos a Pagar por Conexión de Viviendas Desocupadas', back: true, backConfirm: _hasUnsavedChanges,),
      drawer: CustomDrawer(isMainScreen: false, homeConfirm: _hasUnsavedChanges,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SelectionArea(
                    child: DataTable(
                      columnSpacing: 10,
                      horizontalMargin: 0,
                      dataRowMinHeight: 64,
                      dataRowMaxHeight: 64,
                      columns: [
                        DataColumn(label: Text('Código Vivienda', style: TextStyle(fontSize: 18))),
                        DataColumn(label: Text('Ubicación', style: TextStyle(fontSize: 18))),
                        DataColumn(label: Text('Proveedor de Energía Electrica', style: TextStyle(fontSize: 18))),
                        DataColumn(label: Text('Monto Electricidad', style: TextStyle(fontSize: 18))),
                        DataColumn(label: Text('Proveedor Agua Potable', style: TextStyle(fontSize: 18))),
                        DataColumn(label: Text('Monto Agua', style: TextStyle(fontSize: 18))),
                      ],
                      rows: _rows
                          .map(
                              (row) => DataRow(
                            cells: [
                              DataCell(
                                TextFormField(
                                  readOnly: true,
                                  controller: row['codigoVivienda'],
                                  decoration: InputDecoration(
                                    labelText: 'Código Vivienda',
                                    border: OutlineInputBorder(),
                                  ),
                                  style: TextStyle(fontSize: 18),
                                  mouseCursor: SystemMouseCursors.click,
                                  onTap: () => _selectPlace(context, row['codigoVivienda']),
                                  onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                                  validator:  (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Selecciona el código de vivienda';
                                    } else if ( _viviendaCheck > 0 ) {
                                      return 'Esa vivienda ya está ocupada por un arrendatario';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              DataCell(
                                TextFormField(
                                  enabled: false,
                                  controller: row['ubicacion'],
                                  decoration: InputDecoration(
                                    labelText: 'Ubicación',
                                    border: OutlineInputBorder(),
                                  ),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              DataCell(
                                TextFormField(
                                  controller: row['proveedorEnergia'],
                                  decoration: InputDecoration(
                                    labelText: 'Proveedor de Energía Electrica',
                                    border: OutlineInputBorder(),
                                  ),
                                  style: TextStyle(fontSize: 18),
                                  onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                                ),
                              ),
                              DataCell(
                                TextFormField(
                                  controller: row['montoEnergia'],
                                  decoration: InputDecoration(
                                    labelText: 'Monto Electricidad',
                                    border: OutlineInputBorder(),
                                  ),
                                  style: TextStyle(fontSize: 18),
                                  onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                                ),
                              ),
                              DataCell(
                                TextFormField(
                                  controller: row['proveedorAgua'],
                                  decoration: InputDecoration(
                                    labelText: 'Proveedor Agua Potable',
                                    border: OutlineInputBorder(),
                                  ),
                                  style: TextStyle(fontSize: 18),
                                  onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                                ),
                              ),
                              DataCell(
                                TextFormField(
                                  controller: row['montoAgua'],
                                  decoration: InputDecoration(
                                    labelText: 'Monto Agua',
                                    border: OutlineInputBorder(),
                                  ),
                                  style: TextStyle(fontSize: 18),
                                  onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                                ),
                              ),
                            ],
                          ),
                      )
                        .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        _removeRow(_rows.length - 1);
                      },
                      child: Text('Eliminar Fila'),
                      style: TextButton.styleFrom(
                        minimumSize: Size(150, 50),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          // await _db.into(_db.proveedoresServicios).insert(ProveedoresServiciosCompanion.insert(codigoProveedor: 'ENEE', proveedorNombre: 'Empresa Nacional de Energía Eléctrica', servicio: 'Energía Eléctrica'));
                          // await _db.into(_db.proveedoresServicios).insert(ProveedoresServiciosCompanion.insert(codigoProveedor: 'APC', proveedorNombre: 'Aguas de Puerto Cortes S.A. de C.V.', servicio: 'Agua Potable'));
                            _save();
                          _hasUnsavedChanges = false;
                        },
                        child: const Text('Guardar'),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _addRow();
                          });
                        },
                        child: const Text('Agregar Fila'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}