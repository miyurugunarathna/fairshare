import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_role.dart';

export 'user_role.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final UserRole role;

  const User({
    this.id = 0,
    required this.firstName,
    required this.lastName,
    this.email = "",
    required this.phone,
    this.role = UserRole.GUEST,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    UserRole? role,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        role: role ?? this.role,
      );

  String fullName() {
    String result = firstName;
    if (lastName.isNotEmpty) {
      result += " $lastName";
    }
    return result;
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phone,
        role,
      ];
}
