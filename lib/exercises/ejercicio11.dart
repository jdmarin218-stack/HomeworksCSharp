class AverageOfFour {
  final double n1;
  final double n2;
  final double n3;
  final double n4;

  // Constructor
  AverageOfFour(this.n1, this.n2, this.n3, this.n4);

  String calcular() {
    double suma = 0;
    List<double> numeros = [n1, n2, n3, n4];
    // for para sumar los 4 números
    for (int i = 0; i < numeros.length; i++) {
      suma += numeros[i];
    }
    double promedio = suma / 4;
    if (promedio == promedio.truncateToDouble()) {
      return 'Resultado: ${promedio.toInt()}';
    }
    return 'Resultado: $promedio';
  }
}
