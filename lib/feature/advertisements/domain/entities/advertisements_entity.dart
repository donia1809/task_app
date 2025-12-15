import 'package:equatable/equatable.dart';

class AdvertisementEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final String status;
  final double price;
  final String city;
  final double managementRatio;
  final bool isOnline;
  final double totalProjectEvaluation;
  final String category;

  AdvertisementEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.price,
    required this.city,
    required this.managementRatio,
    required this.isOnline,
    required this.totalProjectEvaluation,
    required this.category,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    image,
    status,
    price,
    city,
    managementRatio,
    isOnline,
    totalProjectEvaluation,
    category,
  ];
}
