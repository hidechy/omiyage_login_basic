import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/user/notifier.dart';
import '../../component/email_text_field/widget.dart';
import '../../component/haiku_kigo_button/widget.dart';
import '../../component/password_text_field/widget.dart';
import '../../style/text_style.dart';
import 'layout/widget.dart';

/// ログイン画面
class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoginLayout(
      body: Column(
        children: [
          const SizedBox(height: 24),

          Text(
            'メールアドレスでログイン',
            style: HaikuKigoTextStyle.medium,
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'メールアドレス',
                style: HaikuKigoTextStyle.xSmall,
              ),
              const SizedBox(height: 8),
              EmailTextField(controller: _emailController),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'パスワード',
                style: HaikuKigoTextStyle.xSmall,
              ),
              const SizedBox(height: 8),
              PasswordTextField(controller: _passwordController),
            ],
          ),
          const SizedBox(height: 24),
          HaikuKigoButton(
            'ログイン',
            onPressed: () {
              ref.read(userStateProvider.notifier).login(
                    email: _emailController.text,
                    password: _passwordController.text,
                    onFailed: () {
                      debugPrint('ログインに失敗しました。');
                    },
                  );
            },
          ),

          const SizedBox(height: 24),

          // ダミー値セットボタン
          if (kDebugMode) _buildDebugButton(),
        ],
      ),
    );
  }

  /// ダミー値セット用Widget
  Widget _buildDebugButton() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.orangeAccent.withOpacity(0.3),
          ),
          child: TextButton(
            onPressed: () {
              _emailController.text = 'loginuser@aaa.com';
              _passwordController.text = 'password';
            },
            child: Text(
              'ダミー値セット',
              style: HaikuKigoTextStyle.medium,
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
