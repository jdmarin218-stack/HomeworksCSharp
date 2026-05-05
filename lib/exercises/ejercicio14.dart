class FactorialFinder {
  final int numero;

  // Constructor
  FactorialFinder(this.numero);

  String calcular() {
    if (numero < 0) {
      return 'El factorial no está definido para números negativos.';
    }
    int factorial = 1;
    // for para calcular el factorial
    for (int i = 1; i <= numero; i++) {
      factorial *= i;
    }
    return 'Resultado: $factorial';
  }
}
