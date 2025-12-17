import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/core/strings/strings_failures.dart';
import '../../domain/entity/city_entity.dart';
import '../../domain/use_case/city_use_case.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final GetCitiesUseCase getCitiesUseCase;

  CityBloc({
    required this.getCitiesUseCase,
  }) : super(CityInitial(),) {

    on<GetCitiesEvent>((event, emit) async {
      emit(CityLoading());

      final result = await getCitiesUseCase();

      result.fold(
        (failure) =>
            emit(CityError(message: mapFailureMessage(failure))),
        (cities) =>
            emit(CityLoaded(cities: cities)),
      );
    });

  }
}
