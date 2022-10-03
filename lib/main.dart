import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'view/page/root/widget.dart';
import 'view/style/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haiku Kigo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: HaikuKigoColors.titleColor,
            fontSize: 20,
          ),
        ),
      ),
      home: const RootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
