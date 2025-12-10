// lib/features/auth/widgets/skip_button.dart

import 'package:flutter/material.dart';
import '../../home/screens/home_screen.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        },
        child: const Text(
          'Skip',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}