import 'dart:convert';

import 'package:badydoces/models/admin.model.dart';
import 'package:badydoces/repositories/admin_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static AuthController instance = AuthController();
  final AdminRepository repository = AdminRepository();

  Admin usuario = new Admin();

  Future<bool> login() async {
    bool isLogged = false;
    repository.admin = usuario;
    isLogged = await repository.login();
    notifyListeners();
    return isLogged;
  }

  Future<Admin> autenticar() async {
    final SharedPreferences prefs = await _prefs;

    usuario = Admin.fromJson(jsonDecode(prefs.getString('user')));
    notifyListeners();
    return usuario;
  }
}
