import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:machine_test/app/utils/app_color.dart';
import 'package:machine_test/app/utils/app_message.dart';

Future<void> initializeInternetService() async {
  InternetConnectionChecker.createInstance().onStatusChange.listen((event) {
    switch (event) {
      case InternetConnectionStatus.disconnected:
        AppMessage.showMessage(
            textColor: AppColors.appWhite,
            text: 'oops! no internet connection',
            backgroundColor: AppColors.appRed);
        break;
      default:
        break;
    }
  });
}
