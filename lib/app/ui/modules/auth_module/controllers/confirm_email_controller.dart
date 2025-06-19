


class ConfirmEmailController {
  final ProfileRepository profileRepository;
  final ConfirmPasswordStore store;

  const ConfirmEmailController({
    required this.profileRepository,
    required this.store,
  });

  Future<void> sendEmailVerification() async {
    await profileRepository.sendEmailVerification();
  }

  Future<void> init() async {
    profileRepository.sendEmailVerification();
    store.user = await profileRepository.me();
    store.isLoading = false;
  }
}
