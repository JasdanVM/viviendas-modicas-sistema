import 'package:flutter/material.dart';

class RemoveTenantScreen extends StatefulWidget {
  @override
  _RemoveTenantScreenState createState() => _RemoveTenantScreenState();
}

class _RemoveTenantScreenState extends State<RemoveTenantScreen> {
  TextEditingController _idController = TextEditingController();
  String _tenantName = '';
  String _tenantLocation = '';

  void _findTenant() {
    // Aquí puedes agregar la lógica para buscar al arrendatario
    // utilizando el ID proporcionado en el campo de texto
    int id = int.tryParse(_idController.text) ?? 0;
    // Lógica para buscar al arrendatario con el ID proporcionado
    // y actualizar _tenantName y _tenantLocation si se encuentra
  }

  void _removeTenant() {
    // Aquí puedes agregar la lógica para eliminar al arrendatario
    // utilizando el ID proporcionado en el campo de texto
    int id = int.tryParse(_idController.text) ?? 0;
    // Lógica para eliminar al arrendatario con el ID proporcionado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eliminar Arrendatario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID del Arrendatario'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _findTenant,
              child: Text('Buscar'),
            ),
            SizedBox(height: 20),
            Text('Nombre: $_tenantName'),
            Text('Ubicación: $_tenantLocation'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _removeTenant,
              child: Text('Eliminar'),
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