import 'package:flutter/cupertino.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = 'en';

  void ChangeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }
}
