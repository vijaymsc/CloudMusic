import 'package:cloud_music/UI/shared_prefrance/shared_preference_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static Future<SharedPreferences> get _preference =>
      SharedPreferences.getInstance();

  static Future<bool> setBool(String key, value) async =>
      (await _preference).setBool(key, value);

  static Future<bool> getBool(String key) async =>
      (await _preference).getBool(key) ?? false;


  static clearPreference() async {
 var pref = await _preference;
 pref.remove(PreferenceConstant.userLoginStatus);
  }
}
