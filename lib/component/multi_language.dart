import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'constants.dart';
export 'language_key.dart';

class Languages {
  final String en = 'assets/jsons/en.json';
  final String vi = 'assets/jsons/vi.json';
  bool isVI(String lang) => lang == vi;
}


class MultiLanguage {
  static late Map<String, dynamic> phrases;

  static Future<void> setLanguage({String? lang}) async {
    String key = 'lang';
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString(key) != null && lang == null) {
      lang = prefs.getString(key);
    }

    final languages = Languages();
    if (lang == null) {
      lang = languages.vi;
      Constants.locale = Constants.localeVI;
      Constants.localeLang = Constants.localeVILang;
    } else {
      if (languages.isVI(lang)) {
        Constants.locale = Constants.localeVI;
        Constants.localeLang = Constants.localeVILang;
      } else {
        Constants.locale = Constants.localeEN;
        Constants.localeLang = Constants.localeENLang;
      }
    }

    var file = await rootBundle.loadString(lang);
    await prefs.setString(key, lang);
    phrases = jsonDecode(file);
  }

  static String get(String key) => phrases.containsKey(key) ? phrases[key] : key;
}
