import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/tooltip.dart';
import '../widgets/popup_v.dart';
import 'package:drift/drift.dart' as drift;

class PaymentAndMorosoInfoScreen extends StatefulWidget {
  @override
  _PaymentAndMorosoInfoScreenState createState() => _PaymentAndMorosoInfoScreenState();
}

class _PaymentAndMorosoInfoScreenState extends State<PaymentAndMorosoInfoScreen> {
  late AppDb _db;
  bool _allowForeignID = false;
  late int _idArrendatarioCheck = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hasUnsavedChanges = false;
  final FocusNode _focusNode = FocusNode();
  TextEditingController _identidadController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _montoPagoController = TextEditingController();
  TextEditingController _montoMoraController = TextEditingController();
  TextEditingController _deudaElectricidadController = TextEditingController();
  TextEditingController _deudaAguaController = TextEditingController();
  // TextEditingController _fechaMorosidadController = TextEditingController();
  TextEditingController _fechaPagoViviendaController = TextEditingController();
  bool _isPaymentViviendaSubmitted = false;
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
      _fechaPagoViviendaController.text = DateFormat('dd-MM-yyyy').format(picked);
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
      _montoPagoController.dispose();
      _montoMoraController.dispose();
      _deudaElectricidadController.dispose();
      _fechaPagoViviendaController.dispose();
      _focusNode.dispose();
    } finally {
      super.dispose();
    }
  }

  void _clearFields() {
    _identidadController.clear();
    _montoPagoController.clear();
    _montoMoraController.clear();
    _deudaElectricidadController.clear();
    _deudaAguaController.clear();
    // _fechaMorosidadController.clear();
    _fechaPagoViviendaController.clear();
    setState(() => _hasUnsavedChanges = false);
  }
  FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Introducir información de Pago y Morosidad', back: true, backConfirm: _hasUnsavedChanges,),
      drawer:  CustomDrawer(isMainScreen: false, homeConfirm: _hasUnsavedChanges,),
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
              _submitPaymentAndMorosoInfo();
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
                        decoration: InputDecoration(
                          labelText: 'Identidad del Arrendatario',
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
                            return 'La identidad es un campo necesario';
                          } else if ( _idArrendatarioCheck == 0 ) {
                            return 'El DNI ingresado no coincide con alguno de los arrendatarios actuales';
                          }
                          return null;
                        },
                        inputFormatters: _allowForeignID? null : [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(13),
                        ],
                        onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa el monto del pago',
                      child: TextFormField(
                        controller: _montoPagoController,
                        decoration: const InputDecoration(
                          labelText: 'Monto del Pago',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa el monto del pago, o escribe 0 en caso de que no haya';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'El monto del pago solo debe contener números';
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
                      message: 'Ingresa el monto de la Mora',
                      child: TextFormField(
                        controller: _montoMoraController,
                        decoration: const InputDecoration(
                          labelText: 'Monto de la Mora',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa el monto de la mora, o escribe 0 en caso de que no haya';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'El monto de la mora solo debe contener números';
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
                      message: 'Ingresa el monto de la deuda de electricidad',
                      child: TextFormField(
                        controller: _deudaElectricidadController,
                        decoration: const InputDecoration(
                          labelText: 'Monto de Deuda de Electricidad',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa el monto de la deuda de electricidad, o escribe 0 en caso de que no haya';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'El monto de la deuda de electricidad solo debe contener números';
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
                      message: 'Ingresa el monto de la deuda de agua',
                      child: TextFormField(
                        controller: _deudaAguaController,
                        decoration: const InputDecoration(
                          labelText: 'Monto de Deuda de Agua',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa el monto de la deuda de agua, o escribe 0 en caso de que no haya';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'El monto de la deuda de agua solo debe contener números';
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
                    // GestureDetector(
                    //   onTap: () => _selectDate(context, _fechaMorosidadController),
                    //   child: MouseRegion(
                    //     cursor: SystemMouseCursors.click,
                    //     child: CustomTooltip(
                    //       message: "Click para seleccionar una fecha",
                    //       child: AbsorbPointer(
                    //         child: TextFormField(
                    //           controller: _fechaMorosidadController,
                    //           decoration: const InputDecoration(
                    //             labelText: 'Fecha de Morosidad',
                    //             border: OutlineInputBorder(),
                    //           ),
                    //           onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                    CustomTooltip(
                      message: "Click para seleccionar una fecha",
                        child: TextFormField(
                          readOnly: true,
                          controller: _fechaPagoViviendaController,
                          decoration: const InputDecoration(
                            labelText: 'Fecha de Pago de la Vivienda',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingresa la fecha de entrada';
                            } 
                          },
                          onChanged: (value) => setState(() => _hasUnsavedChanges = true),
                          mouseCursor: SystemMouseCursors.click,
                          onTap: () => _selectDate(context),
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
                              _idArrendatarioCheck  = await _db.verificarActualArrendatarioExistencia(_identidadController.text);
                              if (_formKey.currentState!.validate()) {
                                _submitPaymentAndMorosoInfo();
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

  void _submitPaymentAndMorosoInfo() async {
    // Verifica si ya se ha registrado un pago para el mes actual
    // if (_isPaymentViviendaSubmitted) {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text('Error'),
    //         content: Text('Ya se ha introducido el pago de la vivienda para este mes.'),
    //         actions: [
    //           TextButton(
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //             child: Text('OK'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // } else {
      // Aquí puedes agregar la lógica para registrar el pago
      // y guardar la información sobre el moroso del arrendatario
    if (_formKey.currentState!.validate()) {
      final EstadoCuentaEntity = EstadoCuentasCompanion(
        idArrendatario: drift.Value(_identidadController.text),
        pagoRenta: drift.Value(double.parse(_montoPagoController.text)),
        moraRenta: drift.Value(double.parse(_montoMoraController.text)),
        deudaElectricidad: drift.Value(double.parse(_deudaElectricidadController.text)),
        deudaAgua: drift.Value(double.parse(_deudaAguaController.text)),
        fechaPago: drift.Value(DateTime.parse(_selectedDate)),
      );
      try {
        await _db.insertEstadoCuenta(EstadoCuentaEntity);
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
              content: Text('La información de pagos y moras se ha guardado correctamente.'),
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
      // Marca el pago de la vivienda como registrado
      // _isPaymentViviendaSubmitted = true;
    // }
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
