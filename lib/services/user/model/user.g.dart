// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
    id: json['id'] ?? 0,
    firstName: json['firstName'] ?? '',
    lastName: json['lastName'] ?? '',
    email: json["email"] ?? '',
    phone: json['phone'] ?? '',
    role: UserRole.values.firstWhere((element) => element.text == json["role"], orElse: () => UserRole.GUEST));

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role.text,
    };
