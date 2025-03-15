import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
	// Use API Key from Generated.xcconfig
	if let apiKey = Bundle.main.object(forInfoDictionaryKey: "MAPS_API_KEY") as? String {
		GMSServices.provideAPIKey(apiKey)
	}
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
