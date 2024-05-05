import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _storage = GetStorage();
  final RxString _theme = ''.obs;

  @override
  void onInit() {
    _theme.value = _storage.read('theme')?? 'light';
    super.onInit();
  }

  String get theme => _theme.value;
  set theme(value) => _theme.value = value;

  void saveTheme(String theme) {
    _storage.write('theme', theme);
    _theme.value = theme;
  }
}