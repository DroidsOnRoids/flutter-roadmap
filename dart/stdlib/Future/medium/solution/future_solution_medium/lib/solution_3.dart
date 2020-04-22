import 'dart:async';
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
            FutureBuilder<String>(
              future: _fetchMessageWithTimeout(),
              builder: (context, snapshot) {
                var message = '';

                if (snapshot.connectionState == ConnectionState.waiting) {
                  message = 'Loading message...';
                } else if (snapshot.hasError) {
                  if (snapshot.error is TimeoutException) {
                    message = (snapshot.error as TimeoutException).message;
                  } else {
                    message = 'Ups! Something went wrong.';
                  }
                } else if (snapshot.hasData) {
                  message = snapshot.data;
                }

                return Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
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

  Future<String> _fetchMessageWithTimeout() => _fetchMessage().timeout(
        Duration(seconds: 2),
        onTimeout: () => Future.error(
          TimeoutException('Fetching message took too long!'),
        ),
      );

  Future<String> _fetchMessage() => Future.delayed(Duration(seconds: 10), () {
        final isError = Random().nextBool();

        if (isError) {
          throw Error();
        } else {
          return "Dart is easy!";
        }
      });
}
