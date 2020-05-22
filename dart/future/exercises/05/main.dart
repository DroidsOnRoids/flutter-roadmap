import 'dart:math';
import 'dart:async';

Future<void> main() async {
  print('Loading message...');

  final message = await _fetchMessageWithTimeout();
  
  print(message);
}

Future<String> _fetchMessageWithTimeout() => _fetchMessage();

Future<String> _fetchMessage() => Future.delayed(
      Duration(seconds: 10),
      () => "Dart is easy!",
    );
