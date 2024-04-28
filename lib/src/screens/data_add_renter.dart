import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/tooltip.dart';
import '../widgets/popup_v.dart';

class NewEntryScreen extends StatefulWidget {
  @override
  _NewEntryScreenState createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  TextEditingController _identidadController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _codigoViviendaController = TextEditingController();
  TextEditingController _fechaEntradaController = TextEditingController();
  TextEditingController _precioRentaController = TextEditingController();
  TextEditingController _observacionesController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010, 8),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      setState(() {
        _fechaEntradaController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

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

  void _clearFields() {
    _identidadController.clear();
    _nombreController.clear();
    _codigoViviendaController.clear();
    _fechaEntradaController.clear();
    _precioRentaController.clear();
    _observacionesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Nueva Entrada', back: true),
      drawer: CustomDrawer(isMainScreen: false),
      body: Center(
        child: KeyboardListener(
          focusNode: _focusNode,
          onKeyEvent: (event) {
            if (event.logicalKey == LogicalKeyboardKey.enter) {
              // Handle enter key press
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
                      message: 'Ingresa el DNI del Arrendatario',
                      child: TextFormField(
                        controller: _identidadController,
                        decoration: const InputDecoration(
                          labelText: 'Identidad',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La Identidad es un campo necesario';
                          }
                          if (value.length > 13) {
                            return 'La Identidad no debe tener más de 13 dígitos';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(13),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa el nombre del Arrendatario',
                      child: TextFormField(
                        controller: _nombreController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null ||value.isEmpty) {
                            return 'Ingresa tu nombre';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _selectPlace(context),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: CustomTooltip(
                          message: 'Ingresa el código de vivienda',
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: _codigoViviendaController,
                              decoration: const InputDecoration(
                                labelText: 'Código de Vivienda',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Selecciona el código de vivienda';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: CustomTooltip(
                          message: "Click para seleccionar una fecha",
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: _fechaEntradaController,
                              decoration: const InputDecoration(
                                labelText: 'Fecha de Entrada',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'La fecha de entrada es un campo necesario';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa el precio de renta',
                      child: TextFormField(
                        controller: _precioRentaController,
                        decoration: const InputDecoration(
                          labelText: 'Precio Renta',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa el precio de renta';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'El Precio Renta solo debe contener números';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa las observaciones',
                      child: TextFormField(
                        controller: _observacionesController,
                        decoration: const InputDecoration(
                          labelText: 'Observaciones',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          return null;
                        },
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
                            minimumSize: Size(150, 50),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Handle save button press
                              }
                            },
                            child: const Text('Agregar'),
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

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}