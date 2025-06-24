import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:machine_test/app/core/storage/auth_store_manager.dart';
import 'package:machine_test/app/modules/internet/connectivity_controller.dart';
import 'package:machine_test/app/modules/splash/view/splash_view.dart';
import 'package:provider/provider.dart';

import 'app/modules/home/controller/leads_controller.dart';
import 'app/modules/lead_profile.dart/controller/lead_profile_controller.dart';
import 'app/modules/login/controller/login_controller.dart';
import 'app/modules/profile/controller/user_profile_controller.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeInternetService();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageManager().init();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LeadsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LeadProfileController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProfileController(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: FToastBuilder(),
        routerDelegate: MyAppRoute.router.routerDelegate,
        routeInformationParser: MyAppRoute.router.routeInformationParser,
        scaffoldMessengerKey: scaffoldMessengerKey,
        title: 'Application',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routeInformationProvider: MyAppRoute.router.routeInformationProvider,
      ),
    );
  }
}
