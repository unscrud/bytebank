import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: const ListaTransferencia(),
          appBar: AppBar(
            title: const Text("Transferências"),
          ),
        ),
      ),
    );

class ListaTransferencia extends StatelessWidget {
  const ListaTransferencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ItemTransferencia("420.0", "1000"),
        ItemTransferencia("577.0", "1234"),
        ItemTransferencia("288.5", "2345"),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final String valor;
  final String numeroConta;

  const ItemTransferencia(this.valor, this.numeroConta, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(valor),
        subtitle: Text(numeroConta),
      ),
    );
  }
}
