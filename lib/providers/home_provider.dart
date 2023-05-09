import 'package:flutter/material.dart';
import 'package:sales_app/services/api_client.dart';

class HomeProvider extends ChangeNotifier {
  Future<List> getCategories() async {
    final List resp = await ApiClient.getAPI('categories');
    return resp;
  }

  Future<List> getProducts() async {
    final List resp = await ApiClient.getAPI('products');
    return resp;
  }
}
