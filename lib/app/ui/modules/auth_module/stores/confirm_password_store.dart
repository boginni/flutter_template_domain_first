import 'package:flutter/cupertino.dart';

class ConfirmPasswordStore extends ChangeNotifier {
  UserEntity? user;

  bool _isLoading = true;

  ConfirmPasswordStore();

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
