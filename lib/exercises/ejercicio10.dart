class StringLength {
  final String palabra;

  // Constructor
  StringLength(this.palabra);

  String calcular() {
    int longitud = 0;
    // for para contar cada letra
    for (int i = 0; i < palabra.length; i++) {
      longitud++;
    }
    return 'Resultado: $longitud';
  }
}
