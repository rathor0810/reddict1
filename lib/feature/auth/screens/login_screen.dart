import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddict1/core/common/loader.dart';
import 'package:reddict1/core/common/sign_in_button.dart';
import 'package:reddict1/core/constants/constants.dart';
import 'package:reddict1/feature/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            Constants.logopath,
            height: 40,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'skip',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: isLoading ? const Loader(): Column (
        children: [
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              'Dive Into Anything',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  letterSpacing: 0.5),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Constants.loinEmothepath,
              height: 300,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SignInButton(),
        ],
      ),
    );
  }
}
