import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/theme/colors.dart';
import '../../../../core/common_widget/auth_button.dart';
import '../../../../core/common_widget/auth_text_field.dart';
import '../../../../core/theme/text_style.dart';
import '../bloc/otp_bloc.dart';


class OtpContainer extends StatelessWidget {
  final String accessToken;
  final List<TextEditingController> otpControllers;

  OtpContainer({
    super.key,
    required this.accessToken, required this.otpControllers,
  });

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  'تأكيد رقم الهاتف',
                  textDirection: TextDirection.rtl,
                  style: font24weight800ColorBlue,
                ),
                const SizedBox(height: 4),
                Text(
                  'لتأكيد حسابك قم بادخال الكود المكون من 4 ارقام الذي تم ارساله في رساله الي رقم الهاتف 252 --- --- --- (تغيير الرقم) , ٍسيصلك الكود خلال 01:30',
                  style: font18weight500ColorGrey,
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(height: 24),
                Text(
                  'كود التأكيد',
                  textDirection: TextDirection.rtl,
                  style: font16weight500ColorBlack,
                ),
              ],
            ),

            SizedBox(height: 24),

            SizedBox(
              height: 100,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 1,
                    child: AuthTextField(
                      isOtp: true,
                      controller: otpControllers[index],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 32),
            Column(
              children: [
                AuthButton(
                  text: 'تأكيد',
                  onPressed: () {
                    final otp = otpControllers.map((c) => c.text.trim()).join();
                    if (otp.isNotEmpty && otp.length == 4) {
                      BlocProvider.of<OtpBloc>(
                        context,
                      ).add(VerifyOtpEvent(otp: otp, accessToken: accessToken));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('الرجاء إدخال كود otp كامل'),
                        ),
                      );
                    }
                  },
                  backgroundColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                ),
                const SizedBox(height: 8),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لم تصلك رسالة تأكيد؟',
                      style: font14weight400ColorBlack,
                    ),
                    SizedBox(width: 8),
                    Text('اعادة ارسال الكود', style: font14weight800ColorBlue),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
