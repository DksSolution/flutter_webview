import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  late String URL;
  late WebViewController _controller;
  bool device = false;
  @override
  void initState(){
    if(Platform.isAndroid){
      URL = 'https://p4del.app/?ref=android';
      // _controller.loadUrl(URL);
    }else{
      URL = 'https://p4del.app/?ref=apple';
      // _controller.loadUrl(URL);
    }
    super.initState();
  }

  bool _checkDevice(){
    if(Platform.isAndroid){
      return true;
    }else{
      return false;
    }
  }

  void _changeURL(){
    if(Platform.isAndroid){
      URL = 'https://p4del.app/?ref=android';
      _controller.loadUrl(URL);
    }else{
      URL = 'https://p4del.app/?ref=apple';
      _controller.loadUrl(URL);
    }
  }
  @override
  Widget build(BuildContext context) {
    print(URL);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 38, 0, 0),
        child: WebView(
          initialUrl:  URL,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
