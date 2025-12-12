import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'category_card.dart';
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View all',
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(child: CategoryCard(emoji: '⚽', title: 'Football')),
            SizedBox(width: 12),
            Expanded(child: CategoryCard(emoji: '🎾', title: 'Tenis')),
            SizedBox(width: 12),
            Expanded(child: CategoryCard(emoji: '🏀', title: 'Basketball')),
          ],
        ),
      ],
    );
  }
}