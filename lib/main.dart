import 'package:flutter/material.dart';
import 'package:sales_app/routes/routes.dart';
import 'package:sales_app/themes/my_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.signInScreen,
      routes: AppRoutes.routes,
      theme: MyTheme.myTheme,
      title: 'Sales App',
    );
  }
}
