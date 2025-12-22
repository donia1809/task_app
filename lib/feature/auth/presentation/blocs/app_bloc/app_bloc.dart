import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/strings/strings_failures.dart';
import 'package:task_app/core/strings/strings_message.dart';
import 'package:task_app/feature/auth/domain/use_cases/app_use_case.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final GetChachedAccessTokenUseCase getChachedAccessTokenUseCase;
  final ClearAccessTokenUseCase clearAccessTokenUseCase;
  final CacheAccessTokenUseCase cacheAccessTokenUseCase;
  AppBloc({
    required this.getChachedAccessTokenUseCase,
    required this.clearAccessTokenUseCase,
    required this.cacheAccessTokenUseCase,
  }) : super(AppInitialState()) {
    on<AppStartedEvent>((event, emit) async {
      final result = await getChachedAccessTokenUseCase();
      result.fold(
        (failure) =>
            emit(AppUnAuthenticatedState(message: mapFailureMessage(failure))),
        (accessToken) => emit(AppAuthenticatedState(accessToken: accessToken)),
      );
    });

    on<AppLoggedInEvent>((event, emit) async {
      await cacheAccessTokenUseCase(event.accessToken);
      emit(AppAuthenticatedState(accessToken: event.accessToken));
    });

    on<AppLoggedOutEvent>((event, emit) async {
      await clearAccessTokenUseCase();      emit(AppInitialState());

      emit(AppUnAuthenticatedState(message: LOGOUT_SUCCESS_MESSAGE));
    });

    on<AppContinueAsGuestEvent>((event, emit) async {
      emit(AppGuestState());
    });
  }

}
