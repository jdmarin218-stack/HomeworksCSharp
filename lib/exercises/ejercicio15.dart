class InRangeValidator {
  final int numero;

  // Constructor
  InRangeValidator(this.numero);

  String calcular() {
    if (numero >= 10 && numero <= 20) {
      return 'Resultado: Está en el rango.';
    } else {
      return 'Resultado: Fuera del rango.';
    }
  }
}
