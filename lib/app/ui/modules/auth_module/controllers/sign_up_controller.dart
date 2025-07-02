import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_module.dart';
import '../../../services/dialog_service.dart';
import '../../../services/failure_message_extraction_service.dart';
import '../auth_module.dart';
import '../stores/sign_up_store.dart';

class SignUpController {
  final AuthRepository repository;
  final FailureMessageExtractionService failureMessageExtractionService;
  final DialogService dialogService;
  final SignUpStore store;

  const SignUpController({
    required this.store,
    required this.repository,
    required this.failureMessageExtractionService,
    required this.dialogService,
  });

  Future<void> signUp() async {
    try {
      if (store.formKey.currentState!.validate() == false) {
        return;
      }

      final param = AuthParam.email(
        email: store.emailController.text,
        password: store.passwordController.text,
      );

      await repository.signUp(param);

      Modular.to.pushReplacementNamed(AppModule.auth + AuthModule.confirmEmail);
    } on Failure catch (e) {
      dialogService.alertSnackBar(
        (context) => failureMessageExtractionService.getErrorMessage(e),
      );
    }
  }
}
