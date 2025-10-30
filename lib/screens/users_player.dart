import 'package:flutter/material.dart';
import 'package:xo_game/models/user_model.dart';
import 'package:xo_game/widgets/text_field_widget.dart';
import 'package:xo_game/screens/xo_screen.dart';

class UsersPlayer extends StatefulWidget {
  UsersPlayer({super.key});
  static String routeName = 'user_player';

  @override
  State<UsersPlayer> createState() => _UsersPlayerState();
}

class _UsersPlayerState extends State<UsersPlayer> {
  String user1 = '';

  String user2 = '';
  TextEditingController user1Controller = TextEditingController();
  TextEditingController user2Controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Enter Players\' name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                icon: Icons.games,
                labelText: 'Player 1 (X)',
                onChanged: (value) {
                  user1 = value;
                },
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please Enter name of User1';
                  }
                  return null;
                },
                controller: user1Controller,
              ),
              SizedBox(height: 30),
              TextFieldWidget(
                icon: Icons.games,
                labelText: 'Player 2 (O)',
                onChanged: (value) {
                  user2 = value;
                },
                validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                    return 'Please Enter name pf User2';
                  }
                  return null;
                },
                controller: user2Controller,  
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState != null) {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(
                        context,
                        XoScreen.routeName,
                        arguments: UserModel(user1: user1, user2: user2),
                      );
                    }
                  }
                },
                child: Text(
                  'Start Playing',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  maximumSize: Size(double.infinity, 50),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
