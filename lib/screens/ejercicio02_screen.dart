import 'package:flutter/material.dart';
import '../exercises/ejercicio02.dart';

class Ejercicio02Screen extends StatefulWidget {
  const Ejercicio02Screen({super.key});

  @override
  State<Ejercicio02Screen> createState() => _Ejercicio02ScreenState();
}

class _Ejercicio02ScreenState extends State<Ejercicio02Screen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _resultado = '';
  bool _mostrarBotones = false;

  void _calcular() {
    final input1 = int.tryParse(_controller1.text);
    final input2 = int.tryParse(_controller2.text);
    if (input1 == null || input2 == null) {
      setState(() {
        _resultado = 'Por favor ingresa números válidos.';
        _mostrarBotones = false;
      });
      return;
    }
    final ejercicio = DoubleOrTriple(input1, input2);
    setState(() {
      _resultado = ejercicio.calcular();
      _mostrarBotones = true;
    });
  }

  void _nuevaOperacion() {
    setState(() {
      _controller1.clear();
      _controller2.clear();
      _resultado = '';
      _mostrarBotones = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 2 - Double or Triple'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Ingresa el primer número:',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            const SizedBox(height: 12),
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Ejemplo: 4',
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
            const SizedBox(height: 16),
            const Text('Ingresa el segundo número:',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            const SizedBox(height: 12),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Ejemplo: 3',
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
