import 'package:flutter/material.dart';

class AppFonts {
  static const String nunito = "Nunito";

  static const FontWeight light = FontWeight.w300;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  static TextStyle h1(Color color) => TextStyle(
    fontFamily: nunito,
    fontSize: 28,
    fontWeight: bold,
    color: color,
  );

  static TextStyle h2(Color color) => TextStyle(
    fontFamily: nunito,
    fontSize: 24,
    fontWeight: semiBold,
    color: color,
  );

  static TextStyle h3(Color color) => TextStyle(
    fontFamily: nunito,
    fontSize: 20,
    fontWeight: semiBold,
    color: color,
  );

  static TextStyle body(Color color) => TextStyle(
    fontFamily: nunito,
    fontSize: 16,
    fontWeight: regular,
    color: color,
  );

  static TextStyle small(Color color) => TextStyle(
    fontFamily: nunito,
    fontSize: 14,
    fontWeight: regular,
    color: color,
  );
}
