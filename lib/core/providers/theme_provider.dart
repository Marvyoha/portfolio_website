import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLight = true;
  ThemeData _themeMode = lightMode;

  ThemeData get themeMode => _themeMode;
  bool get isLight => _isLight;

  set themeMode(ThemeData themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  set isLight(bool issLight) {
    _isLight = issLight;
    notifyListeners();
  }

  void toggleTheme(BuildContext context) {
    _themeMode = _themeMode == lightMode ? darkMode : lightMode;
    _isLight = _themeMode == lightMode ? true : false;
    notifyListeners();
  // Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (context) =>const OnBoarding()),
  //     (route) => false,
  //   );
  }

 
}