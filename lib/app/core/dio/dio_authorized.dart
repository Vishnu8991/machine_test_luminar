import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:machine_test/app/core/storage/auth_store_manager.dart';
import 'package:machine_test/app/data/api_services/api_services.dart';
import 'package:machine_test/app/routes/app_routes.dart';
import 'package:machine_test/app/routes/route_constants.dart';
import 'package:machine_test/app/utils/api_links.dart';
import 'package:machine_test/app/utils/app_color.dart';
import 'package:machine_test/app/utils/app_message.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioUtilAuthorized {
  DioUtilAuthorized._internal();

  static Future<ApiServices> createApiClient() async {
    String baseUrl = ApiLinks.baseUrl;

    try {
      final dioClient = Dio(
        BaseOptions(
          contentType: "application/json",
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(milliseconds: 10000),
        ),
      );

      dioClient.interceptors.addAll([
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: true,
            error: true,
            compact: true,
            maxWidth: 90)
      ]);
      dioClient.interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        bool hasConnection = await InternetConnectionChecker.createInstance().hasConnection;

        if (!hasConnection) {
          AppMessage.showMessage(
            text: 'No internet connection. Please check your connection.',
            backgroundColor: AppColors.appRed,
          );
          MyAppRoute.router.pushNamed(MyAppConstants.internetView);
          return handler.reject(DioException(
            requestOptions: options,
            error: 'No internet connection',
            type: DioExceptionType.unknown,
          ));
        }

        options.headers['accept'] = "*/*";
        final data = LocalStorageManager().adminAccessToken;
        String? token = data;

        if (token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
          log('Authorization token added: $token');
        } else {
          log('No token found, skipping Authorization header');
        }

        log('Request data: ${jsonEncode(options.data)}');
        return handler.next(options);
      },
              onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          LocalStorageManager().clear();
          AppMessage.showMessage(
            text: 'Authorization failed, please relogin',
          );
          MyAppRoute.router.goNamed(MyAppConstants.appSplashScreen);
        }
          else if (error.response?.statusCode == 500) {
          AppMessage.showMessage(
            text: 'Oops! Something went wrong. Please try again.',
          );
        } else if (error.error == 'No internet connection') {
          AppMessage.showMessage(
            text: 'Oops! No internet connection. Please check your connection.',
            backgroundColor: AppColors.appRed,
          );
        } else {
          log('${error.requestOptions.uri}');
          log('Unknown error: ${error.message}');
          AppMessage.showMessage(
            text: 'Server failed: ${error.response?.statusCode}',
          );
        }
        log(error.message.toString());
      }));

      final client = ApiServices(dioClient, baseUrl: baseUrl);
      return client;
    } catch (error) {
      log("Error creating Dio client: $error");
      rethrow;
    }
  }
}
