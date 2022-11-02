import 'package:flutter/material.dart';

import '../../models/transferencia.dart';
import 'formulario.dart';
import 'item.dart';

const String _tituloAppBar = "Transferências";

class ListaTransferencia extends StatefulWidget {
  const ListaTransferencia({super.key});

  @override
  State<ListaTransferencia> createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: ((context, indice) {
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Future future = _navegarParaFormularioTransferencia(context);
          future.then(
              (transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _atualiza(transferenciaRecebida) {
    // delay de 1 segundo
    //Future.delayed(const Duration(seconds: 1), () {
    if (transferenciaRecebida != null) {
      setState(() {
        _transferencias.add(transferenciaRecebida);
      });
    }
    //});
  }

  Future _navegarParaFormularioTransferencia(BuildContext context) {
    Future future = Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const FormularioTransferencia();
      },
    ));

    return future;
  }
}
