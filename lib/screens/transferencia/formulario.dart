import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

const String _tituloAppBar = "Criando Transferência";
const String _rotuloNumeroConta = "Número da Conta";
const String _dicaNumeroConta = "0000";
const String _rotuloValor = "Valor";
const String _dicaValor = "0.00";
const String _textoBotaoConfirmar = "Confirmar";

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
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorNumeroConta,
              rotulo: _rotuloNumeroConta,
              dica: _dicaNumeroConta,
            ),
            Editor(
                controlador: _controladorValor,
                rotulo: _rotuloValor,
                dica: _dicaValor,
                icone: Icons.monetization_on),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: const Text(_textoBotaoConfirmar),
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
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
