class ResetPasswordController {
  final ResetPasswordStore store;
  final ProfileRepository profileRepository;

  const ResetPasswordController({
    required this.store,
    required this.profileRepository,
  });

  void sendResetPasswordEmail() async {
    try {
      store.isLoading = true;
      await profileRepository.sendPasswordResetEmail(store.emailController.text);
      await Future.delayed(const Duration(seconds: 2));
      store.emailSent = true;
    } finally {
      store.isLoading = false;
    }
  }
}
