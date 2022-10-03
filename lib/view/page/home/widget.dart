import 'package:flutter/material.dart';

import '../../component/main_layout/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      title: 'HomePage',
      automaticallyImplyLeading: false,
      body: Text('HomeScreen'),
    );
  }
}
