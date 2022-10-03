// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../style/colors.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: HaikuKigoColors.loginContainerColor,
            borderRadius: BorderRadius.circular(16),
          ),
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: body,
          ),
        ),
      ),
    );
  }
}
