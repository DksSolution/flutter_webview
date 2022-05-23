import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../helpers/Icons.dart';
import '../helpers/Strings.dart';
import 'no_internet.dart';

class NoInternetWidget extends StatefulWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  _NoInternetWidgetState createState() => _NoInternetWidgetState();
}

class _NoInternetWidgetState extends State<NoInternetWidget> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset('assets/noInternet.json', height: 200),
          // SvgPicture.asset(
          //   Theme.of(context).colorScheme.noInternetIcon,
          //   height: 100,
          //   width: 100,
          // ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
          //   child: Text(
          //     CustomStrings.noInternet1,
          //     style: Theme.of(context).appBarTheme.titleTextStyle,
          //   ),
          // ),
          // Text(
          //   CustomStrings.noInternet2,
          //   style: Theme.of(context).appBarTheme.titleTextStyle,
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // _isLoading
          //     ? CircularProgressIndicator(
          //         color: Theme.of(context).primaryColor,
          //       )
          //     : TextButton(
          //         child: const Text('Retry'),
          //         style: ElevatedButton.styleFrom(
          //           padding: const EdgeInsets.symmetric(horizontal: 20),
          //           primary: Theme.of(context).primaryColor,
          //           onPrimary: Theme.of(context).cardColor,
          //         ),
          //         onPressed: () {
          //           setState(() {
          //             _isLoading = true;
          //           });
          //
          //           Future.delayed(const Duration(seconds: 3), () {
          //             NoInternet.initConnectivity();
          //             setState(() {
          //               _isLoading = false;
          //             });
          //           });
          //         },
          //       )
        ],
      ),
    );
  }
}
