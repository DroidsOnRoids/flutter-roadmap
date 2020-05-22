import 'dart:async';

Future<void> main() async {
  print('Loading message...');

  final message = await _fetchMessage();
  print(message);
}

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
