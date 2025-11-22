import 'package:flutter/material.dart';

class AppColors {
  // Base Palette (NEVER directly used in UI)
  static const cream = Color(0xFFFCF9EA);
  static const mint = Color(0xFFBADFDB);
  static const coral = Color(0xFFFFA4A4);
  static const pink = Color(0xFFFFBDBD);

  // Light Theme Tokens
  static final light = _AppThemeColors(
    background: Colors.white,
    card: cream,
    primary: mint,
    accent: coral,
    error: pink,
    textPrimary: Colors.black87,
    textSecondary: Colors.black54,
  );

  // Dark Theme Tokens
  static final dark = _AppThemeColors(
    background: const Color(0xFF121212),
    card: const Color(0xFF1E1E1E),
    primary: mint.withValues(alpha: 0.8),
    accent: coral.withValues(alpha: 0.8),
    error: pink,
    textPrimary: Colors.white70,
    textSecondary: Colors.white54,
  );
}

class _AppThemeColors {
  final Color background;
  final Color card;
  final Color primary;
  final Color accent;
  final Color error;
  final Color textPrimary;
  final Color textSecondary;

  const _AppThemeColors({
    required this.background,
    required this.card,
    required this.primary,
    required this.accent,
    required this.error,
    required this.textPrimary,
    required this.textSecondary,
  });
}
