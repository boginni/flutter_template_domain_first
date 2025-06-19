import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppStore extends ChangeNotifier implements ValueListenable<AppStore> {
  @override
  AppStore get value => this;


  Locale? _locale;
  ThemeMode? _themeMode;


}
