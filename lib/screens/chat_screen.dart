import 'package:flutter/material.dart';
import '../constants/app_fonts.dart';
import '../constants/colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final String title = args['name'] ?? "Chat";

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = isDark ? AppColors.dark : AppColors.light;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colors.textPrimary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: AppFonts.h2(colors.textPrimary),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.1), 
              BlendMode.srcOver,
            ),
          ),
        ),

        child: Center(
          child: Text(
            "Chat Screen for $title",
            style: AppFonts.h3(colors.textPrimary),
          ),
        ),
      ),
    );
  }
}
