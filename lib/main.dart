import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: const <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text("200.0"),
                  subtitle: Text("3000.0"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text("200.0"),
                  subtitle: Text("1000.0"),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text("200.0"),
                  subtitle: Text("2000.0"),
                ),
              ),
            ],
          ),
          appBar: AppBar(
            title: const Text("Transferências"),
          ),
        ),
      ),
    );
