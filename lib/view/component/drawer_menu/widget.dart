import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/user/notifier.dart';

import '../../style/colors.dart';
import 'menu_item/widget.dart';

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: HaikuKigoColors.mainContainerColor,
              ),
              child: Container(),
            ),
          ),
          DrawerMenuItem(
            buttonText: 'ホーム',
            icon: Icons.home,
            onTap: () => _popToRoot(context),
            endItem: true,
          ),
          const SizedBox(height: 24),
          DrawerMenuItem(
            buttonText: 'ログアウト',
            icon: Icons.logout,
            onTap: () {
              ref.read(userStateProvider.notifier).logout(onFailed: () {
                Navigator.pop(context);

                debugPrint('ログアウトに失敗しました。');
              });
            },
            endItem: true,
          ),
        ],
      ),
    );
  }

  Future<void> _popToRoot(BuildContext context) async {
    Navigator.pop(context); // hide drawer
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
