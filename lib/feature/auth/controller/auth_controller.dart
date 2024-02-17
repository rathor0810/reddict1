import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddict1/core/utils.dart';
import 'package:reddict1/feature/auth/repository/auth_repository.dart';

final authControllerProvider = Provider(
    (ref) => AuthController(authRepository: ref.read(authRepositoryProvider)));

class AuthController {
  final AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  void signInWithGoogle(BuildContext context) async {
    final user = await _authRepository.signInWithGoogle();
    user.fold(
        (l) => showSnackBar(
              context,
            l.message),
        (r) => null);
  }
}
