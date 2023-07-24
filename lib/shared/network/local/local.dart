import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({required String key, required var value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else {
      return await sharedPreferences.setBool(key, value);
    }
  }

  static getData({required String key}) {
    sharedPreferences.get(key);
  }
}
