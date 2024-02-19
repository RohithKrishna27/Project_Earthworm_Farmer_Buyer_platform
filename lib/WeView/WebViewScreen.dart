//Earthworm ChatBot 
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(WebViewScreen());
}

class WebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InAppWebViewExampleScreen(),
    );
  }
}
// This URL is deployed by us in Google Cloud  
class InAppWebViewExampleScreen extends StatelessWidget {
  final String url;

  InAppWebViewExampleScreen({Key? key, this.url = "https://chat-flask-app-xnxbb73wka-uc.a.run.app/"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EarthWorm ChatBot'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
      ),
    );
  }
}
