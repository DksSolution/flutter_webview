import 'package:flutter/material.dart';
import 'package:p4del/screens/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}



class _SplashState extends State<Splash> {

  @override
  void initState(){
    super.initState();

  }

  _navigateToHome()async{
    await Future.delayed(const Duration(milliseconds: 3000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text("Splash Screen", style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w700
          ),),
        ),
      ),
    );
  }
}
