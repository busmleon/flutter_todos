import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localizator {
  final Locale locale;
  Map<String, String> _localizedStrings;

  Localizator({@required this.locale}) : assert(locale != null);

  static Localizator of(BuildContext context) =>
      Localizations.of<Localizator>(context, Localizator);

  Future<void> load() async {
    final String jsonString =
        await rootBundle.loadString('lang/${this.locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    this._localizedStrings = jsonMap
        .map<String, String>((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) => this._localizedStrings[key];

  static const LocalizationsDelegate<Localizator> delegate =
      _LocalizatorDelegate();
}

class _LocalizatorDelegate extends LocalizationsDelegate<Localizator> {
  const _LocalizatorDelegate();

  @override
  bool isSupported(Locale locale) =>
      (const ['en', 'de']).contains(locale.languageCode);

  @override
  Future<Localizator> load(Locale locale) async {
    final Localizator localizations = Localizator(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Localizator> old) => false;
}
