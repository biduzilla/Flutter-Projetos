import 'package:shared_preferences/shared_preferences.dart';

class TarefasRepository {
  TarefasRepository() {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }
  late SharedPreferences sharedPreferences;
}