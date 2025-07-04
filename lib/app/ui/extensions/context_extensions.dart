import 'package:flutter/material.dart';

import '../../../gen/app_localizations.g.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  AppLocalizations get appLocalizations => AppLocalizations.of(this)!;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}
