import 'package:flutter/material.dart';
import 'colors.dart';

class Theming
{
  static  ThemeData lightTheme = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme: AppBarTheme(
        color: AppColors.black,
      )
  );
}