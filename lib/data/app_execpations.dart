// Base Exception Class
class AppException implements Exception {
  final String? _message;
  final String _prefix;

  AppException([this._message, this._prefix = ""]);

  @override
  String toString() {
    return '$_prefix${_message ?? ""}';
  }
}

// Fetch Data Exception
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication: ');
}

// Bad Request Exception
class BadRequestException extends AppException {
  BadRequestException([String? message])
      : super(message, 'Invalid Request: ');
}

// Unauthorized Exception
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized Request: ');
}

// Invalid Input Exception
class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, 'Invalid Input: ');
}
