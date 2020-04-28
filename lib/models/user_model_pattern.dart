import 'package:basic_structure/basic_structure.dart';
import 'package:user_structure/user_structure.dart';

abstract class UserModelPattern<EntityModel extends EntityModelPattern> extends PatternModel {
  EntityModel entity;

  getEntityModel(dynamic json);

  UserModelPattern.fromJson(json) : super.fromJson(json);
  UserModelPattern.empty() : super.empty();

  @override
  void updateValues(Map<String, dynamic> values) {
    super.updateValues(values);
    entity = getJsonValue<EntityModel>('entity', convertion: (value) => getEntityModel(value));
  }

  @override
  Map<String, dynamic> toJson({bool exportOnlyChanged = false, bool ignoreNulls = false}) {
    Map<String, dynamic> map = super.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls);

    setJsonValue(map, 'entity', entity?.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls), onlyNotNull: true);
    
    return map;
  }
}