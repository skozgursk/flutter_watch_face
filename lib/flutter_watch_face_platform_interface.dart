import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_watch_face_method_channel.dart';

abstract class FlutterWatchFacePlatform extends PlatformInterface {
  /// Constructs a FlutterWatchFacePlatform.
  FlutterWatchFacePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterWatchFacePlatform _instance = MethodChannelFlutterWatchFace();

  /// The default instance of [FlutterWatchFacePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterWatchFace].
  static FlutterWatchFacePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterWatchFacePlatform] when
  /// they register themselves.
  static set instance(FlutterWatchFacePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> addWatchFace(String url) {
    throw UnimplementedError('addWatchFace() has not been implemented.');
  }
}
