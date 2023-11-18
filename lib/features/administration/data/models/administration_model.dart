import 'package:test_app/features/administration/data/models/administration_model.g.dart';
import 'package:test_app/features/administration/domain/entity/administration_entity.dart';

class AdministrationModel extends AdministrationEntity {
  const AdministrationModel(
      {required super.address,
      required super.id,
      required super.email,
      required super.username,
      required super.password,
      required super.name,
      required super.phone,
      required super.v});
  factory AdministrationModel.fromJson(Map<String, dynamic> json) => AdministrationModelFromJson(json);
}
