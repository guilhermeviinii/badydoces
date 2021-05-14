import 'package:badydoces/models/admin.model.dart';

import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AdminRepository extends ChangeNotifier {
  List<Admin> admins = List<Admin>();

  AdminRepository() {
    read();
  }

  Future<void> read() async {
    var response = await http.get('');
    if (response.statusCode == 200) {
      Iterable admins = jsonDecode(response.body) as List;
      var lista = admins.map((objeto) => Admin.fromJson(objeto));
      this.admins = lista.toList();
      notifyListeners();
    }
  }
}
