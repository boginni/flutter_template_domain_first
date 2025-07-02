import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/repositories/auth_repository.dart';
import 'controllers/confirm_email_controller.dart';

class AuthModule extends Module {
  static const String signIn = '/';

  static const String confirmEmail = '/confirm-email';

  static const String resetPassword = '/reset-password';

  static const String signUp = '/sign-up';

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.add<AuthRepository>(
      () => AnonymousAuthRepository(firebaseAuth: FirebaseAuth.instance),
    );
  }

  @override
  void binds(Injector i) {
    i.add(
      SignInStore.new,
    );

    i.add(
      SignUpStore.new,
    );

    i.add(
      ConfirmPasswordStore.new,
    );

    i.add(
      ResetPasswordStore.new,
    );

    i.addLazySingleton(
      () => ResetPasswordController(
        profileRepository: i.get(),
        store: i.get(),
      ),
    );

    i.addLazySingleton(
      () => ConfirmEmailController(
        profileRepository: i.get(),
        store: i.get(),
      ),
    );

    i.addLazySingleton(
      () => SignUpController(
        store: i.get(),
        repository: EmailAuthRepository(
          firebaseAuth: FirebaseAuth.instance,
        ),
        failureMessageExtractionService: i.get(),
        dialogService: i.get(),
      ),
    );

    i.addLazySingleton(
      () => SignInController(
        emailAuthRepository: EmailAuthRepository(
          firebaseAuth: FirebaseAuth.instance,
        ),
        googleAuthRepository: GoogleAuthRepository(),
        phoneAuthRepository: PhoneAuthRepository(
          firebaseAuth: FirebaseAuth.instance,
        ),
        anonymousAuthRepository: AnonymousAuthRepository(
          firebaseAuth: FirebaseAuth.instance,
        ),
        failureMessageExtractionService: i.get(),
        dialogService: i.get(),
        signInStore: i.get(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (context) => SignInPage(
        controller: Modular.get(),
      ),
    );

    r.child(
      confirmEmail,
      child: (context) => ConfirmEmailPage(
        openMailService: Modular.get(),
        controller: Modular.get(),
      ),
    );

    r.child(
      resetPassword,
      child: (context) => ResetPasswordPage(
        openMailService: Modular.get(),
        controller: Modular.get(),
      ),
    );

    r.child(
      signUp,
      child: (context) => SignUpPage(
        controller: Modular.get(),
      ),
    );
  }
}
