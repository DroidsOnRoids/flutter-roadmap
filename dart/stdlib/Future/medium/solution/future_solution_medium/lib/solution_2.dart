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
              future: _fetchMessage(),
              builder: (context, snapshot) {
                final message =
                snapshot.connectionState == ConnectionState.waiting
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

  /// To combine a few futures into one we can use Future's `wait` static method.
  /// The value of the returned future will be a list of all the values that
  /// were produced in the order that the futures are provided by iterating.
  /// Finally returned values are joined into one String.
  Future<String> _fetchMessage() => Future.delayed(Duration(seconds: 2), () {
    var messagePartFutures = [
      _fetchMessageFirstPart(),
      _fetchMessageSecondPart(),
      _fetchMessageThirdPart()
    ];

    return Future.wait(messagePartFutures).then((value) => value.join(' '));
  });

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