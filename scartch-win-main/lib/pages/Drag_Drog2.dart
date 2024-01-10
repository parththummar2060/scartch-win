import 'dart:math';

import 'package:earning_game/pages/varaible.dart';
import 'package:flutter/material.dart';

class DragPage2 extends StatefulWidget {
  const DragPage2({Key? key}) : super(key: key);

  @override
  _DragPage2State createState() => _DragPage2State();
}

class _DragPage2State extends State<DragPage2> {
  Map<String, bool> m2 = {};

  Map<String, String> m1 = {
    "🐄": "Cow",
    "🐕": "Dog",
    "🐈": "Cat",
    "🐘": "Elephant",
    "🐇": "rabbit",
    "🐒": "Monkey",
  };

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/");
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Drag & Drop'),
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
                  "💵 $rs 👛 $coin",
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          )
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: m1.keys
                .map(
                  (e) => Draggable(
                    data: e,
                    child: Emoji(emoji: m2[e] == true ? "✔" : e),
                    feedback: Emoji(emoji: e),
                    childWhenDragging: const Emoji(emoji: "😍"),
                  ),
                )
                .toList(),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: m1.entries.map((e) => buiddragtarget(e)).toList()
                ..shuffle(Random(3)))
        ],
      ),
    );
  }

  Widget buiddragtarget(e) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> incoming, List rejected) {
        if (m2[e.key] == true) {
          return Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            height: 80,
            width: 200,
            child: const Text(
              "😎",
              style: TextStyle(fontSize: 50),
            ),
          );
        } else {
          return Container(
            child: Text(
              e.value,
              style: const TextStyle(fontSize: 25),
            ),
            alignment: Alignment.center,
            color: Colors.transparent,
            height: 80,
            width: 200,
          );
        }
      },
      onWillAccept: (data) => data == e.key,
      onAccept: (data) {
        setState(() {
          m2[e.key] = true;
          i++;
          if (i == 6) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Spin Rewards'),
                    content: const Text('You win 👛 50'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            coin += 50;
                            setState(() {
                              Navigator.of(context).pushNamed("/");
                            });
                          },
                          child: const Text('OK')),
                    ],
                  );
                });
          }
        });
      },
      onLeave: (data) {},
    );
  }
}

class Emoji extends StatelessWidget {
  const Emoji({Key? key, required this.emoji}) : super(key: key);

  final String emoji;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          emoji,
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
