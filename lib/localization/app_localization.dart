import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../core/app_export.dart';
import 'en/en_translations.dart';

extension LocalizationExtennsion on String {
  String get tr => AppLocalization.of().getString(this);
}

//ignore_for_file: must_be_immutable
class AppLocalization {
  AppLocalization(this.locale);

  Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': en,
  };

  static AppLocalization of() {
    return Localizations.of<AppLocalization>(
        NavigatorService.navigatorKey.currentContext!, AppLocalization)!;
  }

  static List<String> languages() => _localizedValues.keys.toList();
  String getString(String key) =>
      _localizedValues[locale.languageCode]![key] ?? key;

}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  //returning a synchronous future here because an async load operation
  //cause an async load operation
  @override
  bool isSupported(Locale locale) =>
      AppLocalization.languages().contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}