import 'package:shared_preferences/shared_preferences.dart';

const String prefsKeyLang = 'prefsKeyLang';
const String prefsKeyVerificationEmail = 'prefsKeyVerificationEmail';
const String prefsKeyId = 'prefsKeyId';
const String prefsKeyCartId = 'prefsKeyCartId';
const String prefsKeyToken = 'prefsKeyToken';
const String prefsKeyOnBoarding = 'onBoarding';
const String prefsKeyPhone = 'prefsKeyPhone';
const String prefsKeyOrderId = 'prefsKeyOrderId';

// class CacheHelper {
//   final SharedPreferences _sharedPreferences;
//   CacheHelper(this._sharedPreferences);

//   Future<void> saveLogin(bool isThereUser) async {
//     _sharedPreferences.setBool(prefsKeyVerificationEmail, isThereUser);
//   }

//   Future<bool?> getLogin() async {
//     bool? isThereUser = _sharedPreferences.getBool(
//       prefsKeyVerificationEmail,
//     );
//     return isThereUser;
//   }

//   Future<void> saveId(String Id) async {
//     _sharedPreferences.setString(prefsKeyId, Id);
//   }

//   Future<String?> getId() async {
//     String? Id = _sharedPreferences.getString(prefsKeyId);
//     return Id;
//   }

//   Future<void> savePhone(String phone) async {
//     _sharedPreferences.setString(prefsKeyPhone, phone);
//   }

//   Future<String?> getPhone() async {
//     String? phone = _sharedPreferences.getString(prefsKeyPhone);
//     return phone;
//   }

//   Future<void> saveToken(String token) async {
//     _sharedPreferences.setString(prefsKeyToken, token);
//   }

//   Future<String?> getToken() async {
//     String? token = _sharedPreferences.getString(prefsKeyToken);
//     return token;
//   }

//   Future<void> saveOnBoarding(bool isTrue) async {
//     _sharedPreferences.setBool(prefsKeyOnBoarding, isTrue);
//   }

//   Future<bool?> getOnBoarding() async {
//     bool? onboarding = _sharedPreferences.getBool(prefsKeyOnBoarding);
//     return onboarding;
//   }
// }

class Shareds {
  static late SharedPreferences _instance;
  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static setBool(String key, bool value) {
    _instance.setBool(key, value);
  }

  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static setString(String key, String value) async {
    await _instance.setString(key, value);
  }

  static getString(String key) {
    return _instance.getString(key) ?? "";
  }

  //add method to get and set int
  static setInt(String key, int value) async {
    await _instance.setInt(key, value);
  }

  static getInt(String key) {
    return _instance.getInt(key) ?? 0;
  }
  //clear all data
  static clear() {
    _instance.clear();
  }

  static void setGuestUser(bool value) {
    setBool('isGuestUser', value);
  }

  static bool isGuestUser() {
    return getBool('isGuestUser');
  }
}
