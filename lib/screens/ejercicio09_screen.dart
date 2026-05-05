import 'package:flutter/material.dart';
import '../exercises/ejercicio09.dart';

class Ejercicio09Screen extends StatefulWidget {
  const Ejercicio09Screen({super.key});

  @override
  State<Ejercicio09Screen> createState() => _Ejercicio09ScreenState();
}

class _Ejercicio09ScreenState extends State<Ejercicio09Screen> {
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _den1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();
  final TextEditingController _den2 = TextEditingController();
  String _resultado = '';
  bool _mostrarBotones = false;

  void _calcular() {
    final n1 = int.tryParse(_num1.text);
    final d1 = int.tryParse(_den1.text);
    final n2 = int.tryParse(_num2.text);
    final d2 = int.tryParse(_den2.text);
    if (n1 == null || d1 == null || n2 == null || d2 == null) {
      setState(() {
        _resultado = 'Por favor ingresa números válidos.';
        _mostrarBotones = false;
      });
      return;
    }
    if (d1 == 0 || d2 == 0) {
      setState(() {
        _resultado = 'El denominador no puede ser 0.';
        _mostrarBotones = false;
      });
      return;
    }
    final ejercicio = FractionDifference(n1, d1, n2, d2);
    setState(() {
      _resultado = ejercicio.calcular();
      _mostrarBotones = true;
    });
  }

  void _nuevaOperacion() {
    setState(() {
      _num1.clear();
      _den1.clear();
      _num2.clear();
      _den2.clear();
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
        title: const Text('Ejercicio 09: Fraction Difference'),
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
                    '• Ingresa dos fracciones (numerador y denominador)\n'
                    '• Calcula la diferencia entre ellas\n'
                    '• Muestra el resultado simplificado',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Primera fracción:',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _num1,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Numerador (1)'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('/',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                ),
                Expanded(
                  child: TextField(
                    controller: _den1,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Denominador (2)'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Segunda fracción:',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _num2,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Numerador (1)'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('/',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                ),
                Expanded(
                  child: TextField(
                    controller: _den2,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration('Denominador (3)'),
                  ),
                ),
              ],
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
