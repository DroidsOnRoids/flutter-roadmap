import 'package:async/async.dart';
import 'package:flutter/material.dart';

Widget createGreeterScreen(Greeter recognizer) {
  return _GreeterScreen(recognizer);
}

abstract class Greeter {
  Future<String> greet(String text);
}

class _GreeterScreen extends StatefulWidget {
  final Greeter recognizer;

  _GreeterScreen(this.recognizer);

  @override
  State<StatefulWidget> createState() => _GreeterScreenState(recognizer);
}

class _GreeterScreenState extends State<_GreeterScreen> {
  final Set<CancelableOperation> pendingOperations = {};
  final Greeter recognizer;
  final TextEditingController controller = TextEditingController(text: '');
  String platformGreeting = '';

  _GreeterScreenState(this.recognizer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Say Hello'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Say hello',
              labelText: 'Say hello',
            ),
            style: Theme.of(context).textTheme.headline,
          ),
          RaisedButton(
            onPressed: () => runTask(recognizePlatform(controller.value.text)),
            child: Text('Say hello!'),
          ),
          if (platformGreeting.isNotEmpty)
            Text(platformGreeting, style: Theme.of(context).textTheme.title)
        ].map((it) => Padding(padding: EdgeInsets.all(16), child: it)).toList(),
      ),
    );
  }

  Future<void> recognizePlatform(String text) async {
    final recognizedPlatform = await recognizer.greet(text);
    setState(() => platformGreeting = recognizedPlatform);
  }

  void runTask(Future<Object> task) {
    pendingOperations.add(CancelableOperation.fromFuture(task));
  }

  @override
  void dispose() {
    controller.dispose();
    for (final operation in pendingOperations) operation.cancel();
    super.dispose();
  }
}
