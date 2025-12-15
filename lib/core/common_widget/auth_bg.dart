import 'package:flutter/material.dart';
import 'package:task_app/core/theme/colors.dart';

class AuthBackground extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
     return Container(
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/bg.png'),
            Image.asset('assets/images/logo.png'),
          ],
        ),
      ),
    );
  }

}