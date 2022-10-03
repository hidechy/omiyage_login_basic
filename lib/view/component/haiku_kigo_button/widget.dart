import 'package:flutter/material.dart';

class HaikuKigoButton extends StatelessWidget {
  const HaikuKigoButton(
    this.title, {
    super.key,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
