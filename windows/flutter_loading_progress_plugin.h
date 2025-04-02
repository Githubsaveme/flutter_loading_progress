#ifndef FLUTTER_PLUGIN_FLUTTER_LOADING_PROGRESS_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_LOADING_PROGRESS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_loading_progress {

class FlutterLoadingProgressPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterLoadingProgressPlugin();

  virtual ~FlutterLoadingProgressPlugin();

  // Disallow copy and assign.
  FlutterLoadingProgressPlugin(const FlutterLoadingProgressPlugin&) = delete;
  FlutterLoadingProgressPlugin& operator=(const FlutterLoadingProgressPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_loading_progress

#endif  // FLUTTER_PLUGIN_FLUTTER_LOADING_PROGRESS_PLUGIN_H_
