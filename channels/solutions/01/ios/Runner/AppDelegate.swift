import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    guard let controller : FlutterViewController = window?.rootViewController as? FlutterViewController else {
        fatalError("rootViewController is not type FlutterViewController")
    }
    let channel = FlutterBasicMessageChannel(name: "greeter",
                                             binaryMessenger: controller.binaryMessenger,
                                             codec: FlutterStringCodec.sharedInstance())
    channel.setMessageHandler { (_: Any?, reply: FlutterReply) -> Void in
        reply("iOS")
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
