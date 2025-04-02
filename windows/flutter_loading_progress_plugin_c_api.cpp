#include "include/flutter_loading_progress/flutter_loading_progress_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_loading_progress_plugin.h"

void FlutterLoadingProgressPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_loading_progress::FlutterLoadingProgressPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
