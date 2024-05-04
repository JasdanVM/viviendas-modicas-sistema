import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../shared/constantes.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/tooltip.dart';
import '../widgets/popup_v.dart';
import 'package:drift/drift.dart' as drift;

class NewEntryScreen extends StatefulWidget {
  @override
  _NewEntryScreenState createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  late AppDb _db;
  bool _allowFutureDates = false;
  bool _allowForeignID = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hasUnsavedChanges = false;
  final FocusNode _focusNode = FocusNode();
  TextEditingController _identidadController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _codigoViviendaController = TextEditingController();
  TextEditingController _fechaEntradaController = TextEditingController();
  TextEditingController _precioRentaController = TextEditingController();
  TextEditingController _observacionesController = TextEditingController();
  late String _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010, 8),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      _selectedDate = DateFormat('yyyy-MM-dd').format(picked);
      _fechaEntradaController.text = DateFormat('dd-MM-yyyy').format(picked);
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

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  void dispose() {
    try {
      _db.close();
      _nombreController.dispose();
      _identidadController.dispose();
      _codigoViviendaController.dispose();
      _fechaEntradaController.dispose();
      _precioRentaController.dispose();
      _observacionesController.dispose();
      _focusNode.dispose();
    } finally {
      super.dispose();
    }
  }

  void _clearFields() {
    _identidadController.clear();
    _nombreController.clear();
    _codigoViviendaController.clear();
    _fechaEntradaController.clear();
    _precioRentaController.clear();
    _observacionesController.clear();
    setState(() => _hasUnsavedChanges = false);
  }
  FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Nueva Entrada', back: true, backConfirm: _hasUnsavedChanges,),
      drawer: CustomDrawer(isMainScreen: false, homeConfirm: _hasUnsavedChanges,),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: AppBar().preferredSize.height + 10),
          CustomTooltip(message: 'Click para ver consejo',
            child: FloatingActionButton.small(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FadeTransition(
                      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: ModalRoute.of(context)!.animation!,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.4,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          'Activar el botón con ícono de llave permite desactivar ciertas validaciones en ese campo de entrada. Esta función es para ingreasr datos en situaciones excepcionales. Por favor, utilícela con responsabilidad.',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Icon(
                                        Icons.key,
                                        size: 72,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Aceptar'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Icon(Icons.question_mark, size: 18),
            ),
          ),
        ],
      ),
      body: Center(
        child: KeyboardListener(
          focusNode: _focusNode,
          onKeyEvent: (event) {
            if (event.logicalKey == LogicalKeyboardKey.enter &&
                _formKey.currentState!.validate()) {
              agregarArrendatarios();
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
                      message: 'Ingresa el DNI del Arrendatario',
                      child: TextFormField(
                        controller: _identidadController,
                        decoration: InputDecoration(
                          labelText: 'Identidad',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: _allowForeignID ? 
                                Icon(Icons.key, color: Theme.of(context).colorScheme.primary,) : 
                                Icon(Icons.key, color: focus.hasFocus ? Colors.grey : Colors.grey),
                            onPressed: () {
                              setState(() {
                                _allowForeignID =!_allowForeignID;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La Indentidad es un campo necesario';
                          } else if (!_allowForeignID && value!= null) {
                            if (value.length < 13) {
                              return 'La Identidad debe tener 13 dígitos';
                            }
                          }
                          return null;
                        },
                        inputFormatters:_allowForeignID? null : [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(13),
                        ],
                        onChanged: (value) => setState(() => _hasUnsavedChanges = true),
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
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu nombre';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Selecciona el código de vivienda';
                          }
                          return null;
                        },
                        onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                        mouseCursor: SystemMouseCursors.click,
                        onTap: () => _selectPlace(context),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: "Click para seleccionar una fecha",
                        child: TextFormField(
                          readOnly: true,
                          controller: _fechaEntradaController,
                          decoration: InputDecoration(
                            labelText: 'Fecha de Entrada',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: _allowFutureDates ? 
                                Icon(Icons.key, color: Theme.of(context).colorScheme.primary,) :
                                Icon(Icons.key, color: focus.hasFocus ? Colors.grey : Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _allowFutureDates =!_allowFutureDates;
                                });
                              } 
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingresa la fecha de entrada';
                            } else if (!_allowFutureDates && value!= null){
                              DateFormat format = DateFormat("dd-MM-yyyy");
                              DateTime dateTime = format.parse(value);
                              if (dateTime.isAfter(DateTime.now())){
                                return 'Ingresa una fecha anterior o igual a la actual';
                              }
                            } 
                          },
                          onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                          mouseCursor: SystemMouseCursors.click,
                          onTap: () => _selectDate(context),
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
                        onChanged: (value) => setState(() => _hasUnsavedChanges = true),
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
                                agregarArrendatarios();
                              } else {
                                faltaDatos();
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

  void agregarArrendatarios() {
    final arrendatarioEntity = ArrendatariosCompanion(
      nombre: drift.Value(_nombreController.text),
      identidad: drift.Value(_identidadController.text),
    );
    _db.insertArrendatario(arrendatarioEntity).then((arrendatarioId) {
      final actualArrendatarioEntity = ActualArrendatariosCompanion(
        idArrendatario: drift.Value(_identidadController.text),
        obs: drift.Value(_observacionesController.text),
        fechaEntrada: drift.Value(DateTime.parse(_selectedDate)),
        precioRenta: drift.Value(double.parse(_precioRentaController.text)),
        cVivienda: drift.Value(_codigoViviendaController.text),
      );
      return _db.insertActualArrendatario(actualArrendatarioEntity);
    }).then((_) {
      showDialog(
        context: context,
        builder: (context) {
          Timer? timer;
          timer = Timer(Duration(seconds: 3), (){
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.of(context).pop();
          });
          return AlertDialog(
            title: Text('Arrendatario Agregado con éxito'),
            content: Text(
                'Nombre: ${_nombreController.text}, Identidad: ${_identidadController.text}'),
            actions: [
              TextButton(
                onPressed: () {
                  timer?.cancel();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    });
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
  // Future<void> _onHomeButtonPressed() async {
  //   if (_hasUnsavedChanges) {
  //     final shouldNavigate = await _showUnsavedChangesDialog();
  //     if (shouldNavigate) {
  //       Navigator.pushNamed(context, Rutas.menuPrincipal.name);
  //     }
  //   } else {
  //     Navigator.pushNamed(context, Rutas.menuPrincipal.name);
  //   }
  // }

  // void _onBackButtonPressed() {
  //   print('TRES UNO');
  //   showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       print('TRES DOS');
  //       return AlertDialog(
  //         title: const Text('¿Deseas salir?'),
  //         content: const Text(
  //           'Tienes información sin guardar',
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             style: TextButton.styleFrom(
  //               textStyle: Theme.of(context).textTheme.labelLarge,
  //             ),
  //             child: const Text('Cancelar'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //           ),
  //           TextButton(
  //             style: TextButton.styleFrom(
  //               textStyle: Theme.of(context).textTheme.labelLarge,
  //             ),
  //             child: const Text('Salir'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  // Future<bool> _showUnsavedChangesDialog() async {
  //   final choice = await showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //           title: Text('¿Deseas salir al Menú Principal?'),
  //           content: Text('Tienes información sin guardar'),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.pop(context, false),
  //               child: Text('Cancelar'),
  //             ),
  //             TextButton(
  //               onPressed: () => Navigator.pop(context, true),
  //               child: Text('Aceptar'),
  //             ),
  //           ],
  //         ),
  //   );
  //   return choice ?? false; // Regresa null en caso de que no se escoja ninguna opción
  // }

  

}
