import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager {
  late final SharedPreferences _sharedPrefs;

  static final LocalStorageManager _instance = LocalStorageManager._internal();

  factory LocalStorageManager() => _instance;

  LocalStorageManager._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  String get adminAccessToken =>
      _sharedPrefs.getString(keyAdminAccessToken) ?? "";
  set adminAccessToken(String value) {
    _sharedPrefs.setString(keyAdminAccessToken, value);
  }

  String get adminRefreshToken =>
      _sharedPrefs.getString(keyAdminRefreshToken) ?? "";
  set adminRefreshToken(String value) {
    _sharedPrefs.setString(keyAdminRefreshToken, value);
  }


  void clear() async {
    await _sharedPrefs.clear();
  }
}

// constants/strings.dart
const String keyAdminAccessToken = "adminAccessToken";
const String keyAdminRefreshToken = "adminRefreshToken";