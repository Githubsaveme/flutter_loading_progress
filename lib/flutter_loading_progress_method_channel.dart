import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_loading_progress_platform_interface.dart';

/// An implementation of [FlutterLoadingProgressPlatform] that uses method channels.
class MethodChannelFlutterLoadingProgress extends FlutterLoadingProgressPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_loading_progress');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
