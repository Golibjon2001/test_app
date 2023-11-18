import 'package:flutter/material.dart';
import 'package:test_app/assets/colors/colors.dart';


abstract class AppTheme {
  static ThemeData theme() => ThemeData(
        scaffoldBackgroundColor: scaffoldBackground,
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 18, color: black, fontWeight: FontWeight.w600),
          titleSmall: TextStyle(fontSize: 16, color: black, fontWeight: FontWeight.w400),
        ),
      );
}
