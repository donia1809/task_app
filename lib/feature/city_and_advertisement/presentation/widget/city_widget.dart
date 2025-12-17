import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/theme/colors.dart';
import 'package:task_app/core/theme/text_style.dart';
import '../bloc/city_bloc.dart';
import '../paged/city_and_advertisement_page.dart';

class CitiesWidget extends StatefulWidget {
  const CitiesWidget({super.key});

  @override
  State<CitiesWidget> createState() => _CitiesWidgetState();
}

class _CitiesWidgetState extends State<CitiesWidget> {
  int? selectedCityId;

  @override
  void initState() {
    super.initState();
    context.read<CityBloc>().add(GetCitiesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'المدن',
                style: font16weight500ColorBlack.copyWith(fontSize: 20),
              ),
              Text('عرض الكل', style: font14weight800ColorBlue),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 50,
            child: BlocBuilder<CityBloc, CityState>(
              builder: (context, state) {
                if (state is CityLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is CityLoaded) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.cities.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final city = state.cities[index];
                      final isSelected = city.id == selectedCityId;

                      return InkWell(
                        borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              CityAdvertisementsPage.routeName,
                              arguments: {
                                'cityId': city.id,
                                'cityName': city.name,
                              },
                            );
                          },
                          child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected ? Colors.blue : Colors.white70,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            city.name,
                            style: font14weight400ColorBlack,
                          ),
                        ),
                      );
                    },
                  );
                }

                if (state is CityError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: font14weight400ColorBlack,
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
