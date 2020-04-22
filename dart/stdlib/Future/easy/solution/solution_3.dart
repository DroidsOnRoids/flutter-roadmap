import 'dart:math';

void main() {
  print('Loading message...');

  _fetchMessage()
      .then((value) => print(value))
      .catchError((error) => print("Ups! Something went wrong."));
}

Future<String> _fetchMessage() => Future.delayed(Duration(seconds: 2), () {
      final isError = Random().nextBool();

      if (isError) {
        throw Error();
      } else {
        return "Dart is easy";
      }
    });
