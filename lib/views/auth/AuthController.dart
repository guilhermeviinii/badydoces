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

  Future<bool> login() async {
    isLogged = false;
    repository.admin = usuario;
    isLogged = await repository.login();
    notifyListeners();
    return isLogged;
  }

  Future<Admin> autenticar() async {
    try {
      final SharedPreferences prefs = await _prefs;

      usuario = Admin.fromJson(jsonDecode(prefs.getString('user')));
      isLogged = true;
    } catch (err) {
      isLogged = false;
    }
    notifyListeners();
  }
}
