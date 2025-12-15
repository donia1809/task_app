import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:task_app/feature/auth/presentation/bloc/login_bloc.dart';
import 'package:task_app/feature/auth/presentation/pages/otp_page.dart';
import '../../../../core/common_widget/auth_bg.dart';
import '../widget/auth_container.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/snack_bar_message.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body:
      SizedBox.expand(
        child: Stack(
          children: [
            AuthBackground(),
            Align(
              alignment: Alignment.bottomCenter,
              child:  BlocConsumer<LogInBloc,LogInState>
                (
                listener: (context, state) {
                  if(state is LoginSuccessState){
                    Navigator.pushNamed(context, OtpPage.routeName
                    ,arguments: state.client.access_token);
                  }
                  else if(state is LoginErrorState){
                    showSnackBar(
                        context: context,
                        color: AppColors.red,
                        message: state.message);
                  }
                },
                builder: (context, state) {
                  if(state is LoginLoadingState)
                  {
                    return Center(child: CircularProgressIndicator());
                  }
                  return AuthContainer();
                }
            )
            ),
          ],
        ),
      ),
    );
  }
}
