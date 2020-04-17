import 'package:flutter/material.dart';
import 'package:channels/greeter.dart';

class GreeterApp extends StatelessWidget {
  final Greeter _greeter;

  GreeterApp(this._greeter);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: createGreeterScreen(_greeter),
    );
  }
}
