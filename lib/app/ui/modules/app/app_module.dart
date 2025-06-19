import 'package:flutter_modular/flutter_modular.dart';





class AppModule extends Module {
  static const String splash = '/splash';
  static const String shell = '/shell';
  static const String settings = '/settings';
  static const String auth = '/auth';

  static restartApp() {
    Modular.to.pushNamedAndRemoveUntil(splash, (p0) => true);
  }

  @override
  void routes(r) {
    r.module(
      splash,
      module: SplashModule(),
    );
    r.module(
      shell,
      module: ShellModule(),
    );
    r.module(
      settings,
      module: SettingsModule(),
    );
    r.module(
      auth,
      module: AuthModule(),
    );
  }
}
