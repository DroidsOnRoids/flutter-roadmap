import 'dart:math';

/// Handle situation when `_fetchMessage` method completes with error.
/// Print `Ups! Something went wrong.` on error and message value on success.
/// Run `dart exercise_3.dart` in terminal couple of times and check success and error cases.

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