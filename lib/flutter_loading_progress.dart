
import 'flutter_loading_progress_platform_interface.dart';

import 'dart:async';

class FlutterLoadingProgress {
  Future<String?> getPlatformVersion() {
    return FlutterLoadingProgressPlatform.instance.getPlatformVersion();
  }
  /// Tracks loading progress for any async task
  ///
  /// [totalSteps] defines the total progress steps.
  /// [onProgress] is called on every update with the progress percentage.
  /// [onComplete] is called when the task is finished.
  static Future<void> trackLoading({
    required int totalSteps,
    required Function(double) onProgress,
    required Function() onComplete,
    int delayMilliseconds = 200,
  }) async {
    for (int i = 0; i <= totalSteps; i++) {
      await Future.delayed(Duration(milliseconds: delayMilliseconds));
      double progress = (i / totalSteps) * 100;
      onProgress(progress);
    }
    onComplete();
  }
}
