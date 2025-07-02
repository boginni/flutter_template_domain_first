import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late Locale local;

  @override
  void initState() {
    super.initState();
    local = WidgetsBinding.instance.platformDispatcher.locale;
  }

  void onLocaleChanged(Locale locale) {
    setState(() {
      local = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    const supportedLocales = [
      ...AppLocalizations.supportedLocales,
      // Locale('pt', 'BR'),
      // Locale('en', 'US'),
      // Locale('fr', 'FR'),
      // Locale('de', 'DE'),
      // Locale('es', 'ES'),
      // Locale('ja', 'JP'),
      // Locale('en', ''),
    ];

    final theme = WsWorkTestMobileTheme();

    Modular.setInitialRoute(AppModule.splash);

    return LocaleProvider(
      onLocaleChanged: onLocaleChanged,
      child: MaterialApp.router(
        builder: GlobalScaffoldProvider.builder,
        title: 'Ws Work Test Mobile',
        localizationsDelegates: const [
          ...AppLocalizations.localizationsDelegates,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: local,
        supportedLocales: supportedLocales,
        theme: theme.getLightThemeData(context),
        darkTheme: theme.getDarkThemeData(context),
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}
