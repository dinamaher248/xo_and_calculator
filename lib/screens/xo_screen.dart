import 'package:flutter/material.dart';
import 'package:xo_game/models/user_model.dart';
import 'package:xo_game/widgets/xo_button.dart';

class XoScreen extends StatefulWidget {
  const XoScreen({super.key});
  static String routeName = 'XoScreen';

  @override
  State<XoScreen> createState() => _XoScreenPageState();
}

class _XoScreenPageState extends State<XoScreen> {
  int playerXScore = 0;
  int playerOScore = 0;
  List<String> buttonsList = List.filled(9, '');
  bool player = true; // true = X, false = O
  int index = 0;
  @override
  Widget build(BuildContext context) {
    UserModel userModel =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('XO Game', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildPlayerInfo(userModel.user1, "X", playerXScore),
                buildPlayerInfo(userModel.user2, "O", playerOScore),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Row(
                children: [
                  XOButton(
                    buttonText: buttonsList[0],
                    onPressed: () => onButtonPressed(0),
                  ),
                  XOButton(
                    buttonText: buttonsList[1],
                    onPressed: () => onButtonPressed(1),
                  ),
                  XOButton(
                    buttonText: buttonsList[2],
                    onPressed: () => onButtonPressed(2),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Row(
                children: [
                  XOButton(
                    buttonText: buttonsList[3],
                    onPressed: () => onButtonPressed(3),
                  ),
                  XOButton(
                    buttonText: buttonsList[4],
                    onPressed: () => onButtonPressed(4),
                  ),
                  XOButton(
                    buttonText: buttonsList[5],
                    onPressed: () => onButtonPressed(5),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: Row(
                children: [
                  XOButton(
                    buttonText: buttonsList[6],
                    onPressed: () => onButtonPressed(6),
                  ),
                  XOButton(
                    buttonText: buttonsList[7],
                    onPressed: () => onButtonPressed(7),
                  ),
                  XOButton(
                    buttonText: buttonsList[8],
                    onPressed: () => onButtonPressed(8),
                  ),
                ],
              ),
            ),
          ),
          // GridView.builder(
          //   padding: const EdgeInsets.all(10),
          //   physics: const NeverScrollableScrollPhysics(),
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3,
          //     crossAxisSpacing: 8,
          //     mainAxisSpacing: 8,
          //   ),
          //   itemCount: 9,
          //   itemBuilder: (context, index) {
          //     return XOButton(
          //       buttonText: buttonsList[index],
          //       onPressed: () => onButtonPressed(index),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  void onButtonPressed(int index) {
    if (buttonsList[index] != '') return;

    setState(() {
      buttonsList[index] = player ? 'X' : 'O';
      player = !player;
    });

    String winner = checkWinner();
    if (winner != '') {
      showWinnerDialog(winner);
    }
  }

  String checkWinner() {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      String a = buttonsList[pattern[0]];
      String b = buttonsList[pattern[1]];
      String c = buttonsList[pattern[2]];
      if (a == b && b == c && a != '') {
        if (a == 'X') playerXScore += 5;
        if (a == 'O') playerOScore += 5;
        return a;
      }
    }
    return '';
  }

  void showWinnerDialog(String winner) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Center(child: Text('Winner: $winner 🎉')),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    buttonsList = List.filled(9, '');
                  });
                  Navigator.pop(context);
                },
                child: Center(child: const Text('Play Again')),
              ),
            ],
          ),
    );
  }

  Widget buildPlayerInfo(String name, String symbol, int score) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$name ($symbol)",
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        Text(
          "Score: $score",
          style: const TextStyle(fontSize: 20, color: Colors.black87),
        ),
      ],
    );
  }
}
