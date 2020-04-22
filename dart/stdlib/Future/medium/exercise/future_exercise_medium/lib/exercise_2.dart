import 'package:flutter/material.dart';

/// Managing multiple Futures.
///
/// Start with completing exercise_1.
/// Combine futures with message's parts
/// and join return values to have one String finally.
/// Display return value in `Text` widget inside the Column.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Future Exercise'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// Add `Text` widget wrapped in `FutureBuilder`
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        child: Icon(Icons.refresh),
      ),
    );
  }

  void _refresh() => setState(() {});

  Future<String> _fetchMessageFirstPart() => Future.delayed(
        Duration(seconds: 2),
        () => "Dart",
      );

  Future<String> _fetchMessageSecondPart() => Future.delayed(
        Duration(seconds: 1),
        () => "is",
      );

  Future<String> _fetchMessageThirdPart() => Future.delayed(
        Duration(seconds: 3),
        () => "easy!",
      );
}
