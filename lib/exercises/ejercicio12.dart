class SmallestOfFive {
  final List<double> numeros;

  // Constructor
  SmallestOfFive(this.numeros);

  String calcular() {
    double menor = numeros[0];
    // for para encontrar el menor
    for (int i = 1; i < numeros.length; i++) {
      if (numeros[i] < menor) {
        menor = numeros[i];
      }
    }
    if (menor == menor.truncateToDouble()) {
      return 'Resultado: ${menor.toInt()}';
    }
    return 'Resultado: $menor';
  }
}
