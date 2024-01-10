import 'dart:math';

import 'package:animated_button/animated_button.dart';
import 'package:earning_game/pages/varaible.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

class ScratchPage extends StatefulWidget {
  const ScratchPage({Key? key}) : super(key: key);

  @override
  _ScratchPageState createState() => _ScratchPageState();
}

class _ScratchPageState extends State<ScratchPage> {
  final scratchKey = GlobalKey<ScratcherState>();
  Random random = Random();

  int scratchval = 0;
  bool scratchboolval = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scratch'),
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
          const SizedBox(
            width: double.infinity,
          ),
          Container(
            height: 200,
            width: 200,
            child: Scratcher(
              key: scratchKey,
              onScratchStart: () {
                if (scratchboolval) {
                  scratchboolval = false;
                  setState(() {
                    scratchval = random.nextInt(7);
                  });
                }
              },
              onScratchEnd: () {},
              image: Image.asset("images/scratchbg.png"),
              brushSize: 30,
              threshold: 50,
              color: Colors.blue,
              enabled: true,
              rebuildOnResize: false,
              onChange: (value) => {
                if (value >= 80)
                  {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Spin Rewards'),
                            content: (scratchval == 1)
                                ? const Text('You win rs:- 1')
                                : (scratchval == 2)
                                    ? const Text('You win rs:- 2')
                                    : (scratchval == 3)
                                        ? const Text('You win rs:- 3')
                                        : (scratchval == 4)
                                            ? const Text('You win 👛 30')
                                            : (scratchval == 5)
                                                ? const Text('You win 👛 10')
                                                : (scratchval == 6)
                                                    ? const Text(
                                                        'You win 👛 20')
                                                    : const Text(
                                                        "Try again..."),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (scratchval == 1) {
                                        rs += 1;
                                      } else if (scratchval == 2) {
                                        rs += 2;
                                      } else if (scratchval == 3) {
                                        rs += 3;
                                      } else if (scratchval == 4) {
                                        coin += 30;
                                      } else if (scratchval == 5) {
                                        coin += 10;
                                      } else if (scratchval == 6) {
                                        coin += 20;
                                      }
                                      scratchboolval = true;
                                      scratchKey.currentState!.reset(
                                          duration: const Duration(
                                              milliseconds: 2000));
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: const Text('OK')),
                            ],
                          );
                        })
                  }
              },
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("images/scratch$scratchval.png"))),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          AnimatedButton(
            child: const Text("Scratch"),
            onPressed: () {
              if (scratchboolval) {
                scratchKey.currentState!
                    .reset(duration: const Duration(milliseconds: 2000));
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
