import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.pinkAccent,
        child: const Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'About',
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
