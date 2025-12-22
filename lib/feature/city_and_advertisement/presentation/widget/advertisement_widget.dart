import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/advertisement_bloc.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_style.dart';
import '../../../../core/common_widget/advertisement_details.dart';

class AdvertisementWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertisementBloc, AdvertisementState>(
      builder: (context, state) {
        if (state is AdvertisementLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is AdvertisementErrorState) {
          return Center(
            child: Text(
              state.message,
              style: font16weight500ColorBlack.copyWith(color: AppColors.red),
            ),
          );
        }
        if (state is AdvertisementLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            scrollDirection: Axis.vertical,
            itemCount: state.advertisements.length,
            itemBuilder: (context, index) {
              final advertisement = state.advertisements[index];
              return AdvertisementDetails(advertisement: advertisement);
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
