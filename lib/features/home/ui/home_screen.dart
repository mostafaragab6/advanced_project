import 'package:flutter/material.dart';

import 'widgets/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(
            20,
            16,
            20,
            28,
          ),
          width: double.infinity,
          child: const Column(
            children: [
              HomeTopBar(),
            ],
          ),
        ),
      ),
    );
  }
}
