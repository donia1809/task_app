import 'package:flutter/material.dart';
import 'package:task_app/core/theme/text_style.dart';
import '../../feature/city_and_advertisement/domain/entity/advertisements_entity.dart';

class AdvertisementDetails extends StatelessWidget {
  final AdvertisementEntity advertisement;

  const AdvertisementDetails({
    super.key,
    required this.advertisement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        height: 130,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(advertisement.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(advertisement.name, style: font14weight800ColorBlue),
                        Text(advertisement.city, style: font12weight400ColorGrey),
                        Text(advertisement.category, style: font12weight400ColorGrey),
                        Text(
                          'تقييم: ${advertisement.totalProjectEvaluation}',
                          style: font12weight400ColorGrey,
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${advertisement.price}', style: font12weight400ColorGrey),
                        Text('${advertisement.managementRatio}%', style: font12weight400ColorGrey),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
