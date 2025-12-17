part of 'advertisement_bloc.dart';

abstract class AdvertisementEvent extends Equatable {
  const AdvertisementEvent();
  @override
  List<Object?> get props => [];
}

class GetAdvertisementsEvent extends AdvertisementEvent {
  final int cityId;
  final String status;

  GetAdvertisementsEvent({required this.cityId,required this.status});

  @override
  List<Object?> get props => [cityId, status];
}

class FilterAdvertisementsByCityEvent extends AdvertisementEvent {
  final int cityId;
  final String status;

  FilterAdvertisementsByCityEvent({
    required this.cityId,
    required this.status,
  });

  @override
  List<Object?> get props => [cityId, status];
}
