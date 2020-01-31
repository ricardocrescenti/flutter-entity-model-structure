import 'package:user_structure/user_structure.dart';

abstract class UserModelPattern<EntityModel extends EntityModelPattern> extends PatternModel {
  //BigInt entityId;
  EntityModel entity;

  getEntityModel(dynamic json);

  UserModelPattern.fromJson(json) : super.fromJson(json) {
    //this.entityId = getJsonValue<BigInt>('entity_id');
    this.entity = getJsonValue<EntityModel>('entity', convertion: (value) => getEntityModel(value));
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();

    //setJsonValue(map, 'entity_id', this.entityId, onlyNotNull: true);
    setJsonValue(map, 'entity', (this.entity != null ? this.entity.toJson() : null), onlyNotNull: true);
    
    return map;
  }
}