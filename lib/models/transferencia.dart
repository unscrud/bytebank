class Transferencia {
  final double _valor;
  final int _numeroConta;

  const Transferencia(this._valor, this._numeroConta);

  get valor => _valor;
  get numeroConta => _numeroConta;

  @override
  String toString() {
    return "Transferencia{valor: $_valor, numeroConta: $_numeroConta}";
  }
}
