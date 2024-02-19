import 'package:flutter/material.dart';
import 'package:reddict1/feature/auth/screens/login_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute =
    RouteMap(routes: {'/': (_) => const MaterialPage(child: LoginScreen())});
