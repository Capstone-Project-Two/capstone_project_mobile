import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  const CoinCard({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.inversePrimary),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '10 coins',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Text(
            '10,000 Riel',
            style: TextStyle(fontSize: 16, color: colorScheme.tertiary),
          ),
        ],
      ),
    );
  }
}
