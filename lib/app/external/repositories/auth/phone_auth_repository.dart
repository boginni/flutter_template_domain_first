import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/dto/entities/user/user_credential_entity.dart';
import '../../../domain/dto/params/auth_param.dart';
import '../../../domain/errors/auth/auth_error.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../handlers/firebase_auth_exception_handler.dart';

ConfirmationResult? _confirmationResult;

class PhoneAuthRepository implements AuthRepository {
  PhoneAuthRepository({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  @override
  Future<UserCredentialEntity> signIn(AuthParam param) async {
    try {
      if (_confirmationResult == null) {
        throw const InternalAuthError('ConfirmationResult is null');
      }

      final user = await _confirmationResult!.confirm(param.verificationId);

      final token = await user.user!.getIdToken();

      _confirmationResult = null;

      return UserCredentialEntity(
        token: token!,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e).message;
    }
  }

  @override
  Future<void> signUp(AuthParam param) async {
    try {
      _confirmationResult = await firebaseAuth.signInWithPhoneNumber(
        param.phoneNumber,
      );

      return;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e).message;
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
