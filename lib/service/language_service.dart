import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LanguageService with ChangeNotifier {
  LanguageService(this._sp);

  final String _kLanguage = 'kLanguage';

  final SharedPreferences _sp;

  void setLocale(String locale){
    _sp.setString(_kLanguage, locale);
    notifyListeners();
  }

  String getLocale(){
      return _sp.getString(_kLanguage) ?? 'zh';
  }
}
