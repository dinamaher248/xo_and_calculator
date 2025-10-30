

import 'package:flutter/material.dart';

class XOButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const XOButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            minimumSize: const Size(double.infinity, double.infinity),
            padding: EdgeInsets.zero,
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 36, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
