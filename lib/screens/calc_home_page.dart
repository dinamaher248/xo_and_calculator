import 'package:flutter/material.dart';

class CalcHomePage extends StatefulWidget {
  CalcHomePage({super.key});
  static String routeName = 'calc';

  @override
  State<CalcHomePage> createState() => _CalcHomePageState();
}

class _CalcHomePageState extends State<CalcHomePage> {
  String resText = '';
  double? firstNumber;
  String? operation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            color: Colors.grey[200],
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              resText,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButton(buttonText: '7', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '8', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '9', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '*', VoidCallback: onButtonPressed),
              ],
            ),
          ),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButton(buttonText: '4', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '5', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '6', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '/', VoidCallback: onButtonPressed),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButton(buttonText: '1', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '2', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '3', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '+', VoidCallback: onButtonPressed),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButton(buttonText: '.', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '0', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '=', VoidCallback: onButtonPressed),
                CalcButton(buttonText: '-', VoidCallback: onButtonPressed),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButton(buttonText: 'C', VoidCallback: onButtonPressed),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      resText = '';
      firstNumber = null;
      operation = null;
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      if (resText.isNotEmpty) {
        firstNumber = double.parse(resText);
        operation = buttonText;
        resText = '';
      }
    } else if (buttonText == '=') {
      if (firstNumber != null && operation != null && resText.isNotEmpty) {
        double secondNumber = double.parse(resText);
        if (operation == '+')
          resText = (firstNumber! + secondNumber).toString();
        if (operation == '-')
          resText = (firstNumber! - secondNumber).toString();
        if (operation == '*')
          resText = (firstNumber! * secondNumber).toString();
        if (operation == '/')
          resText = (firstNumber! / secondNumber).toString();
        operation = null;
        firstNumber = null;
      }
    } else {
      resText += buttonText;
    }
    setState(() {});
    print('Button pressed: $buttonText');
  }
}

class CalcButton extends StatelessWidget {
  CalcButton({super.key, required this.buttonText, required this.VoidCallback});
  String buttonText;
  Function VoidCallback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                buttonText == '+' ||
                        buttonText == '-' ||
                        buttonText == '/' ||
                        buttonText == '*' ||
                        buttonText == '=' 
                    ? const Color.fromARGB(255, 41, 67, 81)
                    : Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            VoidCallback(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
