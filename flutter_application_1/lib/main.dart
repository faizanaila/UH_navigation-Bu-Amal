import 'package:flutter/material.dart';
import 'package:flutter_application_1/halvoucher.dart';
import 'package:flutter_application_1/katalog.dart';
import 'package:flutter_application_1/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/katalog': (context) => const KatalogPage(),
        '/halvoucher': (context) => const HalVoucherPage(),
      },
    );
  }
}