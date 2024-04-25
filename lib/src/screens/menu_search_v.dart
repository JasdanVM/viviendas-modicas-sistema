import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/constantes.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class SearchByHousingScreen extends StatelessWidget {
  const SearchByHousingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar por Vivienda'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      drawer: CustomDrawer(isMainScreen: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/vm_icon.png'),
                fit: BoxFit.fitHeight,
                width: 100,
                height: 100,
              ),
              const Text(
                'Filtrar ubicación de la vivienda:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Ubicación',
                  border: OutlineInputBorder(),
                ),
                items: [
                  'Ubicación 1',
                  'Ubicación 2',
                  'Ubicación 3',
                  'Mostrar Todas'
                ].map((String location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
              const SizedBox(height: 20),
              const Text(
                'Buscar por código de vivienda:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Código de vivienda',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 100, 
                  height: 50, 
                  child: ElevatedButton(
                    onPressed: () {
                      print('Buscar button pressed');
                    },
                    child: const Text('Buscar', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyAppButton({super.key, 
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}