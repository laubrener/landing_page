import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.pink,
        child: const Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Home',
              style: TextStyle(
                fontSize: 80,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
