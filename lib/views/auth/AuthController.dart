import 'dart:convert';

import 'package:badydoces/models/admin.model.dart';
import 'package:badydoces/repositories/admin_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final AdminRepository repository = AdminRepository();

  Admin usuario = Admin();
  Admin get user => usuario;
  bool isLogged;
  bool loading;

  Future<bool> login() async {
    loading = true;
    repository.admin = usuario;
    isLogged = await repository.login();
    loading = false;
    notifyListeners();
    return isLogged;
  }

  Future<Admin> autenticar() async {
    loading = true;
    try {
      final SharedPreferences prefs = await _prefs;

      usuario = Admin.fromJson(jsonDecode(prefs.getString('user')));
      isLogged = true;
    } catch (err) {
      isLogged = false;
    }
    loading = false;
    notifyListeners();
  }
}
