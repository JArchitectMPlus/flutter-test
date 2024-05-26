// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Srijan Flutter Test`
  String get appName {
    return Intl.message(
      'Srijan Flutter Test',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong!`
  String get networkError {
    return Intl.message(
      'Something went wrong!',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `- {authorName}`
  String author(Object authorName) {
    return Intl.message(
      '- $authorName',
      name: 'author',
      desc: 'authorName',
      args: [authorName],
    );
  }

  /// `Quote {count}`
  String quoteNumber(Object count) {
    return Intl.message(
      'Quote $count',
      name: 'quoteNumber',
      desc: 'count',
      args: [count],
    );
  }

  /// `Author: `
  String get authorName {
    return Intl.message(
      'Author: ',
      name: 'authorName',
      desc: '',
      args: [],
    );
  }

  /// `Date Added: `
  String get dateAdded {
    return Intl.message(
      'Date Added: ',
      name: 'dateAdded',
      desc: '',
      args: [],
    );
  }

  /// `Date Modified: `
  String get dateModified {
    return Intl.message(
      'Date Modified: ',
      name: 'dateModified',
      desc: '',
      args: [],
    );
  }

  /// `Tags: `
  String get tags {
    return Intl.message(
      'Tags: ',
      name: 'tags',
      desc: '',
      args: [],
    );
  }

  /// `Quote id is required`
  String get errorEmptyQuoteId {
    return Intl.message(
      'Quote id is required',
      name: 'errorEmptyQuoteId',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
