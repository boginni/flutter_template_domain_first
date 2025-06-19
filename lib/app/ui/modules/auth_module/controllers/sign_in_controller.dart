import 'package:flutter_modular/flutter_modular.dart';




import '../../../../domain/repositories/auth_repository.dart';
import '../../../app_module.dart';
import '../../../services/dialog_service.dart';
import '../../../services/failure_message_extraction_service.dart';

class SignInController {
  final AuthRepository emailAuthRepository;
  final AuthRepository googleAuthRepository;
  final AuthRepository phoneAuthRepository;
  final AuthRepository anonymousAuthRepository;

  final FailureMessageExtractionService failureMessageExtractionService;
  final DialogService dialogService;
  final SignInStore signInStore;

  const SignInController({
    required this.emailAuthRepository,
    required this.googleAuthRepository,
    required this.phoneAuthRepository,
    required this.anonymousAuthRepository,
    required this.failureMessageExtractionService,
    required this.dialogService,
    required this.signInStore,
  });

  Future<void> init() async {}

  void navigateToShell() {
    Modular.to.pushReplacementNamed(AppModule.shell);
  }

  Future<void> _authenticate({
    required AuthRepository repository,
    required AuthParam param,
  }) async {
    try {
      signInStore.errorMessage = '';

      await repository.signIn(
        param,
      );

      navigateToShell();
    } on Failure catch (e) {
      final message = failureMessageExtractionService.getErrorMessage(e);

      signInStore.errorMessage = message;

      dialogService.alertSnackBar((context) => message);
    }
  }

  Future<void> signIn() async {
    if (signInStore.formKey.currentState?.validate() == false) {
      return;
    }

    if (signInStore.isPhoneSelected) {
      await signInWithPhone();
      return;
    }

    await signInWithEmail();
  }

  /// I won't have time to implement this method, but it should be implemented
  Future<void> signInWithGoogle() async {
    await _authenticate(
      repository: googleAuthRepository,
      param: AuthParam.anonymous(),
    );
  }

  Future<void> signInWithPhone() async {
    await _authenticate(
      repository: phoneAuthRepository,
      param: AuthParam.phone(
        phoneNumber: signInStore.phoneController.text,
      ),
    );
  }

  Future<void> signInWithEmail() async {
    await _authenticate(
      repository: emailAuthRepository,
      param: AuthParam.email(
        email: signInStore.emailController.text,
        password: signInStore.passwordController.text,
      ),
    );
  }

  Future<void> signInAnonymously() async {
    await _authenticate(
      repository: anonymousAuthRepository,
      param: AuthParam.anonymous(),
    );
  }
}
