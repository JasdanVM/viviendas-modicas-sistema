import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/constantes.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: CustomAppBar(title: 'Menú Principal', back: false),
    drawer:  CustomDrawer(isMainScreen: true),
    body: Stack(
      children: [
        Center(
          child: SizedBox(
            width: 300,
            height: 371,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/vm_icon.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Tooltip(
                  message: 'Añadir or Remover cierta información del sistema',
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(400, 70),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Rutas.menuData.name);
                    },
                    child: const Text('Administrar Datos',style: TextStyle(fontSize: 22,)),
                  ),
                ),
                const SizedBox(height: 20),
                Tooltip(
                  message: 'Acceder a las salidas de información del sistema',
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(400, 70),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Rutas.menuReportes.name);
                    },
                    child: const Text('Reportes',style: TextStyle(fontSize: 24,)),
                  ),
                ),
                const SizedBox(height: 20),
                Tooltip(
                  message: 'Buscar la información individual de un Arrendatario',
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(400, 70),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Rutas.buscarArre.name);
                    },
                    child: const Text('Buscar Arrendatario',style: TextStyle(fontSize: 24,)),
                  ),
                ),
                const SizedBox(height: 20),
                Tooltip(
                  message: 'Buscar entradas del sistema de acuerdo a la Vivienda',
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(400, 70),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Rutas.buscarVivienda.name);
                    },
                    child: const Text('Buscar por Vivienda',style: TextStyle(fontSize: 24,)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

}

