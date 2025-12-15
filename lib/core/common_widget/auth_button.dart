import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/text_style.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool hasBorder;

  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: hasBorder ? BorderSide(color: AppColors.primaryColor) : BorderSide.none,
          ),
        ),
        child: Text(text, style: font14weight800ColorWhite.copyWith(color: textColor)),
      ),
    );
  }
}
