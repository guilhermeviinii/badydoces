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
  bool get isLoggedUser => isLogged;

  Future<bool> login() async {
    try {
      repository.admin = usuario;
      isLogged = await repository.login();
      notifyListeners();
      return isLogged;
    } catch (err) {}
  }

  Future<Admin> autenticar() async {
    try {
      final SharedPreferences prefs = await _prefs;
      print(prefs);
      this.usuario = Admin.fromJson(jsonDecode(prefs.getString('user')));
      isLogged = true;
      notifyListeners();
    } catch (err) {
      print(err);
      isLogged = false;
      notifyListeners();
    }
  }

  Future<void> logout(context) async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
    print(prefs);
    Navigator.of(context).pushNamed('/');
  }
}
