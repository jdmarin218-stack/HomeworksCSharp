class DoubleOrTriple {
  final int primero;
  final int segundo;

  // Constructor
  DoubleOrTriple(this.primero, this.segundo);

  String calcular() {
    if (primero > segundo) {
      return 'Resultado: ${primero * 2}';
    } else if (segundo > primero) {
      return 'Resultado: ${segundo * 3}';
    } else {
      return 'Resultado: ${primero * 2}';
    }
  }
}
