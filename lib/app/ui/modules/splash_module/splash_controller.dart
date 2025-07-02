import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';

class SplashController {
  final ProfileRepository profileRepository;
  final UserLeadsRepository userLeadsRepository;
  final MigrationService migrationService;

  const SplashController({
    required this.userLeadsRepository,
    required this.profileRepository,
    required this.migrationService,
  });

  Future<void> init() async {
    try {
      await migrationService.up();
    } catch (e) {
      /// Not implemented due to time constraints
      rethrow;
    }

    Timer.periodic(const Duration(minutes: 10), (timer) {
      userLeadsRepository.sync();
    });

    try {
      await profileRepository.me();

      Modular.to.pushReplacementNamed(AppModule.shell);
    } catch (e) {
      Modular.to.pushReplacementNamed(AppModule.auth);
    }
  }
}
