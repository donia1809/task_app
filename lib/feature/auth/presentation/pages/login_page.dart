import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/auth/presentation/blocs/login/login_bloc.dart';
import 'package:task_app/feature/auth/presentation/pages/otp_page.dart';
import '../../../../core/common_widget/auth_bg.dart';
import '../widget/login_container.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/snack_bar_message.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: SizedBox.expand(
        child: Stack(
          children: [
            AuthBackground(),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocListener<LogInBloc, LogInState>(
                listener: (context, state) {
                  if (state is LoginSuccessState) {
                    Navigator.pushNamed(
                      context,
                      OtpPage.routeName,
                      arguments: state.client.access_token,
                    );
                  } else if (state is LoginErrorState) {
                    showSnackBar(
                      context: context,
                      color: AppColors.red,
                      message: state.message,
                    );
                  }
                },
             child: LogInContainer(),
              
          
             ) ),
          ],
        ),
      ),
    );
  }
}
