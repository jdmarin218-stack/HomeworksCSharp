class FractionDifference {
  final int num1;
  final int den1;
  final int num2;
  final int den2;

  // Constructor
  FractionDifference(this.num1, this.den1, this.num2, this.den2);

  int _mcd(int a, int b) {
    // while para calcular el máximo común divisor
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  String calcular() {
    int numRes = (num1 * den2) - (num2 * den1);
    int denRes = den1 * den2;

    if (numRes == 0) {
      return 'Resultado: 0';
    }

    int divisor = _mcd(numRes.abs(), denRes.abs());
    return 'Resultado: ${numRes ~/ divisor}/${denRes ~/ divisor}';
  }
}
