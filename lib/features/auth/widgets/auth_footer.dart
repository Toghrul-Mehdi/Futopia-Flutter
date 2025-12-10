// lib/features/auth/widgets/auth_footer.dart

import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AuthFooter extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onTap;

  const AuthFooter({
    Key? key,
    required this.text,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.white70, fontSize: 15),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            buttonText,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}