import 'package:flutter_modular/flutter_modular.dart';






import 'controllers/home_controller.dart';
import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<VehicleRepository>(
      VehicleRepositoryImpl.new,
    );

    i.add(LeadsStore.new);

    i.add(HomeStore.new);

    i.add(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomePage(
        homeController: Modular.get(),
      ),
    );
  }
}
