import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/core/strings/strings_failures.dart';
import '../../domain/entity/advertisements_entity.dart';
import '../../domain/use_case/advertisement_use_case.dart';

part 'advertisement_event.dart';
part 'advertisement_state.dart';

class AdvertisementBloc extends Bloc<AdvertisementEvent, AdvertisementState> {
  final GetAdvertisementsUseCase getAdvertisementsUseCase;

  AdvertisementBloc({
    required this.getAdvertisementsUseCase,
  }) : super(AdvertisementInitial()) {
    on<GetAdvertisementsEvent>((event, emit) async {
      emit(AdvertisementLoading());

      final result = await getAdvertisementsUseCase(
        cityId: event.cityId,
        status: event.status,
      );

      result.fold(
        (failure) => emit(AdvertisementErrorState(mapFailureMessage(failure))),
        (ads) => emit(AdvertisementLoaded(advertisements: ads)),
      );

    });

    on<FilterAdvertisementsByCityEvent>((event, emit) async {
      emit(AdvertisementLoading());

      final result = await getAdvertisementsUseCase(
        cityId: event.cityId,
        status: event.status,
      );

      result.fold(
            (failure) => emit(AdvertisementErrorState(mapFailureMessage(failure))),
            (ads) => emit(AdvertisementLoaded(advertisements: ads)),
      );
    });

  }
}
