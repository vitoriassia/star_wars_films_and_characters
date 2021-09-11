import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  final String url;
  final Function(String?) onPageStarted;
  final Function(String?) onPageFinish;
  WebViewApp(
      {required this.url,
      required this.onPageStarted,
      required this.onPageFinish});
  @override
  WebViewAppState createState() => WebViewAppState();
}

class WebViewAppState extends State<WebViewApp> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
      onPageStarted: widget.onPageStarted,
      onPageFinished: widget.onPageFinish,
    );
  }
}
