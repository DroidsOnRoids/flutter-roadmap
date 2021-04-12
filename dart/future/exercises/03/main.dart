import 'dart:math';

void main() {
  print('Loading message...');

  _fetchMessage();
}

Future<String> _fetchMessage() =>
    Future.delayed(Duration(seconds: 2), () {
      final isError = Random().nextBool();

      if (isError) {
        throw Error();
      } else {
        return "Dart is easy";
      }
    });