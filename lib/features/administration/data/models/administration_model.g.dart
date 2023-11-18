import 'package:test_app/features/administration/data/models/administration_model.dart';

AdministrationModel AdministrationModelFromJson(Map<String,dynamic>json)=>AdministrationModel(
  address:json['address']as Map<String,dynamic>? ??{},
  id:json['id']as int? ??0,
  email:json['email'] as String? ??'',
  username:json['username'] as String? ??'',
  password:json['password'] as String? ??'',
  name:json['name'] as Map<String,dynamic>? ??{},
  phone:json['phone'] as String? ??'',
  v:json['__v']as int? ??0,
);
Map<String,dynamic> AdministrationModelToJson(AdministrationModel instance)=><String,dynamic>{
  'address':instance.address,
  'id':instance.id,
  'email':instance.email,
  'username':instance.username,
  'password':instance.password,
  'name':instance.name,
  'phone':instance.phone,
  '__v':instance.v,
};