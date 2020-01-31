import 'package:user_structure/models/pattern_model.dart';

abstract class EntityModelPattern<EntityType, Photo> extends PatternModel {
  String name;
  String displayName;
  String email;
  String phoneNumber;
  EntityType entityType;
  String message;
  DateTime birthday;
  String genre;
  String document;
  String document2;
  String document3;
  //BigInt photoId;
  Photo photo;

  EntityType getEntityTypeFromJson(dynamic entityType);
  dynamic entityTypeToJson(EntityType entityType);
  Photo getPhotoFromJson(dynamic json);

  EntityModelPattern.fromJson(json) : super.fromJson(json) {
    this.name = getJsonValue<String>('name');
    this.displayName = getJsonValue<String>('display_name');
    this.email = getJsonValue<String>('email');
    this.phoneNumber = getJsonValue<String>('phone_number');
    this.entityType = getJsonValue<EntityType>('entity_type', convertion: (value) => getEntityTypeFromJson(value));
    this.message = getJsonValue<String>('message');
    this.birthday = getJsonValue<DateTime>('birthday');
    this.genre = getJsonValue<String>('genre');
    this.document = getJsonValue<String>('document');
    this.document2 = getJsonValue<String>('document2');
    this.document3 = getJsonValue<String>('document3');
    //this.photoId = getJsonValue<BigInt>('photo_id');
    this.photo = getJsonValue<Photo>('photo', convertion: (value) => getPhotoFromJson(value));
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();

    setJsonValue(map, 'name', this.name);
    setJsonValue(map, 'display_name', this.displayName);
    setJsonValue(map, 'email', this.email);
    setJsonValue(map, 'phone_number', this.phoneNumber);
    setJsonValue(map, 'entity_type', entityTypeToJson(this.entityType));
    setJsonValue(map, 'message', this.message);
    setJsonValue(map, 'birthday', this.birthday);
    setJsonValue(map, 'genre', this.genre);
    setJsonValue(map, 'document', this.document);
    setJsonValue(map, 'document2', this.document2);
    setJsonValue(map, 'document3', this.document3);
    //setJsonValue(map, 'photo_id', this.photoId, onlyNotNull: true);
    setJsonValue(map, 'photo', this.photo, onlyNotNull: true);
    
    return map;
  }

}