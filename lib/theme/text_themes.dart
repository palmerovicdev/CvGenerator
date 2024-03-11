import 'package:flutter/material.dart';

enum TextThemes {
  title,
  subtitle,
  subsectionTitle,
  subsectionSubtitle,
  datePeriod,
  description;

  TextStyle get style {
    switch (this) {
      case TextThemes.title:
        return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        );
      case TextThemes.subtitle:
        return const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        );
      case TextThemes.subsectionTitle:
        return const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        );
      case TextThemes.subsectionSubtitle:
        return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );
      case TextThemes.datePeriod:
        return const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        );
      case TextThemes.description:
        return const TextStyle(
          fontSize: 14,
        );
    }
  }
}