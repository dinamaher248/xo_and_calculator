import 'package:flutter/material.dart';
import 'package:xo_game/screens/calc_home_page.dart';
import 'package:xo_game/screens/users_player.dart';
import 'package:xo_game/screens/xo_screen.dart';

class ButtonsScreens extends StatelessWidget {
  const ButtonsScreens({super.key});
  static String routeName = 'button_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2196F3), 
              Color(0xFF0D47A1), 
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Select An App To use',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20, width: double.infinity),

            InkWell(
              onTap: () {
                Navigator.pushNamed(context, CalcHomePage.routeName);
              },
              child: APPSelection(appName: 'Calcolator', icon: Icons.calculate),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, UsersPlayer.routeName);
              },
              child: APPSelection(appName: 'XO Game', icon: Icons.games),
            ),
          ],
        ),
      ),
    );
  }
}

class APPSelection extends StatelessWidget {
  APPSelection({super.key, required this.appName, required this.icon});
  String appName;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 150,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: const Color.fromARGB(255, 26, 100, 161),
            ),
            SizedBox(height: 10),
            Text(
              appName,
              style: TextStyle(
                color: const Color.fromARGB(255, 26, 100, 161),
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
