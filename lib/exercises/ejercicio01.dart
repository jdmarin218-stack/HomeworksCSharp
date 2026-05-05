class PositivePower {
  final int numero;

  // Constructor
  PositivePower(this.numero);

  String calcular() {
    if (numero > 0) {
      return 'Resultado: ${numero * numero}';
    } else if (numero == 0) {
      return 'Resultado: 0';
    } else {
      return 'Resultado: Número negativo.';
    }
  }
}
