import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(const Duration(seconds: 3), (){
     setState(() {
       Navigator.of(context).pushReplacementNamed("/");
     });
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          const SizedBox(width: double.infinity,),
          const Spacer(),
          Image.asset("images/logo.png",height: 150,),
          const Spacer(flex: 4,),
          const CircularProgressIndicator(color: Colors.white,backgroundColor: Colors.redAccent),
          const Spacer(),
          const Text("Made with ❤ in india"),
          const Spacer(),
        ],
      ),
    );
  }
}
