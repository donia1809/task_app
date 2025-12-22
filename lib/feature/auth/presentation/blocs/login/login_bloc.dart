import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/strings/strings_failures.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/use_cases/login_with_mobile_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final LogInWithMobileUseCase loginUseCase;

  LogInBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginWithMobileEvent>((event, emit) async {
      emit(LoginLoadingState());

      final result = await loginUseCase(event.mobile);

      result.fold(
            (failure) => emit(LoginErrorState(message: mapFailureMessage(failure))),
            (user) => emit(LoginSuccessState(client: user)),
      );
    });
  }

}

