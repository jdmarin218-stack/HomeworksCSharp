import 'dart:math';

class CirclePerimeter {
  final double radio;

  // Constructor
  CirclePerimeter(this.radio);

  String calcular() {
    if (radio < 0) {
      return 'El radio no puede ser negativo.';
    }
    double perimetro = 2 * pi * radio;
    return 'Resultado: ${perimetro.toStringAsFixed(2)}';
  }
}
