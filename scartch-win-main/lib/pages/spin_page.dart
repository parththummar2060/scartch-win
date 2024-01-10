import 'dart:async';
import 'dart:math';

import 'package:animated_button/animated_button.dart';
import 'package:earning_game/pages/varaible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinPage extends StatefulWidget {
  const SpinPage({Key? key}) : super(key: key);

  @override
  _SpinPageState createState() => _SpinPageState();
}

class _SpinPageState extends State<SpinPage> {
  StreamController<int> selected = StreamController<int>();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  final items = <String>[
    'Rs:- 1', //0
    '👛 30', //1
    '😭 ', //2
    '👛 10', //3
    'Rs:- 2', //4
    '👛 20', //5
    'Rs:- 3', //6
    '😭', //7
  ];

  int indexval = 0;

  bool speenwheel = true;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fortune Wheel'),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Container(
                height: 30,
                width: 95,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "💵 $rs  👛 $coin",
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 300,
                child: FortuneWheel(
                  physics: CircularPanPhysics(
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate,
                  ),
                  onAnimationStart: () {
                    speenwheel = false;
                  },
                  onAnimationEnd: () async {
                    speenwheel = true;
                    List l1 = key.currentContext.toString().split(" ");
                    String mixindex = l1.elementAt(l1.length - 2);
                    if (mixindex == "0,") {
                      indexval = 0;
                      rs += 1;
                    } else if (mixindex == "1,") {
                      indexval = 1;
                      coin += 30;
                    } else if (mixindex == "2,") {
                      indexval = 2;
                    } else if (mixindex == "3,") {
                      indexval = 3;
                      coin += 10;
                    } else if (mixindex == "4,") {
                      indexval = 4;
                      rs += 2;
                    } else if (mixindex == "5,") {
                      indexval = 5;
                      coin += 20;
                    } else if (mixindex == "6,") {
                      indexval = 6;
                      rs += 3;
                    } else if (mixindex == "7,") {
                      indexval = 7;
                    }

                    return await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Spin Rewards'),
                            content: (indexval == 2)
                                ? const Text("Try again...")
                                : (indexval == 7)
                                    ? const Text("Try again...")
                                    : Text('You win ${items[indexval]}'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: const Text('OK')),
                            ],
                          );
                        });
                  },
                  key: key,
                  animateFirst: false,
                  selected: selected.stream,
                  items: [
                    for (var it in items)
                      FortuneItem(
                          child: Text(it),
                          style: FortuneItemStyle(
                              color: ((items.indexOf(it)) % 2 == 1)
                                  ? Colors.blue
                                  : Colors.pink,
                              textStyle: const TextStyle(fontSize: 30))),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.455),
                child: Image.asset("images/wheelstand.png"),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          AnimatedButton(
            child: const Text("Spin"),
            onPressed: () {
              if (speenwheel) {
                setState(() {
                  selected.add(
                    Random().nextInt(items.length),
                  );
                });
              }
            },
            duration: 70,
            enabled: true,
            width: 150,
            shadowDegree: ShadowDegree.dark,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
