import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/themes/themes.dart';

class CustomCircularProgressWidget extends StatelessWidget {
  const CustomCircularProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? const CircularProgressIndicator(color: ThemeColors.purple1)
          : const CupertinoActivityIndicator(radius: 20),
    );
  }
}
