import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/tooltip.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
class EditPaymentsEmptyPlace extends StatefulWidget {
  @override
  _EditPaymentsEmptyPlaceState createState() => _EditPaymentsEmptyPlaceState();
}

class _EditPaymentsEmptyPlaceState extends State<EditPaymentsEmptyPlace> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  List<Map<String, TextEditingController>> _rows = [
    {
      'codigoVivienda': TextEditingController(),
      'ubicacion': TextEditingController(),
      'proveedorEnergia': TextEditingController(),
      'montoEnergia': TextEditingController(),
      'proveedorAgua': TextEditingController(),
      'montoAgua': TextEditingController(),
    },
  ];

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

  // Future<void> _save() async {
  //   if (_formKey.currentState!.validate()) {
  //     for (var row in _rows) {
  //       // Create or update CuentasPSDesocupados objects based on form data
  //       CuentasPSDesocupados cuenta = CuentasPSDesocupados(
  //         cVivienda: row['codigoVivienda'].text,
  //         // Set other fields based on the form data in the row map
  //         cProveedorEnergia: row['proveedorEnergia'].text,
  //         montoEnergia: double.parse(row['montoEnergia'].text),
  //         cProveedorAgua: row['proveedorAgua'].text,
  //         montoAgua: double.parse(row['montoAgua'].text),
  //       );

  //       // Use appropriate methods from your database package to insert or update
  //       await _database.cuentasPSDesocupadosDao.insert(cuenta); // Or update based on logic
  //     }
  //     // Show success message or perform other actions after saving
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Información guardada exitosamente')),
  //     );
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: CustomAppBar(title: 'Montos a Pagar por Conexión de Viviendas Desocupadas', back: true),
      drawer: CustomDrawer(isMainScreen: false),
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
                                controller: row['codigoVivienda'],
                                decoration: InputDecoration(
                                  labelText: 'Código Vivienda',
                                  border: OutlineInputBorder(),
                                ),
                                style: TextStyle(fontSize: 18),),
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
                        onPressed: () {
                          // Handle save button press
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