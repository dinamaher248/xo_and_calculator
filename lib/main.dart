import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:xo_game/screens/buttons_screens.dart';
import 'package:xo_game/screens/calc_home_page.dart';
import 'package:xo_game/screens/register_screen.dart';
import 'package:xo_game/screens/users_player.dart';
import 'package:xo_game/screens/xo_screen.dart';

void main() {
  runApp(
    DevicePreview(enabled: true, builder: (context) => const Calculator()),
  );
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RegisterScreen.routeName,
      routes: {
        XoScreen.routeName: (context) => XoScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        UsersPlayer.routeName: (context) => UsersPlayer(),
        ButtonsScreens.routeName: (context) => ButtonsScreens(),
        CalcHomePage.routeName: (context) => CalcHomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
