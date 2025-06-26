// lib/main.dart

import 'package:flutter/material.dart';
import 'package:pasar_kilat/presentation/screens/home_page.dart';      // <-- Path Diperbaiki
import 'package:pasar_kilat/presentation/screens/login_page.dart';    // <-- Path Diperbaiki
import 'package:pasar_kilat/presentation/screens/register_page.dart'; // <-- Path Diperbaiki
import 'package:pasar_kilat/core/colors.dart';                         // <-- Path Diperbaiki

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pasar Kilat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      // Rute navigasi tetap sama, karena hanya nama
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}