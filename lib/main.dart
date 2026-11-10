import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopEase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF6C63FF),
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        fontFamily: 'Poppins',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
        ),
      ),
      home: const MainScreen(),
    );
  }
}