import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:machine_test/app/modules/home/view/home_screen.dart';
import 'package:machine_test/app/modules/internet/internet_view.dart';
import 'package:machine_test/app/modules/lead_profile.dart/view/lead_profile.dart';
import 'package:machine_test/app/modules/splash/view/splash_view.dart';
import 'package:machine_test/app/routes/route_constants.dart';

import '../modules/login/view/login_screen.dart';
import '../modules/profile/view/profile_screen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyAppRoute {
  static final GoRouter router =
      GoRouter(navigatorKey: navigatorKey, initialLocation: '/', routes: [
    GoRoute(
      name: MyAppConstants.appSplashScreen,
      path: '/',
      pageBuilder: (context, state) {
        return _buildTransition(state, child: const SplashScreen());
      },
    ),
    GoRoute(
      name: MyAppConstants.internetView,
      path: '/InternetView',
      pageBuilder: (context, state) {
        return _buildTransition(state, child: const InternetView());
      },
    ),
    GoRoute(
      name: MyAppConstants.homeScreen,
      path: '/HomeScreen',
      pageBuilder: (context, state) {
        return _buildTransition(state, child: HomeScreen());
      },
    ),
    GoRoute(
      name: MyAppConstants.loginScreen,
      path: '/LoginScreen',
      pageBuilder: (context, state) =>
          _buildTransition(state, child: LoginView()),
    ),
    GoRoute(
        name: MyAppConstants.leadProfile,
        path: '/LeadProfile',
        pageBuilder: (context, state) {
          final leadId = state.pathParameters['leadId'] ?? '';
          return
          _buildTransition(state, child: LeadProfile(leadId: leadId));
        }),
    GoRoute(
      name: MyAppConstants.userProfile,
      path: '/UserProfile',
      pageBuilder: (context, state) =>
          _buildTransition(state, child: ProfileScreen()),
    ),
  ]);

  static CustomTransitionPage<dynamic> _buildTransition(GoRouterState state,
      {required Widget child}) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 1000),
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
