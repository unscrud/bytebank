import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green[900],
          secondary: Colors.blueAccent[700],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(Colors.blueAccent.shade700),
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
        ),
      ),
      home: const Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}
