package com.droidsonroids.channels

import android.os.Bundle
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private lateinit var channel: BasicMessageChannel<String>

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        channel = BasicMessageChannel(messenger, "greeter", StringCodec.INSTANCE)
        channel.setMessageHandler { _, reply ->
            reply.reply("Android")
        }
    }

    override fun onDestroy() {
        channel.setMessageHandler(null)
        super.onDestroy()
    }
}
