import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:srijan_flutter_test/domain/error/app_error.dart';

class BaseViewModel extends ChangeNotifier {
  final PublishSubject<AppError?> _error = PublishSubject<AppError?>();
  final PublishSubject<String> _toast = PublishSubject<String>();

  Stream<AppError?> get error => _error.stream;

  void showToastWithError(AppError? error) {
    try {
      _error.sink.add(error);
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  Stream<String> get toast => _toast.stream;

  void showToastWithString(String message) {
    _toast.sink.add(message);
  }

  @override
  void dispose() {
    _error.close();
    _toast.close();
    super.dispose();
  }
}
