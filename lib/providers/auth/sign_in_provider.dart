import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  bool _checkboxValue = false;
  bool _isLoading = false;
  bool _validateData = false;
  bool hiddenPassword = true;
  final Map<String, dynamic> data = {
    'email': '',
    'password': '',
  };

  bool get checkboxValue => _checkboxValue;
  set checkboxValue(bool value) {
    _checkboxValue = value;
    notifyListeners();
  }

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
