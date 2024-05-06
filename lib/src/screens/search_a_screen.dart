import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import '../models/asset.dart';
import '../shared/constantes.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/popup_a.dart';
import 'package:drift/drift.dart' as drift;

import '../widgets/tooltip.dart';

class RenterSearchScreen extends StatefulWidget {
  final String route;

  RenterSearchScreen({required this.route});

  @override
  _RenterSearchScreenState createState() => _RenterSearchScreenState();
}

class _RenterSearchScreenState extends State<RenterSearchScreen> {
  late AppDb _db;

  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Buscar Arrendatario', back: true),
      drawer: CustomDrawer(isMainScreen: false),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              CustomTooltip(
                message: 'Buscar la información individual de un Arrendatario',
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 70),
                  ),
                  onPressed: () {
                    _showSearchRenterPopup(context);
                  },
                  child: const Text('Buscar Arrendatario',style: TextStyle(fontSize: 24,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: CustomAppBar(title: 'Viviendas Módicas', back: true),
  //     drawer: CustomDrawer(isMainScreen: false),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 20),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: [
  //             const SizedBox(height: 16),
  //             Center(
  //               child: Text(
  //                 'Buscar Arrendatario',
  //                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //             Align(
  //               alignment: Alignment.centerRight,
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(8),
  //                 child: Image.asset(
  //                   getAssetPath(context),
  //                   height: 100,
  //                   fit: BoxFit.contain,
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //             ElevatedButton(
  //               onPressed: () {
  //                 _showSearchRenterPopup(context);
  //               },
  //               child: Text('Buscar Arrendatario'),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _showSearchRenterPopup(BuildContext context) async {
    final searchResult = await showDialog(
      context: context,
      builder: (context) => SearchRenterPopup(setId: true,),
    );
    if (searchResult == null) return;
    _handleSearchResult(context, searchResult, widget.route);
  }

  void _handleSearchResult(BuildContext context, String searchResult, String route) {
  if (searchResult.startsWith('#')) {
    _navigateToResultScreen(context, searchResult.substring(1), route);
  } else {
    _searchForRenterAndNavigate(context, searchResult);
  }
}

  Future<void> _searchForRenterAndNavigate(BuildContext context, String searchValue) async {
  try {
    final renterId = await _searchForRenter(searchValue);
    if (renterId!= null) {
      _navigateToResultScreen(context, renterId, widget.route);
    } else {
      _showErrorDialog(context, 'No se encontró al arrendatario');
    }
  } catch (e) {
    _showErrorDialog(context, 'Error al buscar arrendatario: $e');
  }
}

  Future<String?> _searchForRenter(String searchValue) async {
    try {
      if (widget.route == Rutas.facturaDanoPropiedad.name) {
        final query = _db.select(_db.vFacturaDanoConArrendatarios)
        ..where((table) => table.arrendatarios.nombre.like('%$searchValue%'));
        final results = await query.get();
        return results.isNotEmpty? results.first.identidad : null;
      } else if (widget.route ==  Rutas.estadoCuenta.name) {
        final query = _db.select(_db.vEstadoCuentaConArrendatarios)
        ..where((table) => table.arrendatarios.nombre.like('%$searchValue%'));
        final results = await query.get();
        return results.isNotEmpty? results.first.identidad : null;
      } else {
        final query = _db.select(_db.vArrendatariosActuales)
        ..where((table) => table.arrendatarios.nombre.like('%$searchValue%'));
        final results = await query.get();
        return results.isNotEmpty? results.first.identidad : null;
      }
      
    } catch (e) {
      rethrow; // rethrow the exception
    }
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToResultScreen(BuildContext context, String searchResult, String routeName) {
    Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments: searchResult,
    );
  }
}