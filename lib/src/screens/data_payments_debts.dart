import 'package:flutter/material.dart';

class PaymentAndMorosoInfoScreen extends StatefulWidget {
  @override
  _PaymentAndMorosoInfoScreenState createState() => _PaymentAndMorosoInfoScreenState();
}

class _PaymentAndMorosoInfoScreenState extends State<PaymentAndMorosoInfoScreen> {
  TextEditingController _identidadController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _montoController = TextEditingController();
  TextEditingController _montoDeudaController = TextEditingController();
  TextEditingController _montoDeudaAguaController = TextEditingController();
  TextEditingController _fechaMorosidadController = TextEditingController();
  TextEditingController _fechaMontoPagoViviendaController = TextEditingController();

  bool _isPaymentViviendaSubmitted = false;

  void _submitPaymentAndMorosoInfo() {
    // Verifica si ya se ha registrado un pago para el mes actual
    if (_isPaymentViviendaSubmitted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Ya se ha registrado el pago de la vivienda para este mes.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Aquí puedes agregar la lógica para registrar el pago
      // y guardar la información sobre el moroso del arrendatario
      String identidad = _identidadController.text;
      String nombre = _nombreController.text;
      double montoPago = double.tryParse(_montoController.text) ?? 0.0;
      double montoDeuda = double.tryParse(_montoDeudaController.text) ?? 0.0;
      double montoDeudaAgua = double.tryParse(_montoDeudaAguaController.text) ?? 0.0;
      String fechaMorosidad = _fechaMorosidadController.text;
      String fechaMontoPagoVivienda = _fechaMontoPagoViviendaController.text;
      // Lógica para registrar el pago y la información sobre el moroso

      // Marca el pago de la vivienda como registrado
      _isPaymentViviendaSubmitted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Pago y Morosidad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _identidadController,
              decoration: InputDecoration(labelText: 'Identidad del Arrendatario'),
            ),
            TextFormField(
              controller: _nombreController,
              decoration: InputDecoration(labelText: 'Nombre del Arrendatario'),
            ),
            TextFormField(
              controller: _montoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Monto del Pago'),
            ),
            TextFormField(
              controller: _montoDeudaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Monto de Deuda de Electricidad'),
            ),
            TextFormField(
              controller: _montoDeudaAguaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Monto de Deuda de Agua'),
            ),
            TextFormField(
              controller: _fechaMorosidadController,
              decoration: InputDecoration(labelText: 'Fecha de Morosidad'),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  setState(() {
                    _fechaMorosidadController.text = picked.toString();
                  });
                }
              },
            ),
            TextFormField(
              controller: _fechaMontoPagoViviendaController,
              decoration: InputDecoration(labelText: 'Fecha del Monto del Pago de la Vivienda'),
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  setState(() {
                    _fechaMontoPagoViviendaController.text = picked.toString();
                  });
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPaymentAndMorosoInfo,
              child: Text('Guardar Información'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Vuelve a la pantalla anterior
              },
              child: Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentAndMorosoInfoScreen(),
  ));
}
