import 'package:flutter/material.dart';
import 'package:reddict1/feature/auth/screens/login_screen.dart';
import 'package:reddict1/feature/community/screens/create_community_screen.dart';
import 'package:reddict1/feature/home/screen/home_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute =
    RouteMap(routes: {'/': (_) => const MaterialPage(child: LoginScreen())});
final loggedInRoute =
    RouteMap(routes: {'/': (_) => const MaterialPage(child: HomeScreen()),
    '/create-community': (_) => const MaterialPage(child: CreateCommunityScreen()),});
