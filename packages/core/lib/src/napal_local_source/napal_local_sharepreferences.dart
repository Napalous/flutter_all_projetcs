import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NapalLocalSharePreferences {
  var prefs;

  Future<SharedPreferences> getSharedPreferences() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs;
  }

  Future<bool> saveToken(String? token) async {
    if (token != null) {
      var pf = await getSharedPreferences();
      return pf.setString("token", token);
    }
    return false;
  }

  Future<String?> getToken() async {
    var pf = await getSharedPreferences();
    return pf.getString("token");
  }

  Future<bool> removeToken() async {
    var pf = await getSharedPreferences();
    return pf.remove("token");
  }

  Future<bool> saveSomeData(String key, Map<String, dynamic>? data) async {
    if (data != null) {
      var pf = await getSharedPreferences();
      return pf.setString(key, jsonEncode(data));
    }
    return false;
  }

  Future<Map<String, dynamic>?> getSomeData(String key) async {
    var pf = await getSharedPreferences();
    var data = pf.getString(key);
    if (data != null) {
      return jsonDecode(data);
    } else {
      return null;
    }
  }

  Future<bool> removeAllData() async {
    var pf = await getSharedPreferences();
    return pf.clear();
  }
}
