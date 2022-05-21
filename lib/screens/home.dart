import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widget/no_internet.dart';
import '../widget/no_internet_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  late String URL;
  bool isLoading=true;
  late WebViewController _controller;



  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

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
    NoInternet.initConnectivity().then((value) => setState(() {
      _connectionStatus = value;
    }));
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
          NoInternet.updateConnectionStatus(result).then((value) => setState(() {
            _connectionStatus = value;
          }));
        });
  }
  willPopScope() async {
    bool goBack = _controller.canGoBack() as bool;
    if(goBack != true) {
      return true;
    } else {
      _controller.goBack();
      return false;
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
  final Completer<WebViewController> _controllerCompleter =
  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    print(URL);
    print(_connectionStatus);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _connectionStatus == 'ConnectivityResult.none'
                ? const NoInternetWidget()
            :
            Container(
              child: WillPopScope(
                onWillPop: () => _goBack(context),
                child: WebView(
                  initialUrl:  URL,
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: (finish){
                    setState((){
                      isLoading = false;
                    });
                  },
                  onWebViewCreated: (WebViewController webViewController) {

                    _controllerCompleter.future.then((value) => _controller = value);
                    _controllerCompleter.complete(webViewController);
                  },
                  navigationDelegate: (NavigationRequest request) {
                    if (request.url.startsWith('https://p4del.app/')) {
                      print('allowing navigation to $request');
                      return NavigationDecision.navigate;
                    } else  {
                      print('Opening Default Browser $request');
                      _launchURL(request.url); // to open browser
                      return NavigationDecision.prevent;
                    }
                  },
                ),
              ),
            ),
            isLoading ? const Center( child: CircularProgressIndicator(color: Color(0xFF25d366)),)
                : Stack(),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        webOnlyWindowName: '_blank',
      );
    } else {
      await launch(
        url,
        webOnlyWindowName: '_blank',
      );
    }

  }
  Future<bool> _goBack(BuildContext context) async {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Do you want to exit'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text('Yes'),
              ),
            ],
          ));
      return Future.value(true);
  }
}
