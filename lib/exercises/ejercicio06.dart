class TaxCalculator {
  final double salario;

  // Constructor
  TaxCalculator(this.salario);

  String calcular() {
    if (salario > 12000) {
      double impuesto = (salario - 12000) * 0.15;
      return 'Resultado: ${impuesto.toStringAsFixed(0)}';
    } else {
      return 'Resultado: No debe impuestos.';
    }
  }
}
