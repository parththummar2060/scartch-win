import 'package:earning_game/pages/varaible.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  List gameLogo = [
    "images/speenwheel.png",
    "images/scratch.png",
    "images/tictac.png",
    "images/drag_drop.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Image(
          image: AssetImage(
            "images/game_zone_text.png",
          ),
          height: 60,
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 15,
          ),
          itemCount: gameLogo.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                setState(() {
                  if (i == 0) Navigator.of(context).pushNamed("spin_page");
                  if (i == 1) Navigator.of(context).pushNamed("scratch_page");
                  if (i == 2) Navigator.of(context).pushNamed("tic_page");
                  if (i == 3) Navigator.of(context).pushNamed("drag_page");
                });
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(gameLogo[i]),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        color: Colors.black.withOpacity(0.5),
        child: SalomonBottomBar(
          currentIndex: currentIndex,
          duration: Duration(milliseconds: 3000),
          onTap: (i) {
            setState(() {
              currentIndex = i;

              if (currentIndex == 0) {
                Navigator.of(context).pushNamed("/");
              }
              if (currentIndex == 1) {
                Navigator.of(context).pushNamed("redeem_page");
              }
              if (currentIndex == 3) {
                _key.currentState!.openDrawer();
              }
            });
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.wallet_giftcard),
              title: const Text("Redeem"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
