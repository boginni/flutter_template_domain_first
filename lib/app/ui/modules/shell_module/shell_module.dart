import 'package:flutter_modular/flutter_modular.dart';

import '../home_module/home_module.dart';

class ShellModule extends Module {
  static const String home = '/home';
  static const String profile = '/profile';
  static const String info = '/info';

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const ShellWire(),
      children: [
        ModuleRoute(home, module: HomeModule()),
        ModuleRoute(profile, module: ProfileModule()),
        ModuleRoute(info, module: InfoModule()),
      ],
    );
  }
}
