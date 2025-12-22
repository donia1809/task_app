import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/auth/presentation/blocs/app_bloc/app_bloc.dart';
import 'package:task_app/feature/auth/presentation/pages/login_page.dart';

class MoreScreen extends StatelessWidget
{  static const String routeName = '/more';

@override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          onTap: (){
            context.read<AppBloc>().add(AppLoggedOutEvent());
            //Navigator.pushNamed(context,LoginPage.routeName);
          },
          child: Text('Log Out')),
    );
  }

}