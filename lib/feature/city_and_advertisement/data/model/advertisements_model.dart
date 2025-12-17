import '../../domain/entity/advertisements_entity.dart';

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
      id: json['id'] ?? 0,
      name: json['name'] ?? 'بدون اسم',
      image: json['main_image'] ?? '',
      status: json['status'] ?? 'غير معروف',
      price: (json['ask_money'] != null ? (json['ask_money']).toDouble() : 0.0),
      city: json['city'] ?? 'غير محدد',
      managementRatio: (json['partnership_ratio'] != null
          ? (json['partnership_ratio']).toDouble()
          : 0.0),
      isOnline: (json['is_online'] ?? 0) == 1,
      totalProjectEvaluation: (json['total_project_evaluation'] != null
          ? (json['total_project_evaluation']).toDouble()
          : 0.0),
      category: json['category'] ?? 'غير محدد',
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
      'is_online': isOnline ?1:0,
      'total_project_evaluation': totalProjectEvaluation,
      'category': category,
    };
  }
}
