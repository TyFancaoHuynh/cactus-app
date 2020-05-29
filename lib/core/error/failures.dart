import 'package:flutter/cupertino.dart';

abstract class Failure {
  const Failure(String msg) : this.msg = msg;
  final String msg;

  @override
  String toString() {
    return 'Failure{msg: $msg}';
  }
}

// General failures
class SeverFailure extends Failure {
  SeverFailure({@required String msg, @required this.code}) : super(msg);

  final int code;

  factory SeverFailure.fromJson(Map<String, dynamic> json) {
    return SeverFailure(
        //TODO change by sever define
        msg: json["message"],
        code: json["status_code"]);
  }

  @override
  String toString() {
    return 'SeverFailure{code: $code}, msg $msg';
  }
}

class FirebaseError extends Failure {
  FirebaseError({@required String msg}) : super(msg);

  @override
  String toString() {
    return 'FirebaseError{$msg}';
  }
}
