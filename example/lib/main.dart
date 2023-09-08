import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';


import 'package:flutter/services.dart';
import 'package:flutter_watch_face/flutter_watch_face.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterWatchFacePlugin = FlutterWatchFace();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _flutterWatchFacePlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
            child: const Text('hehe'),
            onPressed: () async {
              try {
                // You can get data from anywhere, On this example I am getting it from assets
                final ByteData kimi = await rootBundle.load("assets/Astronomy.watchface");
                final Uint8List bytes = kimi.buffer.asUint8List();

                final Directory tempDir = await getTemporaryDirectory();
                final String tempFilePath = '${tempDir.path}/${"Astronomy.watchface".split('/').last}';

                final File tempFile = File(tempFilePath);
                await tempFile.writeAsBytes(bytes, flush: true);

                //add your file path to addWatchFace function
                _flutterWatchFacePlugin.addWatchFace(tempFile.path);
              } catch(e) {
                print('An error occurred: $e');
              }
            },
          ),
        ),
      ),
    );
  }
}
