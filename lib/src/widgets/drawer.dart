import 'package:flutter/material.dart';
import '../models/asset.dart';
import '../models/theme_provider.dart';
import '../shared/constantes.dart';
import 'package:viviendas_modicas_sistema/src/models/colors.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  final bool isMainScreen;
  final bool homeConfirm;
  CustomDrawer({this.isMainScreen = false, this.homeConfirm = false});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: isMainScreen
              ? null
                  : () {
                      Navigator.pop(context);
                      if (!homeConfirm) {
                        Navigator.pushNamed(context, Rutas.menuPrincipal.name);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('¿Deseas salir al Menú Principal?'),
                            content: Text('Tienes información sin guardar'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pushNamed(context, Rutas.menuPrincipal.name),
                                child: Text('Aceptar'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
              child: Tooltip(
                message: 'Navegar al Menú Principal',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 185, 
                    child: Image.asset(
                      getAssetPath(context),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SwitchListTile(
            
            title: Text('Modo Oscuro'),
            value: Provider.of<ThemeProvider>(context).themeData == darkMode,
            onChanged: (value) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Rutas.inicioSesion.name);
              },
              child: const Text('Cerrar Sesión', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(88, 54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}