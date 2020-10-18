import 'package:basic_model_structure/basic_model_structure.dart';
import 'package:entity_model_structure/entity_model_structure.dart';

abstract class UserModelPattern<EntityModel extends EntityModelPattern, PermissionModel extends PermissionModelPattern<dynamic, dynamic>> extends PatternModel {
  EntityModel entity;
  String message;
  List<PermissionModel> permissions;

  EntityModel createEntityModel(dynamic json);
  PermissionModel createPermissionModel(dynamic json);

  UserModelPattern() : super();
  UserModelPattern.fromJson(json) : super.fromJson(json);

  @override
  void updateValues(Map<String, dynamic> values) {
    super.updateValues(values);
    entity = readValue<EntityModel>('entity', convertion: (value) => createEntityModel(value));
    message = readValue<String>('message');
    permissions = readValue<List<PermissionModel>>('permissions', convertion: (permissions) => permissions.forEach((permission) => createPermissionModel(permission)).toList());
  }

  @override
  void writeValues(bool exportOnlyChanged, bool ignoreNulls) {
    writeValue('entity', entity?.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls), ignoreNull: true);
    writeValue('message', message);
    writeValue('permissions', permissions?.map((permission) => permission.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls))?.toList());
  }
}