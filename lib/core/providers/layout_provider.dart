import 'package:flutter/material.dart';

enum Platform { mobile, tablet, desktop }

class LayoutProvider extends ChangeNotifier {
  Platform _currentPlatform = Platform.desktop;

  Platform get currentPlatform => _currentPlatform;

  set currentPlatform(Platform currentPlatform) {
    _currentPlatform = currentPlatform;
  }

  // void setPlatform({required Platform newPlatform}) {
  //   _currentPlatform = newPlatform;
  //   notifyListeners();
  // }
}
