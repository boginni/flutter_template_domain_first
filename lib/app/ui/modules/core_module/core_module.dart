import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';













import '../../../domain/providers/cache_provider.dart';
import '../../../domain/repositories/profile_repository.dart';
import '../../../domain/repositories/user_leads_repository.dart';
import '../../../domain/use_cases/check_internet_use_case.dart';
import '../../../external/interceptors/dio_offline_cache_interceptor.dart';
import '../../../external/repositories/profile/profile_repository_impl.dart';

class CoreModule extends Module {
  static init() {
    Firebase.initializeApp();
  }

  static Database? database;
  static SharedPreferences? sharedPreferences;

  @override
  void exportedBinds(Injector i) {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.wswork.com.br/',
      ),
    );

    i.addLazySingleton<CheckInternetUseCase>(
      () => CheckInternetUseCaseImpl(
        lookupFunction: () async {
          final result = await InternetAddress.lookup('google.com');
          return result.map((e) => e.rawAddress.length).toList();
        },
      ),
    );

    i.addLazySingleton<CacheProvider>(
      () => SharedPreferencesCacheProvider(
        sharedPreferences: sharedPreferences!,
      ),
    );

    dio.interceptors.add(
      DioOfflineCacheInterceptor(
        cacheService: i.get(),
        checkInternetUseCase: i.get(),
      ),
    );

    i.addInstance(dio);

    migrationFactory() => SqliteMigrationConnection(
          database: database!,
        );

    i.addLazySingleton<MigrationService>(
      () => SqliteDatabaseMigrationService(connection: migrationFactory()),
    );

    i.add<DialogService>(GlobalDialogService.new);

    i.add<FailureMessageExtractionService>(GlobalFailureMessageExtractionService.new);

    i.add<OpenMailService>(CoreOpenMailService.new);

    i.addLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(auth: FirebaseAuth.instance),
    );

    i.addLazySingleton<UserLeadsRepository>(
      () => UserLeadsRepositoryImpl(
        database: database!,
        dio: dio,
      ),
    );
  }
}
