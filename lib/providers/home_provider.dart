import 'package:flutter/material.dart';
import 'package:sales_app/services/api_client.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getData();
  }

  Future<List> getData() async {
    final List resp = await ApiClient.getAPI('categories');
    return resp;
  }
}
