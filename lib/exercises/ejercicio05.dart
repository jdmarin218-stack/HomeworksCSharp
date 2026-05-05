class MidweekDay {
  final int numero;

  // Constructor
  MidweekDay(this.numero);

  String calcular() {
    List<String> dias = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes'];
    if (numero >= 1 && numero <= 5) {
      // for para recorrer los días
      for (int i = 0; i < dias.length; i++) {
        if (i + 1 == numero) {
          return 'Resultado: ${dias[i]}';
        }
      }
    } else if (numero == 6 || numero == 7) {
      return 'Resultado: Número fuera del rango laboral.';
    }
    return 'Resultado: Número inválido (1-7).';
  }
}
