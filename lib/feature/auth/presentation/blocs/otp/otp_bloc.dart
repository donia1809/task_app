import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/strings/strings_failures.dart';
import '../../../domain/entities/otp_entity.dart';
import '../../../domain/use_cases/verify_otp_use_case.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final VerifyOtpUseCase otpUseCase;

  OtpBloc({required this.otpUseCase}) : super(OtpInitial()) {
    on<VerifyOtpEvent>((event, emit) async {
      emit(OtpLoadingState());

      final result = await otpUseCase(event.otp, event.accessToken);

      result.fold(
            (failure) => emit(OtpErrorState(message: mapFailureMessage(failure))),
            (response) => emit(OtpSuccessState(client: response)),
      );
    });
  }

  //String _mapFailureMessage(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case ServerFailure:
  //       return SERVER_FAILOUR_MESSAGE;
  //     case OfflineFailure:
  //       return OFFLINE_FAILOUR_MESSAGE;
  //     case NetworkFailure:
  //       return NETWORK_FAILOUR_MESSAGE;
  //     case UnAuthorizedFailure:
  //       return UNAUTHORIZED_FAILOUR_MESSAGE;
  //     default:
  //       return "Unexpected Error!";
  //   }
  // }
}
