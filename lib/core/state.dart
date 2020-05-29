import 'package:flutter/cupertino.dart';

import 'error/failures.dart';

class State<T, E extends Failure> {
  State({@required T data, @required E error})
      : assert(data != null || error != null),
        this._data = data,
        this._error = error;

  factory State.success(T data) = SuccessState<T, E>;

  factory State.error(E error) = ErrorState<T, E>;

  T _data;
  E _error;

  bool get hasData => _data != null;

  bool get hasError => _error != null;

  B fold<B>(B Function(T value) success, B Function(Failure failure) error) {
    if (hasData) {
      return success(_data);
    } else if (hasError) {
      return error(_error);
    } else {
      throw Exception("Unexpected error");
    }
  }
}

class SuccessState<T, E extends Failure> extends State<T, E> {
  SuccessState(this._data) : super(data: _data, error: null);
  final T _data;

  T get data => _data;
}

class ErrorState<T, E extends Failure> extends State<T, E> {
  ErrorState(this._error) : super(data: null, error: _error);
  final E _error;

  E get error => _error;
}
