import 'package:flutter/material.dart';
import 'screens/ejercicio01_screen.dart';
import 'screens/ejercicio02_screen.dart';
import 'screens/ejercicio03_screen.dart';
import 'screens/ejercicio04_screen.dart';
import 'screens/ejercicio05_screen.dart';
import 'screens/ejercicio06_screen.dart';
import 'screens/ejercicio07_screen.dart';
import 'screens/ejercicio08_screen.dart';
import 'screens/ejercicio09_screen.dart';
import 'screens/ejercicio10_screen.dart';
import 'screens/ejercicio11_screen.dart';
import 'screens/ejercicio12_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homeworks Flutter',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFF69FF47),
          surface: Color(0xFF1E1E2E),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E2E),
          foregroundColor: Color(0xFF00E5FF),
        ),
        cardTheme: const CardThemeData(
          color: Color(0xFF1E1E2E),
        ),
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homeworks - Menú Principal'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildItem(context, '01', 'Positive Power', const Ejercicio01Screen()),
          _buildItem(context, '02', 'Double or Triple', const Ejercicio02Screen()),
          _buildItem(context, '03', 'Root or Square', const Ejercicio03Screen()),
          _buildItem(context, '04', 'Circle Perimeter', const Ejercicio04Screen()),
          _buildItem(context, '05', 'Midweek Day', const Ejercicio05Screen()),
          _buildItem(context, '06', 'Tax Calculator', const Ejercicio06Screen()),
          _buildItem(context, '07', 'Remainder Finder', const Ejercicio07Screen()),
          _buildItem(context, '08', 'Sum of Evens', const Ejercicio08Screen()),
          _buildItem(context, '09', 'Fraction Difference', const Ejercicio09Screen()),
          _buildItem(context, '10', 'String Length', const Ejercicio10Screen()),
          _buildItem(context, '11', 'Average of Four', const Ejercicio11Screen()),
          _buildItem(context, '12', 'Smallest of Five', const Ejercicio12Screen()),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String num, String titulo, Widget screen) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF00E5FF),
          child: Text(num,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        title: Text('Ejercicio $num: $titulo',
            style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF00E5FF)),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => screen),
        ),
      ),
    );
  }
}
