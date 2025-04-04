import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loading_progress/flutter_loading_progress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _progress = 0.0;

  String _platformVersion = 'Unknown';
  final _flutterLoadingProgressPlugin = FlutterLoadingProgress();

  void _startLoading() {
    FlutterLoadingProgress.trackLoading(
      totalSteps: 10,
      onProgress: (progress) {
        setState(() => _progress = progress);
      },
      onComplete: () {
        print("Task Completed!");
      },
    );
  }

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
          await _flutterLoadingProgressPlugin.getPlatformVersion() ??
          'Unknown platform version';
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
        appBar: AppBar(title: Text("Flutter Loading Progress Plugin")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Running on: $_platformVersion\n'),
              CircularProgressIndicator(value: _progress / 100),
              SizedBox(height: 10),
              Text("Loading: ${_progress.toStringAsFixed(0)}%"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _startLoading,
                child: Text("Start Loading"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
