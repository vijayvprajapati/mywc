//This class contain user defined exception to throw when any error occur from dio while api call process

class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return "$message $prefix";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message, 'S.current.errorDuringCommunication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, 'S.current.invalidRequest');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, 'S.current.unauthorised');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, 'S.current.invalidInput');
}

class RequestCanceledException extends AppException {
  RequestCanceledException([String? message])
      : super(message, 'S.current.invalidInput');
}

class ServerSideException extends AppException {
  ServerSideException([String? message])
      : super(message, 'S.current.invalidInput');
}

class ConnectionException extends AppException {
  ConnectionException([String? message])
      : super(message, 'S.current.invalidInput');
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message, 'S.current.noActiveInternetConnection');
}
