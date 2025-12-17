import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/auth/presentation/bloc/login_bloc.dart';
import 'package:task_app/feature/auth/presentation/bloc/otp_bloc.dart';
import 'package:task_app/feature/screens/pages/home.dart';
import 'feature/auth/presentation/pages/login_page.dart';
import 'feature/auth/presentation/pages/otp_page.dart';
import 'dependency_injection.dart'as di;
import 'feature/city_and_advertisement/presentation/bloc/advertisement_bloc.dart';
import 'feature/city_and_advertisement/presentation/bloc/city_bloc.dart';
import 'feature/city_and_advertisement/presentation/paged/city_and_advertisement_page.dart';
import 'feature/screens/pages/add_ads_screen.dart';
import 'feature/screens/pages/ads_screen.dart';
import 'feature/screens/pages/more_screen.dart';

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
        BlocProvider(create: (_)=> di.sl<CityBloc>()),
        BlocProvider(create: (_)=> di.sl<AdvertisementBloc>()),
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

            case CityAdvertisementsPage.routeName:
              final args = settings.arguments;
              if (args is! Map<String, dynamic>) {
                return MaterialPageRoute(builder: (_) => HomePage());
              }
              return MaterialPageRoute(
                builder: (_) => CityAdvertisementsPage(
                  cityId: args['cityId'],
                  cityName: args['cityName'],
                ),);
            case AdsScreen.routeName:
              return MaterialPageRoute(builder: (_) => AdsScreen());
            case AddAdsScreen.routeName:
              return MaterialPageRoute(builder: (_) => AddAdsScreen());
            case MoreScreen.routeName:
              return MaterialPageRoute(builder: (_) => MoreScreen());
            default:
              return MaterialPageRoute(builder: (_) => LoginPage());
          }
        },
      )

    );
  }
}
