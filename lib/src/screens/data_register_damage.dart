import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/popup_v.dart';
import '../widgets/tooltip.dart';
import 'package:drift/drift.dart' as drift;

class DamageInfoScreen extends StatefulWidget {
  @override
  _DamageInfoScreenState createState() => _DamageInfoScreenState();
}

class _DamageInfoScreenState extends State<DamageInfoScreen> {
  late AppDb _db;
  late int _idArrendatarioCheck = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hasUnsavedChanges = false;
  final FocusNode _focusNode = FocusNode();
  TextEditingController _identidadController = TextEditingController();
  TextEditingController _codigoViviendaController = TextEditingController();
  TextEditingController _montoController = TextEditingController();
  TextEditingController _descripcionController = TextEditingController();
  String? _selectedMotivo;

  Future<void> _selectPlace(BuildContext context) async {
    final String? picked = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SearchByHousingPopup();
      },
    );
    if (picked != null) {
      setState(() {
        _codigoViviendaController.text = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  void dispose() {
    try {
      _db.close();
      _identidadController.dispose();
      _codigoViviendaController.dispose();
      _montoController.dispose();
      _descripcionController.dispose();
      _focusNode.dispose();
    } finally {
      super.dispose();
    }
  }

  void _clearFields() {
    _identidadController.clear();
    _codigoViviendaController.clear();
    _montoController.clear();
    _descripcionController.clear();
    setState(() => _hasUnsavedChanges = false);
  }
  FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Registro de Factura por Daños', back: true, backConfirm: _hasUnsavedChanges,),
      drawer:  CustomDrawer(isMainScreen: false, homeConfirm: _hasUnsavedChanges,),
      body: Center(
        child: KeyboardListener(
          focusNode: _focusNode,
          onKeyEvent: (event) {
            if (event.logicalKey == LogicalKeyboardKey.enter &&
                _formKey.currentState!.validate()) {
              agregarFactura();
            } else if (event.logicalKey == LogicalKeyboardKey.enter) {
              faltaDatos();
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 300.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa el DNI del arrendatario',
                      child: TextFormField(
                        controller: _identidadController,
                        decoration: const InputDecoration(
                          labelText: 'Identidad del Arrendatario',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La identidad es un campo necesario';
                          } else if ( _idArrendatarioCheck == 0 ) {
                            return 'El DNI ingresado no coincide con algún arrendatario en el sistema';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(13),
                        ],
                        onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa el código de vivienda',
                      child: TextFormField(
                        readOnly: true,
                        controller: _codigoViviendaController,
                        decoration: const InputDecoration(
                          labelText: 'Código de Vivienda',
                          border: OutlineInputBorder(),
                        ),
                        mouseCursor: SystemMouseCursors.click,
                        onTap: () => _selectPlace(context),
                        onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Selecciona el código de vivienda';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      hint: Text('Selecciona el Motivo de la Factura'),
                      value: _selectedMotivo,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedMotivo = newValue;
                          _hasUnsavedChanges = true;
                        });
                      },
                      items: <String>['DEST', 'MOD', 'PER', 'ROB']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Selecciona un código de motivo';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa el monto de las reparaciones',
                      child: TextFormField(
                        controller: _montoController,
                        decoration: const InputDecoration(
                          labelText: 'Monto de las Reparaciones',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa el monto de las Reparaciones';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'El monto de las reparaciones sólo debe contener números';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa la Descripción',
                      child: TextFormField(
                        controller: _descripcionController,
                        decoration: const InputDecoration(
                          labelText: 'Descripción',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          return null;
                        },
                        onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            _clearFields();
                          },
                          child: Text('Cancelar'),
                          style: TextButton.styleFrom(
                            minimumSize: Size(200, 50),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        SizedBox(
                          width:200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              _idArrendatarioCheck  = await _db.verificarArrendatarioExistencia(_identidadController.text);
                              if (_formKey.currentState!.validate()) {
                                agregarFactura();
                              } else {
                                faltaDatos();
                              }
                            },
                            child: const Text('Guardar Información'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void agregarFactura() async {
    if (_formKey.currentState!.validate()) {
      final FacturaDanoEntity = FacturaDanosCompanion(
        idArrendatario: drift.Value(_identidadController.text),
        cVivienda: drift.Value(_codigoViviendaController.text),
        motivoFactura: drift.Value(_selectedMotivo!),
        montoDano: drift.Value(double.parse(_montoController.text)),
        desc: drift.Value(_descripcionController.text),
      );
      try {
        await _db.insertFacturaDano(FacturaDanoEntity);
        showDialog(
          context: context,
          builder: (context) {
            Timer? timer;
            timer = Timer(Duration(seconds: 3), (){
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.of(context).pop();
            });
            return AlertDialog(
              title: Text('Información guardada'),
              content: Text('La información de la factura por daños se ha guardado correctamente.'),
              actions: [
                TextButton(
                  onPressed: () {
                    timer?.cancel();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text('Aceptar'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        // Handle error
        print('Error inserting FacturaDano: $e');
      }
    } else {
      faltaDatos();
    }
  }
  void faltaDatos() {
    Timer? timer;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        timer = Timer(Duration(seconds: 3), () {
          Navigator.of(context, rootNavigator: true).pop();
        });
        return PopScope(
          child: AlertDialog(
            title: Text('Información incorrecta o faltante'),
            content: Text('Por revisa los campos marcados con alertas rojas'),
            actions: [
              TextButton(
                onPressed: () {
                  timer?.cancel();
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          ),
        );
      },
      useRootNavigator: false,
      barrierDismissible: false,
    ).then((value) {
      timer?.cancel();
    });
  }

}
