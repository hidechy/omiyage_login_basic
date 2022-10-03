import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../style/colors.dart';

import 'notifier.dart';

/// ログイン画面などで使用するパスワード入力フィールド
class PasswordTextField extends ConsumerWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(passwordTextFieldStateProvider);
    final notifier = ref.watch(passwordTextFieldStateProvider.notifier);

    return TextField(
      controller: controller,
      decoration: InputDecoration(
          fillColor: HaikuKigoColors.inputColor,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: HaikuKigoColors.textFieldColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: HaikuKigoColors.textFieldColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          suffixIcon: GestureDetector(
            onTap: () =>
                notifier.setVisiblePassword(active: !state.visiblePassword),
            child: state.visiblePassword
                ? const Icon(
                    FontAwesomeIcons.solidEye,
                    color: HaikuKigoColors.textFieldColor,
                  )
                : const Icon(
                    FontAwesomeIcons.solidEyeSlash,
                    color: HaikuKigoColors.textFieldColor,
                  ),
          )),
      obscureText: !state.visiblePassword,
    );
  }
}
