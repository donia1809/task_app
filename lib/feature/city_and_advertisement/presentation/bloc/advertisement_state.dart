part of 'advertisement_bloc.dart';

abstract class AdvertisementState extends Equatable {
  const AdvertisementState();

  @override
  List<Object?> get props => [];
}

class AdvertisementInitial extends AdvertisementState {}

class AdvertisementLoading extends AdvertisementState {}

class AdvertisementLoaded extends AdvertisementState {
  final List<AdvertisementEntity> advertisements;

  const AdvertisementLoaded({required this.advertisements});

  @override
  List<Object?> get props => [advertisements];
}

class AdvertisementErrorState extends AdvertisementState {
  final String message;

  const AdvertisementErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
