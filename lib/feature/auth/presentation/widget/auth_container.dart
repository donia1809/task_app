import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/theme/colors.dart';
import 'package:task_app/feature/auth/presentation/pages/otp_page.dart';
import 'package:task_app/feature/home_screen.dart';
import '../../../../core/common_widget/auth_button.dart';
import '../../../../core/common_widget/auth_text_field.dart';
import '../../../../core/theme/text_style.dart';
import '../bloc/login_bloc.dart';

class AuthContainer extends StatefulWidget {
  const AuthContainer({super.key});

  @override
  State<AuthContainer> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 700,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: [
            const SizedBox(height: 32),
            Text('مرحبا بك!',textDirection: TextDirection.rtl,style: font24weight800ColorBlue),
            const SizedBox(height: 4),
            Text('قم بتسجيل دخولك مرة اخري', style: font18weight500ColorGrey),
            const SizedBox(height: 24),

            Text('رقم الجوال', style: font16weight500ColorBlack),
            const SizedBox(height: 8),
             AuthTextField(
               controller: _mobileController,
             ),

            const SizedBox(height: 32),
            AuthButton(
              text: 'تسجيل الدخول',
              onPressed: () {
                final mobile = _mobileController.text.trim();
                if (mobile.isNotEmpty) {
                  BlocProvider.of<LogInBloc>(context)
                      .add(LoginWithMobileEvent(mobile: mobile));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('الرجاء إدخال رقم الهاتف')),
                  );
                }
              },
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
            ),
            const SizedBox(height: 8),

            InkWell(onTap: (){
              Navigator.pushNamed(
                  context,
                  OtpPage.routeName,
              );
            },
              child: Row(textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ليس لديك حساب؟', style: font14weight400ColorBlack),
                  const SizedBox(width: 8),
                  Text('إنشاء حساب', style: font14weight800ColorBlue),
                ],
              ),
            ),
            Spacer(),
            AuthButton(
              text: 'الدخول كزائر',
              onPressed: () {Navigator.pushNamed(context, HomePage.routeName);},
              backgroundColor: AppColors.white,
              textColor: AppColors.primaryColor,
              hasBorder: true,
            ),
          ],
        ),
      ),
    );
  }
}
