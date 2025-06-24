// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      status: json['status'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      whatsappNumber: json['whatsapp_number'] as String?,
      isActive: json['is_active'] as bool?,
      phoneVerified: json['phone_verified'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      role: (json['role'] as num?)?.toInt(),
      roleDetails: json['role_details'] == null
          ? null
          : RoleDetails.fromJson(json['role_details'] as Map<String, dynamic>),
      isStaff: json['is_staff'] as bool?,
      isSuperuser: json['is_superuser'] as bool?,
      groupsDetails: json['groups_details'] as List<dynamic>?,
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
      fcmToken: json['fcm_token'],
      profilePic: json['profile_pic'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'whatsapp_number': instance.whatsappNumber,
      'is_active': instance.isActive,
      'phone_verified': instance.phoneVerified,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'role': instance.role,
      'role_details': instance.roleDetails,
      'is_staff': instance.isStaff,
      'is_superuser': instance.isSuperuser,
      'groups_details': instance.groupsDetails,
      'last_login': instance.lastLogin?.toIso8601String(),
      'fcm_token': instance.fcmToken,
      'profile_pic': instance.profilePic,
    };

RoleDetails _$RoleDetailsFromJson(Map<String, dynamic> json) => RoleDetails(
      id: (json['id'] as num?)?.toInt(),
      label: json['label'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$RoleDetailsToJson(RoleDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'value': instance.value,
    };
