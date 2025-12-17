import 'package:flutter/material.dart';
import 'package:task_app/feature/screens/pages/home_screen.dart';
import '../../../core/theme/colors.dart';
import 'add_ads_screen.dart';
import 'ads_screen.dart';
import 'more_screen.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> pages = [HomeScreen(), AdsScreen(),AddAdsScreen(),MoreScreen()];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body:pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.white,
          unselectedItemColor: Colors.white38,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية',),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'اعلاناتي'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'اضافة اعلان',),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'المزيد',),
          ],
        ),
      ),
    );
  }
}
