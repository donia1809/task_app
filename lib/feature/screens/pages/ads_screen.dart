import 'package:flutter/material.dart';
import 'package:task_app/core/theme/colors.dart';
import 'package:task_app/core/theme/text_style.dart';
import '../../city_and_advertisement/presentation/widget/advertisement_widget.dart';

class AdsScreen extends StatelessWidget {
  static const String routeName ='/ads';
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backGround,
      appBar: AppBar(backgroundColor: AppColors.white,title: Text("اعلاناتي",style: font18weight800ColorBlack,),),
      body: AdvertisementWidget(),
    );
  }
}