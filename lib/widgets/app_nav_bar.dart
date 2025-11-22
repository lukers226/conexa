import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../constants/colors.dart';
import '../constants/app_fonts.dart';

class AppNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const AppNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = isDark ? AppColors.dark : AppColors.light;

    return SafeArea(
      top: false,
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),

            child: Container(
              color: colors.card.withValues(alpha: 0.6),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

              child: LayoutBuilder(
                builder: (context, constraints) {
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    child: GNav(
                      gap: 6,
                      selectedIndex: selectedIndex,
                      onTabChange: onTabChange,
                      color: colors.textSecondary,
                      activeColor: colors.textPrimary,
                      tabBackgroundColor:
                      colors.primary.withValues(alpha: 0.35),

                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),

                      textStyle: AppFonts.h3(colors.textPrimary),

                      tabs: const [
                        GButton(
                          icon: Icons.home_rounded,
                          text: 'Community',
                        ),
                        GButton(
                          icon: Icons.favorite_rounded,
                          text: 'Favorites',
                        ),
                        GButton(
                          icon: Icons.notifications_rounded,
                          text: 'Alerts',
                        ),
                        GButton(
                          icon: Icons.person_rounded,
                          text: 'Profile',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
