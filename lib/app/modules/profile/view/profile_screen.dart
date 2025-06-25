
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_color.dart';
import '../controller/user_profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProfileController>(context, listen: false)
          .fetchUserDetails(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        title:
            const Text("User Details", style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<UserProfileController>(
        builder: (context, controller, child) {
          final user = controller.userProfileModel?.user;

          return SingleChildScrollView(
            child: Column(
              children: [
                // const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          backgroundImage: user?.profilePic != null
                              ? NetworkImage(user!.profilePic.toString())
                              : null,
                          child: user?.profilePic == null
                              ? const Icon(Icons.person,
                                  color: Colors.grey, size: 50)
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.appThemColor,
                          spreadRadius: 0.5,
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 15,
                    ),
                    child: Column(
                      children: [
                        _buildProfileField(
                          "Full Name",
                          user?.fullName ?? "N/A",
                          controller.fullNameController,
                          controller.isEditing,
                        ),
                        const SizedBox(height: 10),
                        _buildProfileField(
                          "Email",
                          user?.email ?? "N/A",
                          controller.emailController,
                          controller.isEditing,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        _buildProfileField(
                          "Phone",
                          user?.phone ?? "N/A",
                          controller.phoneController,
                          controller.isEditing,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 10),
                        _buildProfileField(
                          "WhatsApp",
                          user?.whatsappNumber ?? "N/A",
                          controller.whatsappController,
                          controller.isEditing,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 10),
                        if (!controller.isEditing)
                          Column(
                            children: [
                              _buildProfileRow(
                                  "Role", user?.roleDetails?.label ?? "N/A"),
                              const SizedBox(height: 10),
                              _buildProfileRow("Phone Verified",
                                  user?.phoneVerified == true ? "Yes" : "No"),
                              const SizedBox(height: 10),
                              _buildProfileRow("Is Staff",
                                  user?.isStaff == true ? "Yes" : "No"),
                              const SizedBox(height: 10),
                              _buildProfileRow("User ID", user?.uid ?? "N/A"),
                              const SizedBox(height: 10),
                              _buildProfileRow(
                                  "Created At",
                                  user?.createdAt != null
                                      ? "${user!.createdAt!.day}/${user.createdAt!.month}/${user.createdAt!.year} ${user.createdAt!.hour}:${user.createdAt!.minute}"
                                      : "N/A"),
                              const SizedBox(height: 10),
                              _buildProfileRow(
                                  "Updated At",
                                  user?.updatedAt != null
                                      ? "${user!.updatedAt!.day}/${user.updatedAt!.month}/${user.updatedAt!.year} ${user.updatedAt!.hour}:${user.updatedAt!.minute}"
                                      : "N/A"),
                              const SizedBox(height: 10),
                              _buildProfileRow(
                                  "Last Login",
                                  user?.lastLogin != null
                                      ? "${user!.lastLogin!.day}/${user.lastLogin!.month}/${user.lastLogin!.year} ${user.lastLogin!.hour}:${user.lastLogin!.minute}"
                                      : "N/A"),
                              const SizedBox(height: 10),
                              _buildProfileRow(
                                  "Active Status",
                                  user?.isActive == true
                                      ? "Active"
                                      : "Inactive",
                                  user?.isActive == true
                                      ? AppColors.appGreenColor
                                      : AppColors.appRed),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),

               if(!controller.isEditing)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 85, vertical: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                          controller.toggleEditMode();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isEditing ? AppColors.appBar : Colors.blue[400],
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Edit",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                if (controller.isEditing)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 85, vertical: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                                controller.cancelEdit();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Cancel",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                                controller.updateUserProfile(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: controller.isEditing ? AppColors.appBar : Colors.blue[400],
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Save",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileField(
    String label,
    String value,
    TextEditingController controller,
    bool isEditing, {
    TextInputType? keyboardType,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Text(
          " : ",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          flex: 3,
          child: isEditing
              ? TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: AppColors.appThemColor),
                    ),
                  ),
                )
              : Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildProfileRow(String label, String value, [Color? color]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Text(
          " : ",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: color ?? Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
