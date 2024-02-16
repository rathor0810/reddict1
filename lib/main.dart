import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddict1/feature/auth/screens/login_screen.dart';
import 'package:reddict1/firebase_options.dart';
import 'package:reddict1/theme/pallete.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Reddit shivam',
        theme: Pallete.darkModeAppTheme,
        debugShowCheckedModeBanner: false,
        home: const LoginScreen());
    
  }
}

