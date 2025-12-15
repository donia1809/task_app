import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AuthTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final bool isOtp;
  final TextInputType? keyboardType;

  const AuthTextField({
    super.key,
    this.hint,
    this.controller,
    this.isOtp = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: isOtp ? TextAlign.center : TextAlign.right,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType ??
          (isOtp ? TextInputType.number : TextInputType.text),
      maxLength: isOtp ? 1 : null,
      decoration: InputDecoration(
        counterText: '',
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: isOtp
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
      style: TextStyle(
        fontSize: isOtp ? 24 : 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
