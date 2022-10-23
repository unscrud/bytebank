import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      // floatingActionButton: const FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
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
  const FormularioTransferencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Título da AppBar!"),
      ),
      body: const Text("Corpo do Scaffold"),
    );
  }
}
