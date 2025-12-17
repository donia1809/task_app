import '../error/failure.dart';

const String SERVER_FAILOUR_MESSAGE = 'Please try again';
const String OFFLINE_FAILOUR_MESSAGE = 'Please check your internet connection';
const String NETWORK_FAILOUR_MESSAGE = 'Network error, please try again';
const String UNAUTHORIZED_FAILOUR_MESSAGE = 'Unauthorized, invalid OTP';
const String UNCACHED_FAILOUR_MESSAGE = 'User not found';
const String ADVERTISEMENT_FAILOUR_MESSAGE = 'No advertisements found';
const String VALIDATION_FAILOUR_MESSAGE = 'Validation error, please check your input';
const String UNEXPECTED_FAILOUR_MESSAGE = 'Something went wrong';


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
    case ValidationFailure:
      return VALIDATION_FAILOUR_MESSAGE;
    case AdvertisementFailure:
      return ADVERTISEMENT_FAILOUR_MESSAGE;
    default:
      return UNEXPECTED_FAILOUR_MESSAGE;
  }
}
