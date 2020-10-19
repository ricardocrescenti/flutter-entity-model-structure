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
  void readValues() {
    super.readValues();
    entity = readValue<EntityModel>('entity', convertion: (value) => createEntityModel(value));
    message = readValue<String>('message');
    permissions = readListValue<PermissionModel>('permissions', convertion: (permission) => createPermissionModel(permission));
  }

  @override
  void writeValues(bool exportOnlyChanged, bool ignoreNulls) {
    writeValue('entity', entity?.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls), ignoreNull: true);
    writeValue('message', message);
    writeValue('permissions', permissions?.map((permission) => permission.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls))?.toList());
  }
}