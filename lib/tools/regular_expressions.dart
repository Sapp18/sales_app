
class RegularExpressions {
  static String email =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  //La expresion regular password, requiere 1 mayúscula, 1 número y al menos 8 digitos
  static String password =
      r'^(?=(?:.*\d){1})(?=(?:.*[A-Z]){1})(?=(?:.*[a-z]){2})\S{8,}$';
  static String password2 =
      r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040\.])(?=.*[A-Z])(?=.*[a-z])\S{8,}$';
  static String singnos = r'^(?=.*[\u0021-\u002b\u003c-\u0040\.])';

  static String capitalLetter = r'^(?=(?:.*[A-Z]){1})\S{1,}$';

  static String minimunOneNumber = r'^(?=(?:.*\d){1})\S{1,}$';

  static String curp =
      r'^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$';

  static String interbankCode = r'^[0-9]{18}$';

  static String interbankCodeCensured = r'^[0-9]{14}';

  static String nombreyapellidos = r'^[a-zA-Z ]*$';

  String? validatePercentage(String? value, int value2) {
    final intNumber = int.tryParse(value!);
    if (intNumber == null) {
      return 'Campo obligatorio';
    } else if (value2 < 0) {
      return 'Número incorrecto';
    }
    return null;
  }

  String? validatePercentage2(String? value, int value2) {
    final intNumber = int.tryParse(value!);
    if (intNumber == null) {
      return null;
    } else if (value2 < 0) {
      return null;
    }
    return null;
  }

  String? requiredField(String? value) {
    if (value == null || value == '0') {
      return 'Campo obligatorio';
    }
    return value.isEmpty ? 'Campo obligatorio' : null;
  }

  String? validateEmail(value) {
    RegExp regExp = RegExp(email);
    return regExp.hasMatch(value ?? '') ? null : 'Correo incorrecto';
  }

  String? validatePassword(value) {
    // RegExp regExp = RegExp(password);
    RegExp regExp = RegExp(password2);

    return regExp.hasMatch(value ?? '') ? null : 'Contraseña incorrecta';
  }

  String? validateCurp(value) {
    RegExp regExp = RegExp(curp);
    return regExp.hasMatch(value ?? '') ? null : 'CURP incorrecto';
  }

  String? validateInterbankCode(value) {
    RegExp regExp = RegExp(interbankCode);
    return regExp.hasMatch(value ?? '')
        ? null
        : 'Código interbancario incorrecto';
  }

  String? validateInterbankCodeCensured(value) {
    RegExp regExp = RegExp(interbankCodeCensured);
    return regExp.hasMatch(value ?? '')
        ? null
        : 'Código interbancario incorrecto';
  }

  String? validatePhoneNumber(value) {
    if (value!.length > 9) {
      return null;
    }
    return 'Número incorrecto';
  }

  String? validateMinLength(value, int minLength) {
    RegExp regExp = RegExp(nombreyapellidos);
    if (value!.length >= minLength) {
      return regExp.hasMatch(value ?? '') ? null : 'Solamente letras por favor';
    }
    return 'Mínimo: $minLength caracteres';
  }

  bool validateCapitalLetter(value) {
    RegExp regExp = RegExp(capitalLetter);
    return regExp.hasMatch(value) ? true : false;
  }

  bool validateNumber(value) {
    RegExp regExp = RegExp(minimunOneNumber);
    return regExp.hasMatch(value) ? true : false;
  }

  bool validatesigno(value) {
    RegExp regExp = RegExp(singnos);
    return regExp.hasMatch(value) ? true : false;
  }

  // String convertToAmounts(double numero) {
  //   NumberFormat f = NumberFormat("#,###.0#", "es_MX");
  //   String result = f.format(numero);
  //   return result;
  // }
}
