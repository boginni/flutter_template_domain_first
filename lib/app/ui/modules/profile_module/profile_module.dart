import 'package:flutter_modular/flutter_modular.dart';



import '../core_module/core_module.dart';

class ProfileModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(
      () => ProfileController(
        profileRepository: i(),
        authRepository: i(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => ProfileWire(
        controller: Modular.get(),
      ),
    );
  }
}
