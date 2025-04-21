import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core

// For checking internet connectivity
abstract class NetworkInfoI {
  Future<bool> get isConnected;
  Future<ConnectivityResult> get connectivityResult;
  Stream<ConnectivityResult> get onConnectivityChanged;
}

final GlobalKey<ScaffoldMessengerState> globalMessengerKey =
GlobalKey<ScaffoldMessengerState>();

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());

  factory NetworkInfo() {
    return _networkInfo;
  }

  NetworkInfo._internal(this.connectivity);

  ///checks internet is connected or not
  ///returns [true] if internet is connected
  ///else it will return [false]
  @override
  Future<bool> get isConnected async {
    final result = await connectivityResult;
    return result != ConnectivityResult.none;
  }

  // to check the type of internet connection
  @override
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  //check the type on internet connection on changed of internet connection
  @override
  Stream<ConnectivityResult> get onConnectivityChanged {
    return connectivity.onConnectivityChanged;
  }
}

abstract class Failure {}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String message = 'No Internet Connection']) {
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!.showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
    _message = message;
  }

  @override
  String toString() {
    return _message;
  }
}

void handleFirebaseException(dynamic error) {
  if (error is FirebaseException) {
    if (error.code == 'network-request-failed') {
      // Firebase Authentication network error
      showSnackBar('Network error: Please check your internet connection.');
    } else {
      // Handle other Firebase Authentication errors
      showSnackBar('Firebase error: ${error.message}');
    }
  } else {
    // Handle other types of errors
    showSnackBar('An unexpected error occurred: $error');
  }
}

void showSnackBar(String message) {
  if (globalMessengerKey.currentState != null) {
    globalMessengerKey.currentState!.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
