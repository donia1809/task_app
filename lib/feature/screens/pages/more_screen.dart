import 'package:flutter/material.dart';
import 'package:task_app/feature/auth/presentation/pages/login_page.dart';

class MoreScreen extends StatelessWidget
{  static const String routeName = '/more';

@override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          onTap: (){
            Navigator.pushNamed(context,LoginPage.routeName);
          },
          child: Text('Log Out')),
    );
  }

}