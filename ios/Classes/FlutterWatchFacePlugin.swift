import Flutter
import UIKit
import ClockKit
import WatchConnectivity
import Foundation

public class FlutterWatchFacePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_watch_face", binaryMessenger: registrar.messenger())
    let instance = FlutterWatchFacePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

 private func handleFlutterError(result: FlutterResult,message: String){
     result(FlutterError(code: "500", message: message, details: nil))
 }
    
    private func handleAddWatchFace(result: @escaping FlutterResult, fileName: String) {
        let library = CLKWatchFaceLibrary()
        
        let srcUrl: URL = URL(fileURLWithPath: "\(fileName).watchface")
        
        library.addWatchFace(at: srcUrl) { (error) in
            // Check for errors here.
            if let error = error {
                self.handleFlutterError(result: result, message: "*** An error occurred: \(error.localizedDescription) ***")
                return;
            }
        }
  }
    

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "addWatchFace":
        if let arguments = call.arguments as? [String: Any] {
            if arguments["url"] != nil {
                let url = arguments["url"] as? String ?? ""
                handleAddWatchFace(result: result, fileName: url)
                result(true)
            }
        }
        handleFlutterError(result: result, message: "url cant be null")
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
