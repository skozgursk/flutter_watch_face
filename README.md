# Flutter Add Watchface

**flutter_watch_face** is a Flutter plugin that allows you to add custom watch faces to iOS devices using the ClockKit library and the `CLKWatchFaceLibrary` class. This plugin is intended for iOS only and requires a minimum iOS version of 14.0 or higher.

## Features

- Easily integrate custom watch faces into your Flutter app for iOS devices.
- Seamlessly interact with the ClockKit library to display watch faces on Apple Watches.

## Installation

To use **flutter_watch_face** in your Flutter project, follow these steps:

1. Add the following dependency to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     flutter_watch_face: ^0.0.1
   ```
2. Run flutter pub get to fetch the package.

## Usage

Import the package in your Dart code:

```dart
    import 'package:flutter_watch_face/flutter_watch_face.dart';
```

## Adding a Watch Face
To add a watch face to an iOS device, you can use the following code:

```dart
    final _flutterWatchFacePlugin = FlutterWatchFace();
    _flutterWatchFacePlugin.addWatchFace(file.path);
```

Make sure to run this code on an iOS device running iOS 14.0 or higher.

## Example
For a complete example of how to use flutter_watch_face, check out the example project provided in this repository.

## Issues and Contributions
If you encounter any issues with this plugin or would like to contribute to its development, please visit the GitHub repository. We welcome your feedback and contributions!

## License
This plugin is licensed under the MIT License.

