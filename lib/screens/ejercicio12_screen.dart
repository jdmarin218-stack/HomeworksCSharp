import 'package:flutter/material.dart';
import '../exercises/ejercicio12.dart';

class Ejercicio12Screen extends StatefulWidget {
  const Ejercicio12Screen({super.key});

  @override
  State<Ejercicio12Screen> createState() => _Ejercicio12ScreenState();
}

class _Ejercicio12ScreenState extends State<Ejercicio12Screen> {
  final List<TextEditingController> _controllers =
      List.generate(5, (_) => TextEditingController());
  String _resultado = '';
  bool _mostrarBotones = false;

  void _calcular() {
    List<double> numeros = [];
    // for para leer los 5 campos
    for (int i = 0; i < 5; i++) {
      final n = double.tryParse(_controllers[i].text);
      if (n == null) {
        setState(() {
          _resultado = 'Por favor ingresa 5 números válidos.';
          _mostrarBotones = false;
        });
        return;
      }
      numeros.add(n);
    }
    final ejercicio = SmallestOfFive(numeros);
    setState(() {
      _resultado = ejercicio.calcular();
      _mostrarBotones = true;
    });
  }

  void _nuevaOperacion() {
    setState(() {
      for (var c in _controllers) {
        c.clear();
      }
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
        title: const Text('Ejercicio 12: Smallest of Five'),
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
                    '• Pide 5 números al usuario\n'
                    '• Encuentra el más pequeño con un bucle for\n'
                    '• Muestra el resultado',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // for para generar los 5 campos
            ...List.generate(5, (i) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Número ${i + 1}:',
                    style: const TextStyle(fontSize: 16, color: Colors.white)),
                const SizedBox(height: 8),
                TextField(
                  controller: _controllers[i],
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration('Ejemplo: ${i + 1}'),
                ),
                const SizedBox(height: 12),
              ],
            )),
            const SizedBox(height: 8),
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
