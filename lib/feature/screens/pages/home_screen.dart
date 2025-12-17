import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_style.dart';
import '../../city_and_advertisement/presentation/bloc/advertisement_bloc.dart';
import '../../city_and_advertisement/presentation/bloc/city_bloc.dart';
import '../../city_and_advertisement/presentation/widget/advertisement_widget.dart';
import '../../city_and_advertisement/presentation/widget/city_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CityBloc>().add(GetCitiesEvent());

    context.read<AdvertisementBloc>().add(
      GetAdvertisementsEvent(
        cityId: 0,
        status: 'published',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius:  BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.only(right: 24.0, top: 40),
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset('assets/images/logo2.png', height: 40),
            ),
          ),
        ),

        const SizedBox(height: 16),
        Image.asset('assets/images/seed.png'),
        const SizedBox(height: 16),
        CitiesWidget(),
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text('المشاريع', style: font16weight500ColorBlack),
              const Spacer(),
              Text('عرض الكل', style: font14weight800ColorBlue),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AdvertisementWidget(),
          ),
        ),
      ],
    );
  }
}
