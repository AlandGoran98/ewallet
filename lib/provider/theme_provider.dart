import 'package:flutter/foundation.dart';

class ThemeChange with ChangeNotifier {
  bool _isLight = false;
  bool get isLight {
    return _isLight;
  }

  bool changeTheme() {
    return _isLight = true;
    notifyListeners();
  }
}
