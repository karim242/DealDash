import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void saveString({required String key, required String value}) {
    sharedPreferences.setString(key, value);
  }

  static String? getString({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }

  static Future<void> saveThemeMode(bool isDarkMode) async {
    await sharedPreferences.setBool('is_dark_mode', isDarkMode);
  }

  static bool? getThemeMode() {
    return sharedPreferences.getBool('is_dark_mode');
  }
}

class SecureCacheHelper {
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static Future<void> saveToken({required String value}) async {
    await secureStorage.write(key: 'auth_token', value: value);
  }

  static Future<String?> getToken() async {
    return await secureStorage.read(key: 'auth_token');
  }

  static Future<void> removeToken() async {
    await secureStorage.delete(key: 'auth_token');
  }

  static Future<void> saveFCMToken({required String value}) async {
    await secureStorage.write(key: 'fcm_token', value: value);
  }

  static Future<String?> getFCMToken() async {
    return await secureStorage.read(key: 'fcm_token');
  }
}


//   class CacheHelper {
//   // إنشاء instance من FlutterSecureStorage
//   static final FlutterSecureStorage secureStorage = FlutterSecureStorage();

//   // حفظ الـ token
//   static Future<void> saveToken({required String value}) async {
//     await secureStorage.write(key: 'auth_token', value: value);
//   }

//   // استرجاع الـ token
//   static Future<String?> getToken() async {
//     return await secureStorage.read(key: 'auth_token');
//   }

//   // إزالة الـ token
//   static Future<void> removeToken() async {
//     await secureStorage.delete(key: 'auth_token');
//   }

//   // حفظ String معين
//   static Future<void> saveString({required String key, required String value}) async {
//     await secureStorage.write(key: key, value: value);
//   }

//   // استرجاع String معين
//   static Future<String?> getString({required String key}) async {
//     return await secureStorage.read(key: key);
//   }

//   // حفظ وضع الثيم (مظلم أو فاتح)
//   static Future<void> saveThemeMode(bool isDarkMode) async {
//     await secureStorage.write(key: 'is_dark_mode', value: isDarkMode.toString());
//   }

//   // استرجاع وضع الثيم
//   static Future<bool?> getThemeMode() async {
//     String? value = await secureStorage.read(key: 'is_dark_mode');
//     if (value != null) {
//       return value.toLowerCase() == 'true';
//     }
//     return null;
//   }
// }
