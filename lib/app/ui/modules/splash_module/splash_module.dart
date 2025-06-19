import 'package:flutter_modular/flutter_modular.dart';




import '../auth_module/auth_module.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        AuthModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(
      SplashController.new,
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => SplashPage(
        controller: Modular.get(),
      ),
    );
  }
}
