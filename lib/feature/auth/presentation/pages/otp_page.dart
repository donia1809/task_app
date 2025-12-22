import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/auth/presentation/blocs/otp/otp_bloc.dart';
import 'package:task_app/feature/auth/presentation/widget/otp_container.dart';
import 'package:task_app/feature/screens/pages/home.dart';
import '../../../../core/common_widget/auth_bg.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/snack_bar_message.dart';


class OtpPage extends StatelessWidget {
  static const String routeName = 'otp Page';

  final String accessToken;
  final List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());

  OtpPage({super.key, required this.accessToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          AuthBackground(),
          Positioned(
            top: 100,
            right: 24,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:  BlocConsumer<OtpBloc,OtpState>
              (
                listener: (context, state) {
                  if(state is OtpSuccessState){
                    Navigator.pushNamed(context, HomePage.routeName);
                  }
                  else if(state is OtpErrorState){
                    showSnackBar(
                        context: context,
                        color: AppColors.red,
                        message: state.message);
                  }
                },
                builder: (context, state) {
                  if(state is OtpLoadingState)
                  {
                    return Center(child: CircularProgressIndicator());
                  }
                  return OtpContainer(
                    otpControllers: otpControllers,

                    accessToken: accessToken,
                  );
                }
            )
          ),
        ],
      ),
    );
  }
}
