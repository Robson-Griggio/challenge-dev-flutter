import 'dart:async';
import 'package:flutter/foundation.dart';

typedef CommandAction0<T> = Future<T> Function();
typedef CommandAction1<T, A> = Future<T> Function(A);

abstract class Command<T> extends ChangeNotifier {
  bool _running = false;
  bool get running => _running;

  T? _data;
  T? get data => _data;

  Object? _error;
  Object? get error => _error;
  bool get hasError => _error != null;
  bool get isCompleted => _data != null && _error == null;
  bool get hasResult => _data != null || _error != null;

  void clearResult() {
    _data = null;
    _error = null;
    notifyListeners();
  }

  Future<void> _execute(CommandAction0<T> action) async {
    if (_running) return;

    _running = true;
    _data = null;
    _error = null;
    notifyListeners();

    try {
      _data = await action();
      _error = null;
    } catch (e) {
      _error = e;
      _data = null;
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

final class Command0<T> extends Command<T> {
  Command0(this._action);
  final CommandAction0<T> _action;

  Future<void> execute() async {
    await _execute(() => _action());
  }
}

final class Command1<T, A> extends Command<T> {
  Command1(this._action);
  final CommandAction1<T, A> _action;

  Future<void> execute(A argument) async {
    await _execute(() => _action(argument));
  }
}
