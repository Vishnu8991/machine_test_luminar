import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machine_test/app/core/storage/auth_store_manager.dart';
import 'package:machine_test/app/modules/home/view/home_screen.dart';
import 'package:machine_test/app/modules/login/view/login_screen.dart';

import '../../../routes/app_routes.dart';
import '../../../routes/route_constants.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), 
      end: Offset.zero, 
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () async {
      await _checkToken();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _checkToken() async {
    String token = LocalStorageManager().adminAccessToken;
    MyAppRoute.router.goNamed(
      token.isNotEmpty ? MyAppConstants.homeScreen : MyAppConstants.loginScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5), // Adjust opacity here
            ),
          ),
          // Animated Text
          Align(
          alignment: Alignment.center,
          child: SlideTransition(
            position: _slideAnimation,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 150,
              width: double.infinity,
              child: Lottie.asset(
                'assets/image/Clock Loading.json',
                repeat: true,
                animate: true,
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}
