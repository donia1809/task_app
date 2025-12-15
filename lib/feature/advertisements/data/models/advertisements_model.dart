import '../../domain/entities/advertisements_entity.dart';

class AdvertisementModel extends AdvertisementEntity {
  AdvertisementModel({
    required int id,
    required String name,
    required String image,
    required String status,
    required double price,
    required String city,
    required double managementRatio,
    required bool isOnline,
    required double totalProjectEvaluation,
    required String category,
  }) : super(
    id: id,
    name: name,
    image: image,
    status: status,
    price: price,
    city: city,
    managementRatio: managementRatio,
    isOnline: isOnline,
    totalProjectEvaluation: totalProjectEvaluation,
    category: category,
  );

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) {
    return AdvertisementModel(
      id: json['id'],
      name: json['name'] ?? '',
      image: json['main_image'] ?? '',
      status: json['status'] ?? '',
      price: (json['ask_money'] ?? 0).toDouble(),
      city: json['city_name'] ?? 'غير محدد',
      managementRatio:
      (json['partnership_ratio'] ?? 0).toDouble(),
      isOnline: json['is_online'] == 1,
      totalProjectEvaluation:
      (json['total_project_evaluation'] ?? 0).toDouble(),
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'main_image': image,
      'status': status,
      'ask_money': price,
      'city_name': city,
      'partnership_ratio': managementRatio,
      'is_online': isOnline ? 1 : 0,
      'total_project_evaluation': totalProjectEvaluation,
      'category': category,
    };
  }
}
