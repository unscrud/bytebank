import 'package:flutter/material.dart';

void main() => runApp(
      Column(
        children: const <Widget>[
          Text(
            "TEXTO 1",
            textDirection: TextDirection.ltr,
          ),
          Text(
            "TEXTO 2",
            textDirection: TextDirection.rtl,
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain,
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    );
