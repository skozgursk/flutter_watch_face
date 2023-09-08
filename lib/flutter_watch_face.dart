
import 'package:flutter/cupertino.dart';

import 'flutter_watch_face_platform_interface.dart';

class FlutterWatchFace {
  Future<bool?> addWatchFace(String url) {
    return FlutterWatchFacePlatform.instance.addWatchFace(url);
  }
}
