import 'package:flutter/material.dart';

class PricingView extends StatelessWidget {
  const PricingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.deepPurple,
        child: const Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Pricing',
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
