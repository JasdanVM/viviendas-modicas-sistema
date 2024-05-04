// // In lib/data/local/entity/arrendatarios_vistas.dart

// import 'package:drift/drift.dart';
// import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';// Replace with your actual path

// @DriftView(
//   // Optional: You can provide a view name here (defaults to class name)
//   // viewName: 'vw_Arrendatarios_Completo',
// )
// class VwArrendatariosCompleto extends View {
//   final String idArrendatario; // From ActualArrendatarios
//   final String nombre; // From Arrendatarios
//   final String cVivienda; // From ActualArrendatarios
//   final DateTime fechaEntrada; // From ActualArrendatarios
//   final double precioRenta; // From ActualArrendatarios
//   final String? obs; // From ActualArrendatarios

//   @override
//   @_$VwArrendatariosCompletoConstructor() // Generated constructor after build_runner build
//   VwArrendatariosCompleto({
//     required this.idArrendatario,
//     required this.nombre,
//     required this.cVivienda,
//     required this.fechaEntrada,
//     required this.precioRenta,
//     this.obs,
//   });

//   @override
//   Query as() {
//     return select(vwArrendatariosCompleto) // Use vwArrendatariosCompleto here (defined in the class)
//         .from(actualArrendatarios)
//         .join([
//           innerJoin(arrendatarios, arrendatarios.identidad.equalsExp(actualArrendatarios.idArrendatario)),
//         ]);
//   }
// }