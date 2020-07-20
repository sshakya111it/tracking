// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    longitude: json['longitude'] as String,
    latitude: json['latitude'] as String,
    branch_id: json['branch_id'] as int,
    branch_name: json['branch_name'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'branch_id': instance.branch_id,
      'branch_name': instance.branch_name,
    };
