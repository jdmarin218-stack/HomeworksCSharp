class RemainderFinder {
  final int dividendo;
  final int divisor;

  // Constructor
  RemainderFinder(this.dividendo, this.divisor);

  String calcular() {
    if (divisor == 0) {
      return 'Error: El divisor no puede ser 0.';
    }
    int residuo = dividendo % divisor;
    return 'Resultado: $residuo';
  }
}
