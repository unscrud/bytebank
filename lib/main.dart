import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  const ListaTransferencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transferências"),
      ),
      body: Column(
        children: const <Widget>[
          ItemTransferencia(Transferencia(420.0, 1000)),
          ItemTransferencia(Transferencia(577.0, 1234)),
          ItemTransferencia(Transferencia(288.5, 2345)),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia._valor.toString()),
        subtitle: Text(_transferencia._numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double _valor;
  final int _numeroConta;

  const Transferencia(this._valor, this._numeroConta);

  @override
  String toString() {
    return "Transferencia{valor: $_valor, numeroConta: $_numeroConta}";
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  FormularioTransferencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criando Transferência"),
      ),
      body: Column(
        children: <Widget>[
          Editor(_controladorNumeroConta, "Número da Conta", "0000", null),
          Editor(_controladorValor, "Valor", "0.00", Icons.monetization_on),
          ElevatedButton(
            onPressed: () {
              final int? numeroConta =
                  int.tryParse(_controladorNumeroConta.text);
              final double? valor = double.tryParse(_controladorValor.text);
              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
            child: const Text("Confirmar"),
          ),
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final IconData? _icone;
  const Editor(this._controlador, this._rotulo, this._dica, this._icone,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controlador,
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: Icon(_icone),
          labelText: _rotulo,
          hintText: _dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
