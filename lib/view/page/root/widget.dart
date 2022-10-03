import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/user/notifier.dart';

import '../home/widget.dart';
import '../login/widget.dart';

class RootPage extends ConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userStateProvider);
    return state.map(
      unauthenticated: (_) => LoginPage(),
      authenticated: (UserStateAuthenticated state) {
        return const HomePage();
      },
    );
  }
}
