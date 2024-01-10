import 'package:animated_button/animated_button.dart';
import 'package:earning_game/pages/varaible.dart';
import 'package:flutter/material.dart';

class RedeemPage extends StatefulWidget {
  const RedeemPage({Key? key}) : super(key: key);

  @override
  _RedeemPageState createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redeem'),
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
      body: Center(
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: "   +91 8320782359",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
              ),
              const Text(
                "100 👛 = 1 💵",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              AnimatedButton(
                child: const Text("Redeem"),
                onPressed: () {},
                duration: 70,
                enabled: true,
                height: 50,
                width: 150,
                shadowDegree: ShadowDegree.dark,
                color: Colors.blue,
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.85,
        ),
      ),
    );
  }
}
