import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;
  int get jumlahData => _data.length;

  late Uri url;

  void connectAPI(String id, BuildContext context) async {
    url = Uri.parse("https://reqres.in/api/users/" + id);
    var hasilResponse = await http.get(url);

    if (hasilResponse.statusCode == 200) {
      _data = (json.decode(hasilResponse.body))["data"];
      notifyListeners();
      handlingStatusCode(context, "Berhasil Get Data");
    } else {
      handlingStatusCode(context, "Gagal Get Data");
    }
  }

  void deleteData(BuildContext context) async {
    var hasilResponse = await http.delete(url);
    if (hasilResponse.statusCode == 204) {
      _data = {};
      notifyListeners();
      handlingStatusCode(context, "Berhasil Hapus Data !");
    } else {
      print("Gagal");
    }
  }

  handlingStatusCode(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ));
  }
}
