import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _validateData = false;
  bool hiddenPassword = true;
  final Map<String, dynamic> data = {
    'name': '',
    'surname': '',
    'second_surname': '',
    'email': '',
    'password': '',
  };

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get validateData => _validateData;
  set validateData(bool value) {
    _validateData = value;
    notifyListeners();
  }

  void showPassword() {
    hiddenPassword = !hiddenPassword;
    notifyListeners();
  }

  void checkEmptyData() {
    if (data['email'] != '' && data['password'] != '') {
      validateData = true;
    } else {
      validateData = false;
    }
  }
}
