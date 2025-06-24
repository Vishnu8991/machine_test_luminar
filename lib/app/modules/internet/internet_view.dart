import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:machine_test/app/routes/app_routes.dart';
import 'package:machine_test/app/routes/route_constants.dart';
import 'package:machine_test/app/utils/app_color.dart';
import 'package:machine_test/app/utils/app_images_path.dart';

class InternetView extends StatelessWidget {
  const InternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.filledTextFieldColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            LottieBuilder.asset(AppImagesPath.noInternet),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Oops!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: AppColors.appWhite),
                ),
                SizedBox(height: 20),
                Text(
                  'It seems there is something wrong with your internet connection. Please connect to the internet again',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appWhite,
                  ),textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      MyAppRoute.router.goNamed(MyAppConstants.appSplashScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent, // Custom color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      'TRY AGAIN',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
