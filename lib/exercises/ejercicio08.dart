class SumOfEvens {
  // Constructor
  SumOfEvens();

  String calcular() {
    int suma = 0;
    // for para sumar pares del 1 al 50
    for (int i = 1; i <= 50; i++) {
      if (i % 2 == 0) {
        suma += i;
      }
    }
    return 'Resultado: $suma';
  }
}
