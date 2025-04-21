import 'package:flutter/material.dart';

//ignore_for_file: must_be_immutable
class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void pushNamed(String routeName, {dynamic arguments}) {
    try {
      navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
    } catch (e) {
      print('Error navigating to $routeName: $e');
      // Handle the error appropriately (e.g., log it, display an error message)
    }
  }

  static void goBack() {
    try {
      navigatorKey.currentState?.pop();
    } catch (e) {
      print('Error going back: $e');
      // Handle the error appropriately
    }
  }

  static void pushNamedAndRemoveUntil(String routeName,
      {bool routePredicate = false, dynamic arguments}) {
    try {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
          routeName, (route) => routePredicate,
          arguments: arguments);
    } catch (e) {
      print('Error navigating to $routeName and removing until predicate: $e');
      // Handle the error appropriately
    }
  }

  static void popAndPushNamed(String routeName, {dynamic arguments}) {
    try {
      navigatorKey.currentState?.popAndPushNamed(routeName, arguments: arguments);
    } catch (e) {
      print('Error popping and pushing to $routeName: $e');
      // Handle the error appropriately
    }
  }
}
