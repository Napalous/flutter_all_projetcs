import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NapalConnectivity {
  final Connectivity _connectivity = Connectivity();
  final StreamController<bool> _connectionController = StreamController<bool>.broadcast();

  Stream<bool> get connectionStream => _connectionController.stream;

  YasConnectivity() {
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      _connectionController.add(_hasInternet(results));
    });
  }

  Future<bool> checkConnection() async {
    List<ConnectivityResult> results = await _connectivity.checkConnectivity();
    return _hasInternet(results);
  }

  bool _hasInternet(List<ConnectivityResult> results) {
    return results.any((result) => result == ConnectivityResult.wifi || result == ConnectivityResult.mobile);
  }

  void dispose() {
    _connectionController.close();
  }
}
