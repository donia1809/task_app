import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/auth/presentation/bloc/login_bloc.dart';
import 'package:task_app/feature/auth/presentation/bloc/otp_bloc.dart';
import 'package:task_app/feature/home_screen.dart';
import 'feature/auth/presentation/pages/login_page.dart';
import 'feature/auth/presentation/pages/otp_page.dart';
import 'dependency_injection.dart'as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init() ;
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (_)=> di.sl<LogInBloc>()),
        BlocProvider(create: (_)=> di.sl<OtpBloc>()),
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.routeName,

        onGenerateRoute: (settings) {
          switch (settings.name) {
            case LoginPage.routeName:
              return MaterialPageRoute(builder: (_) => LoginPage());
            case OtpPage.routeName:
              final args = settings.arguments;
              if (args == null || args is! String) {
                return MaterialPageRoute(builder: (_) => LoginPage());
              }
              return MaterialPageRoute(builder: (_) => OtpPage(accessToken: args));
            case HomePage.routeName:
              return MaterialPageRoute(builder: (_) => HomePage());
            default:
              return MaterialPageRoute(builder: (_) => LoginPage());
          }
        },
      )

    );
  }
}
