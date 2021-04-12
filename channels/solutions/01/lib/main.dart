import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:channels/greeter.dart';
import 'package:channels/greeter_app.dart';

void main() {
  runApp(GreeterApp(_ChannelGreeter()));
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
  final _channel = BasicMessageChannel<String?>('greeter', StringCodec());

  @override
  Future<String> greet(String text) async => '$text ${await _channel.send(text)}!';
}
