import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/app/core/storage/auth_store_manager.dart';
import 'package:machine_test/app/modules/login/model/login_model.dart';
import 'package:machine_test/app/routes/app_routes.dart';
import 'package:machine_test/app/routes/route_constants.dart';
import 'package:machine_test/app/utils/api_links.dart';
import 'package:machine_test/app/utils/common_dialog.dart';

import '../../../core/dio/dio_authorized.dart';

class LoginController extends ChangeNotifier {

  Future<void> login(BuildContext context, TextEditingController email,
      TextEditingController password) async {
    try {
      CommonDialog.showLoadingDialog(context);

      final client = await DioUtilAuthorized.createApiClient();

      final String userEmail = email.text.trim();
      final String userPassword = password.text.trim();

      final loginResponse = await client.login(userEmail, userPassword);

      if (loginResponse.access != null) {
        print("Login successful: ${loginResponse.access}");

        LocalStorageManager().adminAccessToken = loginResponse.access!;
        MyAppRoute.router.goNamed(MyAppConstants.homeScreen);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("Invalid response from server."),
          ),
        );
      }
    } on DioException catch (dioError) {
      final errorData = dioError.response?.data;
      final message = errorData is Map<String, dynamic> && errorData['error'] != null
          ? errorData['error']
          : "An error occurred. Please try again.";

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Unexpected error: $e"),
        ),
      );
    } finally {
      CommonDialog.closeLoadingDialog(context);
    }
  }
}