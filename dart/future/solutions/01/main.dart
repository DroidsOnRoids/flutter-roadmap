Future<void> main() async {
  print('Loading message...');
  String message = await _fetchMessage();
  print(message);
}

Future<String> _fetchMessage() => Future.delayed(
      Duration(seconds: 2),
      () => "Dart is easy",
    );
