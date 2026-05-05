import 'dart:math';

class RootOrSquare {
  final double numero;

  // Constructor
  RootOrSquare(this.numero);

  String calcular() {
    if (numero > 0) {
      double raiz = sqrt(numero);
      if (raiz == raiz.truncateToDouble()) {
        return 'Resultado: ${raiz.toInt()}';
      } else {
        return 'Resultado: ${raiz.toStringAsFixed(4)}';
      }
    } else if (numero == 0) {
      return 'Resultado: 0';
    } else {
      return 'Resultado: ${(numero * numero).toInt()}';
    }
  }
}
