import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_loading_progress/flutter_loading_progress.dart';
import 'package:flutter_loading_progress/flutter_loading_progress_platform_interface.dart';
import 'package:flutter_loading_progress/flutter_loading_progress_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLoadingProgressPlatform
    with MockPlatformInterfaceMixin
    implements FlutterLoadingProgressPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterLoadingProgressPlatform initialPlatform = FlutterLoadingProgressPlatform.instance;

  test('$MethodChannelFlutterLoadingProgress is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLoadingProgress>());
  });

  test('getPlatformVersion', () async {
    FlutterLoadingProgress flutterLoadingProgressPlugin = FlutterLoadingProgress();
    MockFlutterLoadingProgressPlatform fakePlatform = MockFlutterLoadingProgressPlatform();
    FlutterLoadingProgressPlatform.instance = fakePlatform;

    expect(await flutterLoadingProgressPlugin.getPlatformVersion(), '42');
  });
}
