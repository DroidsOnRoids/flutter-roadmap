import 'dart:math';

import 'package:flutter/material.dart';

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
            _buildMessageWidget(),
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

  Widget _buildMessageWidget() => FutureBuilder<String>(
        future: _fetchMessage(),
        builder: (context, snapshot) {
          final message = snapshot.connectionState == ConnectionState.waiting
              ? 'Loading message...'
              : snapshot.hasError
                  ? 'Ups! Something went wrong.'
                  : snapshot.data;

          return Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.display1,
          );
        },
      );

  Future<String> _fetchMessage() => Future.delayed(Duration(seconds: 2), () {
        final isError = Random().nextBool();

        if (isError) {
          throw Error();
        } else {
          return "Dart is easy!";
        }
      });
}
