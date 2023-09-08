import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_watch_face_platform_interface.dart';

/// An implementation of [FlutterWatchFacePlatform] that uses method channels.
class MethodChannelFlutterWatchFace extends FlutterWatchFacePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_watch_face');

  @override
  Future<bool?> addWatchFace(String url) async{
    try {
      final response = await methodChannel.invokeMethod<bool>('addWatchFace', {"url": url.replaceAll(".watchface", "")});
      return response;
    } catch(e) {
      print(e);
      return false;
    }
  }
}
