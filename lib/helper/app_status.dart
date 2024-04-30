class Success {
  int code;
  Object response;
  Success({required this.code, required this.response});
}

class Failure {
  int code;
  Object errorResponse;
  Failure({required this.code, required this.errorResponse});
}

class AuthSuccess {
  int status;
  Object response;
  AuthSuccess({required this.status, required this.response});
}

class AuthFailure {
  bool status;
  String response;
  AuthFailure({required this.status, required this.response});
}
