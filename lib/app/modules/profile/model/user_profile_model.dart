import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
    @JsonKey(name: "status")
    final String? status;
    @JsonKey(name: "user")
    final User? user;

    UserProfileModel({
        this.status,
        this.user,
    });

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);

    Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}

@JsonSerializable()
class User {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "uid")
    final String? uid;
    @JsonKey(name: "full_name")
    final String? fullName;
    @JsonKey(name: "email")
    final String? email;
    @JsonKey(name: "phone")
    final String? phone;
    @JsonKey(name: "whatsapp_number")
    final String? whatsappNumber;
    @JsonKey(name: "is_active")
    final bool? isActive;
    @JsonKey(name: "phone_verified")
    final bool? phoneVerified;
    @JsonKey(name: "created_at")
    final DateTime? createdAt;
    @JsonKey(name: "updated_at")
    final DateTime? updatedAt;
    @JsonKey(name: "role")
    final int? role;
    @JsonKey(name: "role_details")
    final RoleDetails? roleDetails;
    @JsonKey(name: "is_staff")
    final bool? isStaff;
    @JsonKey(name: "is_superuser")
    final bool? isSuperuser;
    @JsonKey(name: "groups_details")
    final List<dynamic>? groupsDetails;
    @JsonKey(name: "last_login")
    final DateTime? lastLogin;
    @JsonKey(name: "fcm_token")
    final dynamic fcmToken;
    @JsonKey(name: "profile_pic")
    final dynamic profilePic;

    User({
        this.id,
        this.uid,
        this.fullName,
        this.email,
        this.phone,
        this.whatsappNumber,
        this.isActive,
        this.phoneVerified,
        this.createdAt,
        this.updatedAt,
        this.role,
        this.roleDetails,
        this.isStaff,
        this.isSuperuser,
        this.groupsDetails,
        this.lastLogin,
        this.fcmToken,
        this.profilePic,
    });

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class RoleDetails {
    @JsonKey(name: "id")
    final int? id;
    @JsonKey(name: "label")
    final String? label;
    @JsonKey(name: "value")
    final String? value;

    RoleDetails({
        this.id,
        this.label,
        this.value,
    });

    factory RoleDetails.fromJson(Map<String, dynamic> json) => _$RoleDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$RoleDetailsToJson(this);
}
