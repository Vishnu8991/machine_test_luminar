// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      whatsappNumber: json['whatsapp_number'] as String?,
      role: json['role'] as String?,
      roleId: json['role_id'] as String?,
      isSuperuser: json['is_superuser'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'whatsapp_number': instance.whatsappNumber,
      'role': instance.role,
      'role_id': instance.roleId,
      'is_superuser': instance.isSuperuser,
    };
