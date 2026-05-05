import 'package:flutter/material.dart';
import '../exercises/ejercicio03.dart';

class Ejercicio03Screen extends StatefulWidget {
  const Ejercicio03Screen({super.key});

  @override
  State<Ejercicio03Screen> createState() => _Ejercicio03ScreenState();
}

class _Ejercicio03ScreenState extends State<Ejercicio03Screen> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = '';
  bool _mostrarBotones = false;

  void _calcular() {
    final input = double.tryParse(_controller.text);
    if (input == null) {
      setState(() {
        _resultado = 'Por favor ingresa un número válido.';
        _mostrarBotones = false;
      });
      return;
    }
    final ejercicio = RootOrSquare(input);
    setState(() {
      _resultado = ejercicio.calcular();
      _mostrarBotones = true;
    });
  }

  void _nuevaOperacion() {
    setState(() {
      _controller.clear();
      _resultado = '';
      _mostrarBotones = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 03: Root or Square'),
      ),
      body: Padding(
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
                    '• Si el número es positivo → devuelve su raíz cuadrada\n'
                    '• Si el número es negativo → devuelve su cuadrado\n'
                    '• Si es 0 → devuelve 0',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Ingresa un número:',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Ejemplo: 9',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF00E5FF)),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF00E5FF), width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
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
