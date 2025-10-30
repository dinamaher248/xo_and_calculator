import 'package:flutter/material.dart';
import 'package:xo_game/screens/buttons_screens.dart';
import 'package:xo_game/widgets/text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  'Register',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                icon: Icons.email,
                labelText: 'Email',
                onChanged: (value) {
                  user1 = value;
                },
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter a valid Email';
                  }
                  if (!p0.contains('@')) {
                    return 'Email must contain @***.com';
                  }

                  return null;
                },
                controller: user1Controller,
              ),
              SizedBox(height: 30),
              TextFieldWidget(
                icon: Icons.password,
                labelText: 'Password',
                onChanged: (value) {
                  user2 = value;
                },
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (p0.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(p0)) {
                    return 'Password must contain at least one uppercase letter';
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
                        ButtonsScreens.routeName,
                      );
                    }
                  }
                },
                child: Text(
                  'Register',
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
