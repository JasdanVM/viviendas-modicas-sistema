import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NewEntryScreen(),
  ));
}

class NewEntryScreen extends StatefulWidget {
  @override
  _NewEntryScreenState createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
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
    if (picked != null) { // Verificar si el valor seleccionado no es nulo
      setState(() {
        _fechaEntradaController.text = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Entrada'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _identidadController,
                  decoration: InputDecoration(labelText: 'Identidad'),
                ),
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
                TextFormField(
                  controller: _codigoViviendaController,
                  decoration: InputDecoration(labelText: 'Código de Vivienda'),
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: _fechaEntradaController,
                      decoration: InputDecoration(labelText: 'Fecha de Entrada'),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _precioRentaController,
                  decoration: InputDecoration(labelText: 'Precio Renta'),
                ),
                TextFormField(
                  controller: _observacionesController,
                  decoration: InputDecoration(labelText: 'Observaciones'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la lógica para guardar la entrada
                    // utilizando los valores de los controladores
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: Center(child: Text('Agregar')),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Vuelve a la pantalla anterior
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: Center(child: Text('Cancelar')),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}