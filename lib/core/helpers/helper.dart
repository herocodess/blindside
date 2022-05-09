import '../error/failures.dart';

class Helper {
  static String mapFailureToMessage(Failure failure) {
    try {
      switch (failure.runtimeType) {
        case InternetFailure:
          return "Please check your internet connection";

        case ApiFailure:
          return (failure as ApiFailure).message;
        default:
          return 'Unexpected Error';
      }
    } catch (e) {
      return 'Unexpected Error';
    }
  }
}
