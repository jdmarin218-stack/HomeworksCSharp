class VowelCounter {
  final String palabra;

  // Constructor
  VowelCounter(this.palabra);

  String calcular() {
    List<String> vocales = ['a','e','i','o','u','á','é','í','ó','ú'];
    int contador = 0;
    List<String> vocalesEncontradas = [];
    String palabraMin = palabra.toLowerCase();
    // for para recorrer cada letra
    for (int i = 0; i < palabraMin.length; i++) {
      int j = 0;
      do {
        if (palabraMin[i] == vocales[j]) {
          contador++;
          vocalesEncontradas.add(palabraMin[i]);
          break;
        }
        j++;
      } while (j < vocales.length);
    }
    return 'Resultado: $contador vocal${contador == 1 ? '' : 'es'}\nVocales encontradas: ${vocalesEncontradas.join(', ')}';
  }
}
