import 'dart:math';

import 'package:flutter/material.dart';

/// Future in UI tree.
///
/// Add `Text` widget as the `Column` child.
/// Text should display message got from `_fetchMessage` method.
/// Use FutureBuilder to handle asynchronous method in UI tree.
/// Set `Loading message...` text when message is loading.
/// Set 'Ups! Something went wrong.` text when error occurred.
/// Set fetched message as text in case of success.

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

  Future<String> _fetchMessage() => Future.delayed(Duration(seconds: 2), () {
        final isError = Random().nextBool();

        if (isError) {
          throw Error();
        } else {
          return "Dart is easy!";
        }
      });
}
