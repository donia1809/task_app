import '../error/failure.dart';

const String SERVER_FAILOUR_MESSAGE = 'Please try again';
const String OFFLINE_FAILOUR_MESSAGE = 'Please check your internet connection';
const String NETWORK_FAILOUR_MESSAGE = 'Network error, please try again';
const String UNAUTHORIZED_FAILOUR_MESSAGE = 'Unauthorized, invalid OTP';
const String UNCACHED_FAILOUR_MESSAGE = 'User not found';

String mapFailureMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILOUR_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILOUR_MESSAGE;
    case NetworkFailure:
      return NETWORK_FAILOUR_MESSAGE;
    case UnAuthorizedFailure:
      return UNAUTHORIZED_FAILOUR_MESSAGE;
    case EmptyCacheFailure:
      return UNCACHED_FAILOUR_MESSAGE;
    default:
      return "Unexpected Error!";
  }
}