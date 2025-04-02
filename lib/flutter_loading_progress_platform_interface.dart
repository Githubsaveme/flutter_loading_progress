import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_loading_progress_method_channel.dart';

abstract class FlutterLoadingProgressPlatform extends PlatformInterface {
  /// Constructs a FlutterLoadingProgressPlatform.
  FlutterLoadingProgressPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLoadingProgressPlatform _instance = MethodChannelFlutterLoadingProgress();

  /// The default instance of [FlutterLoadingProgressPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLoadingProgress].
  static FlutterLoadingProgressPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLoadingProgressPlatform] when
  /// they register themselves.
  static set instance(FlutterLoadingProgressPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
