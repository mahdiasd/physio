abstract class AppException implements Exception {
  final String? message;
  final int? code;

  const AppException({this.message = "", this.code});
}

class NetworkException extends AppException {
  const NetworkException({super.message, super.code});
}

class HttpException extends AppException {
  const HttpException({super.message, super.code});
}

class UnknownException extends AppException {
  const UnknownException({super.message, super.code});
}

class TimeoutException extends AppException {
  const TimeoutException({super.message}) : super(code: 408);
}
