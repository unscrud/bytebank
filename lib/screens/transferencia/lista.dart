import 'package:flutter/material.dart';

import '../../models/transferencia.dart';
import 'formulario.dart';
import 'item.dart';

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
        title: const Text("Transferências"),
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
          future.then((transferenciaRecebida) {
            Future.delayed(const Duration(seconds: 1), () {
              debugPrint('Chegou no then do print');
              if (transferenciaRecebida != null) {
                debugPrint('$transferenciaRecebida');
                setState(() {
                  _transferencias.add(transferenciaRecebida);
                });
              }
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
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
