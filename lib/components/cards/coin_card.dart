import 'package:capstone_project_mobile/core/model/credit_package.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  final CreditPackage creditPackage;

  const CoinCard({super.key, required this.creditPackage});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.inversePrimary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            creditPackage.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Text(
            "${creditPackage.points} \$",
            style: TextStyle(fontSize: 16, color: colorScheme.tertiary),
          ),
        ],
      ),
    );
  }
}
