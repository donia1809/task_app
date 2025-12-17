import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/theme/colors.dart';

import '../bloc/advertisement_bloc.dart';
import '../widget/advertisement_widget.dart';

class CityAdvertisementsPage extends StatefulWidget {
  static const routeName = '/city';

  final int cityId;
  final String cityName;

  const CityAdvertisementsPage({
    super.key,
    required this.cityId,
    required this.cityName,
  });

  @override
  State<CityAdvertisementsPage> createState() =>
      _CityAdvertisementsPageState();
}

class _CityAdvertisementsPageState extends State<CityAdvertisementsPage> {
  @override
  void initState() {
    super.initState();
    context.read<AdvertisementBloc>().add(
      GetAdvertisementsEvent(
        cityId: widget.cityId,
        status: 'published',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(backgroundColor: AppColors.backGround,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(widget.cityName),
        ),
        body:  AdvertisementWidget(),
      ),
    );
  }
}
