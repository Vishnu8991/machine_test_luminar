import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:machine_test/app/utils/app_message.dart';

import '../../../core/dio/dio_authorized.dart';
import '../../../utils/common_dialog.dart';
import '../model/user_profile_model.dart';

class UserProfileController extends ChangeNotifier{

  UserProfileModel? userProfileModel;

    bool isEditing = false;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();

  void fetchUserDetails(BuildContext context) async {
    try {
      // CommonDialog.showLoadingDialog(context);
      final client = await DioUtilAuthorized.createApiClient();
      final result = await client.userProfile();

      if (result.status == "success") {
        userProfileModel = result;
      }
      notifyListeners();
    } catch (e) {
      log("Error fetching data: $e");
    }
    finally {
      // CommonDialog.closeLoadingDialog(context);
    }
  }

  void _populateControllers() {
    if (userProfileModel?.user != null) {
      fullNameController.text = userProfileModel!.user!.fullName ?? '';
      emailController.text = userProfileModel!.user!.email ?? '';
      phoneController.text = userProfileModel!.user!.phone ?? '';
      whatsappController.text = userProfileModel!.user!.whatsappNumber ?? '';
    }
  }

  void toggleEditMode() {
    isEditing = !isEditing;
    if (isEditing) {
      _populateControllers();
    }
    notifyListeners();
  }

  void cancelEdit() {
    isEditing = false;
    _populateControllers();
    notifyListeners();
  }

  Future<void> updateUserProfile(BuildContext context) async {
    try {
      CommonDialog.showLoadingDialog(context);
      final client = await DioUtilAuthorized.createApiClient();
      
      final result = await client.updateUserProfile(
        fullNameController.text.trim(),
        emailController.text.trim(),
        phoneController.text.trim(),
        whatsappController.text.trim(),
      );

      if (result.status == "success") {
        userProfileModel = result;
        isEditing = false;
        
        // Show success message

        AppMessage.showMessage(
          backgroundColor: Colors.green,
          text: 'Profile updated successfully!',
        );
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Profile updated successfully!'),
        //     backgroundColor: Colors.green,
        //   ),
        // );
      }
      notifyListeners();
    } catch (e) {
      log("Error updating profile: $e");
      
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update profile: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      CommonDialog.closeLoadingDialog(context);
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    whatsappController.dispose();
    super.dispose();
  }


}