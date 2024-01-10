import 'package:earning_game/pages/Tictactoe.dart';
import 'package:earning_game/pages/drag_drop.dart';
import 'package:earning_game/pages/login_page.dart';
import 'package:earning_game/pages/redeem_page.dart';
import 'package:earning_game/pages/scratch_page.dart';
import 'package:earning_game/pages/spin_page.dart';
import 'package:earning_game/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'pages/Drag_Drog2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: "splash_screen",
        routes: {
          "/": (context) => const LoginPage(),
          "splash_screen": (context) => const SplashPage(),
          "spin_page": (context) => const SpinPage(),
          "scratch_page": (context) => const ScratchPage(),
          "tic_page": (context) => const TicPage(),
          "drag_page": (context) => const DragPage(),
          "drag2_page": (context) => const DragPage2(),
          "redeem_page": (context) => const RedeemPage(),
        });
  }
}
