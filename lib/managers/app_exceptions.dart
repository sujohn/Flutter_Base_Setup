class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, 'Error During Communication: ');
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, 'Invalid Request: ');
}

class UnAuthorisedException extends AppExceptions {
  UnAuthorisedException([String? message]) : super(message, 'UnAuthorised Request: ');
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message, 'Invalid Input: ');
}

class ResourceNotFoundException extends AppExceptions {
  ResourceNotFoundException([String? message]) : super(message, 'Resource Not Found Exception: ');
}

class InternalServerException extends AppExceptions {
  InternalServerException([String? message]) : super(message, 'Internal Server Exception: ');
}