import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CategoryChips extends StatefulWidget {
  final Function(String) onSelected;

  const CategoryChips({super.key, required this.onSelected});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  final List<String> categories = [
    "All",
    "Tech",
    "Fitness",
    "Diet",
    "Nutrition",
    "Wellness",
  ];

  String selectedCategory = "Show All";

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final themeColors = isDark ? AppColors.dark : AppColors.light;

    return SizedBox(
      height: 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = selectedCategory == cat;

          return GestureDetector(
            onTap: () {
              setState(() => selectedCategory = cat);
              widget.onSelected(cat);
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? themeColors.primary
                    : themeColors.card,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  if (!isDark)
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                ],
              ),
              child: Text(
                cat,
                style: TextStyle(
                  color: isSelected ? Colors.white : themeColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
