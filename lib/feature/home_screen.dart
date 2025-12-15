import 'package:flutter/material.dart';

import '../core/common_widget/projects_widget.dart';
import '../core/theme/colors.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(backgroundColor: AppColors.backGround,
        body: ProjectsWidget(projects: [],),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'اضافة اعلان'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'اعلاناتي'),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'المزيد'),
          ],
        ),
      ),
    );
  }
}
