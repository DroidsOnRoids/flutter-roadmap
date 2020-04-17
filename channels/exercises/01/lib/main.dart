import 'dart:io';

import 'package:flutter/material.dart';
import 'package:channels/greeter.dart';
import 'package:channels/greeter_app.dart';

void main() {
  runApp(GreeterApp(_NonChannelGreeter()));
}

class _NonChannelGreeter implements Greeter {
  @override
  Future<String> greet(String text) async {
    var platform = 'a stragner';
    if (Platform.isAndroid) {
      platform = 'Android';
    } else if (Platform.isIOS) {
      platform = 'iOS';
    }
    return '$text $platform!';
  }
}

class _ChannelGreeter implements Greeter {
  @override
  Future<String> greet(String text) {
    throw UnimplementedError('TODO');
  }
}
