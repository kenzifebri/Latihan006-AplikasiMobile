import 'package:flutter/material.dart';
import 'profile_page.dart';

void main() {
  runApp(const KenzieApp());
}

class KenzieApp extends StatelessWidget {
  const KenzieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portal Mahasiswa - Kenzie',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const ProfilePage(),
    );
  }
}