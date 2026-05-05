import 'package:flutter/material.dart';
import '../exercises/ejercicio11.dart';

class Ejercicio11Screen extends StatefulWidget {
  const Ejercicio11Screen({super.key});

  @override
  State<Ejercicio11Screen> createState() => _Ejercicio11ScreenState();
}

class _Ejercicio11ScreenState extends State<Ejercicio11Screen> {
  final TextEditingController _c1 = TextEditingController();
  final TextEditingController _c2 = TextEditingController();
  final TextEditingController _c3 = TextEditingController();
  final TextEditingController _c4 = TextEditingController();
  String _resultado = '';
  bool _mostrarBotones = false;

  void _calcular() {
    final n1 = double.tryParse(_c1.text);
    final n2 = double.tryParse(_c2.text);
    final n3 = double.tryParse(_c3.text);
    final n4 = double.tryParse(_c4.text);
    if (n1 == null || n2 == null || n3 == null || n4 == null) {
      setState(() {
        _resultado = 'Por favor ingresa 4 números válidos.';
        _mostrarBotones = false;
      });
      return;
    }
    final ejercicio = AverageOfFour(n1, n2, n3, n4);
    setState(() {
      _resultado = ejercicio.calcular();
      _mostrarBotones = true;
    });
  }

  void _nuevaOperacion() {
    setState(() {
      _c1.clear();
      _c2.clear();
      _c3.clear();
      _c4.clear();
      _resultado = '';
      _mostrarBotones = false;
    });
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade500),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF00E5FF)),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF00E5FF), width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 11: Average of Four'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2E),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF69FF47)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('¿Qué hace este ejercicio?',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF69FF47))),
                  SizedBox(height: 8),
                  Text(
                    '• Pide 4 números al usuario\n'
                    '• Calcula el promedio con un bucle for\n'
                    '• Muestra el resultado',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Ingresa el número 1:',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            const SizedBox(height: 8),
            TextField(
              controller: _c1,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDecoration('Ejemplo: 2'),
            ),
            const SizedBox(height: 12),
            const Text('Ingresa el número 2:',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            const SizedBox(height: 8),
            TextField(
              controller: _c2,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDecoration('Ejemplo: 4'),
            ),
            const SizedBox(height: 12),
            const Text('Ingresa el número 3:',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            const SizedBox(height: 8),
            TextField(
              controller: _c3,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDecoration('Ejemplo: 6'),
            ),
            const SizedBox(height: 12),
            const Text('Ingresa el número 4:',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            const SizedBox(height: 8),
            TextField(
              controller: _c4,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDecoration('Ejemplo: 8'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00E5FF),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Calcular',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            if (_resultado.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E2E),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF00E5FF)),
                ),
                child: Text(_resultado,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00E5FF))),
              ),
            const SizedBox(height: 20),
            if (_mostrarBotones) ...[
              ElevatedButton(
                onPressed: _nuevaOperacion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF69FF47),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Nueva operación',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5252),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Salir al menú',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
