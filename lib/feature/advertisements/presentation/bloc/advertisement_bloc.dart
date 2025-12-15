import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/advertisements_entity.dart';
import '../../domain/use_cases/advertisement_use_case.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/strings/strings_failures.dart';

part 'advertisement_event.dart';
part 'advertisement_state.dart';

class AdvertisementBloc
    extends Bloc<AdvertisementEvent, AdvertisementState> {
  final GetAdvertisementsUseCase getAdvertisementsUseCase;

  AdvertisementBloc({required this.getAdvertisementsUseCase})
      : super(AdvertisementInitial()) {
    on<GetAdvertisementsEvent>(_onGetAdvertisements);
  }

  Future<void> _onGetAdvertisements(
      GetAdvertisementsEvent event,
      Emitter<AdvertisementState> emit,
      ) async {
    emit(AdvertisementLoading());

    final Either<Failure, List<AdvertisementEntity>> result =
    await getAdvertisementsUseCase(
      cityId: event.cityId,
      status: event.status,
    );

    result.fold(
          (failure) =>
          emit(AdvertisementError(message: mapFailureMessage(failure))),
          (ads) => emit(AdvertisementLoaded(advertisements: ads)),
    );
  }
}
