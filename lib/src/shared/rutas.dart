import '../screens/login_page.dart';
import '../screens/menu_main.dart';
import '../screens/menu_data.dart';
import '../screens/menu_reports.dart';
import '../screens/menu_search_a.dart';
import '../screens/menu_search_v.dart';
import '../screens/report_renters_current.dart';
import '../screens/report_renters_history.dart';
import '../screens/report_pending_payments.dart';
import '../screens/report_account_status.dart';
import '../screens/report_occupied_total.dart';
import '../screens/report_accounts_to_pay_services.dart';
import '../screens/report_property_damage.dart';
import '../screens/data_add_renter.dart';
import '../screens/data_remove_renter.dart';
import '../screens/data_payments_debts.dart';
import 'constantes.dart';

final rutas = {
  Rutas.inicioSesion.name: (context) => const LoginScreen(),
  Rutas.menuPrincipal.name: (context) => const MainMenu(),
  Rutas.menuReportes.name: (context) => const ReportsScreen(),
  Rutas.menuData.name: (context) => const AdminDataScreen(),
  Rutas.buscarArre.name: (context) => const SearchRenterScreen(),
  Rutas.buscarVivienda.name: (context) => const SearchByHousingScreen(),
  Rutas.actualArre.name: (context) =>  RentersCurrentcreen(),
  Rutas.historialArre.name: (context) =>  RentersHistorycreen(),
  Rutas.pagosPendienteArre.name: (context) =>  PendingPaymentsScreen(),
  Rutas.estadoCuenta.name: (context) =>  AccountStatusScreen(),
  Rutas.viviendasOcupadas.name: (context) =>  OccupiedHousingDTScreen(),
  Rutas.cuentasPagarServicios.name: (context) =>  AccounstToPayServicesScreen(),
  Rutas.facturaDanoPropiedad.name: (context) =>  PropertyDamageScreen(),
  Rutas.anadirArre.name: (context) =>  NewEntryScreen(),
  Rutas.removerArre.name: (context) =>  RemoveTenantScreen(),
  Rutas.introducirPagosMoras.name: (context) =>  PaymentAndMorosoInfoScreen(),
};
