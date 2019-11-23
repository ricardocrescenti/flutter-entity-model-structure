import 'package:user_structure/models/pattern_model.dart';

abstract class EntityModelPattern<EntityType, Photo> extends PatternModel {
  String name;
  String displayName;
  String email;
  String phoneNumber;
  EntityType entityType; //não fazer parte do default
  String message;
  String birthday;
  String genre;
  String document;
  String document2;
  String document3;
  Photo photo;

  EntityType getEntityTypeFromJson(dynamic entityType);
  Photo getPhotoFromJson(dynamic photo);

  EntityModelPattern.fromJson(json) : super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();

    return map;
  }

}