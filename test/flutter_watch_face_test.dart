import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_watch_face/flutter_watch_face.dart';
import 'package:flutter_watch_face/flutter_watch_face_platform_interface.dart';
import 'package:flutter_watch_face/flutter_watch_face_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterWatchFacePlatform
    with MockPlatformInterfaceMixin
    implements FlutterWatchFacePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterWatchFacePlatform initialPlatform = FlutterWatchFacePlatform.instance;

  test('$MethodChannelFlutterWatchFace is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterWatchFace>());
  });

  test('getPlatformVersion', () async {
    FlutterWatchFace flutterWatchFacePlugin = FlutterWatchFace();
    MockFlutterWatchFacePlatform fakePlatform = MockFlutterWatchFacePlatform();
    FlutterWatchFacePlatform.instance = fakePlatform;

    expect(await flutterWatchFacePlugin.getPlatformVersion(), '42');
  });
}
