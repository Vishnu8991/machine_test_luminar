import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'login_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
    @JsonKey(name: "refresh")
    final String? refresh;
    @JsonKey(name: "access")
    final String? access;
    @JsonKey(name: "user")
    final User? user;

    LoginResponseModel({
        this.refresh,
        this.access,
        this.user,
    });

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class User {
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
    @JsonKey(name: "role")
    final String? role;
    @JsonKey(name: "role_id")
    final String? roleId;
    @JsonKey(name: "is_superuser")
    final bool? isSuperuser;

    User({
        this.uid,
        this.fullName,
        this.email,
        this.phone,
        this.whatsappNumber,
        this.role,
        this.roleId,
        this.isSuperuser,
    });

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);
}
