part of 'advertisement_bloc.dart';
abstract class AdvertisementEvent extends Equatable {
  const AdvertisementEvent();

  @override
  List<Object?> get props => [];
}

class GetAdvertisementsEvent extends AdvertisementEvent {
  final int? cityId;
  final String? status;

  const GetAdvertisementsEvent({this.cityId, this.status});

  @override
  List<Object?> get props => [cityId, status];
}
