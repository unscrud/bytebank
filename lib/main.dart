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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorNumeroConta,
              style: const TextStyle(fontSize: 24.0),
              decoration: const InputDecoration(
                labelText: "Número da conta",
                hintText: "0000",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorValor,
              style: const TextStyle(fontSize: 24.0),
              decoration: const InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: "Valor",
                hintText: "0.00",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
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
