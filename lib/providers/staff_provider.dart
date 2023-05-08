import 'package:flutter/material.dart';
import 'package:sales_app/services/api_client.dart';

class StaffProvider extends ChangeNotifier {
  StaffProvider() {
    getData();
  }

  Future<List> getData() async {
    final List resp = await ApiClient.getAPI('users');
    return resp;
  }
}
