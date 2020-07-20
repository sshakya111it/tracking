import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String name;
  String email;
  String password;
  String longitude;
  String latitude;
  int branch_id;
  String branch_name;

  User(
      {this.name,
      this.email,
      this.password,
      this.longitude,
      this.latitude,
      this.branch_id,
      this.branch_name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
