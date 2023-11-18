import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class AdministrationEntity extends Equatable {
  @JsonKey(defaultValue: '')
  final Map<String, dynamic> address;
  @JsonKey(defaultValue: '')
  final int id;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String username;
  @JsonKey(defaultValue: '')
  final String password;
  @JsonKey(defaultValue: '')
  final Map<String, dynamic> name;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final int v;

  const AdministrationEntity({required this.address, required this.id, required this.email, required this.username, required this.password, required this.name, required this.phone, required this.v});

  @override
  List<Object?> get props => [address,id,email,username,password,name,phone,v];
}
