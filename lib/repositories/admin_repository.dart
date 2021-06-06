import 'package:badydoces/models/admin.model.dart';

import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AdminRepository extends ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Admin admin = Admin();

  AdminRepository() {}

  Future<bool> login() async {
    var url = Uri.parse('https://backend-badydoces.herokuapp.com/session');
    var response = await http.post(
      url,
      body: json.encode(admin.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final SharedPreferences prefs = await _prefs;
      final Admin user = Admin.fromJson(jsonDecode(response.body));
      await prefs.setString(
        "user",
        user.toString(),
      );
      return true;
    } else {
      return false;
    }
  }
}
