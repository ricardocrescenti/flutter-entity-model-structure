import 'package:basic_model_structure/basic_model_structure.dart';
import 'package:user_structure/user_structure.dart';

abstract class PermissionModelPattern<UserModel extends UserModelPattern, EntityModel extends EntityModelPattern> extends PatternModel {
  UserModel user;
  EntityModel entity;
  bool active;
  DateTime expirationDate;

  createUserModel(dynamic json);
  createEntityModel(dynamic json);

  PermissionModelPattern() : super();
  PermissionModelPattern.fromJson(json) : super.fromJson(json);

  @override
  void updateValues(Map<String, dynamic> values) {
    super.updateValues(values);
    user = readValue<UserModel>('user', convertion: (value) => createUserModel(value));
    entity = readValue<EntityModel>('entity', convertion: (value) => createEntityModel(value));
	  active = readValue<bool>('user');
	  expirationDate = readValue<DateTime>('expirationDate');
  }

  @override
  void writeValues(bool exportOnlyChanged, bool ignoreNulls) {
    writeValue('user', user?.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls), ignoreNull: true);
    writeValue('entity', entity?.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls), ignoreNull: true);
	  writeValue('active', active);
	  writeValue('expirationDate', expirationDate);
  }
}