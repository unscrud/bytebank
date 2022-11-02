import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({super.key});

  @override
  State<FormularioTransferencia> createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorNumeroConta = TextEditingController();

  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criando Transferência"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorNumeroConta,
                rotulo: "Número da Conta",
                dica: "0000"),
            Editor(
                controlador: _controladorValor,
                rotulo: "Valor",
                dica: "0.00",
                icone: Icons.monetization_on),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: const Text("Confirmar"),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double? valor = double.tryParse(_controladorValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint("Criando transferência...");
      debugPrint("$transferenciaCriada");
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
