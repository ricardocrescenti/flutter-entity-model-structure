import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:user_structure/models/pattern_model.dart';
import 'package:user_structure/user_structure.dart';
import 'package:uuid/uuid.dart';

abstract class EntityModelPattern<EntityType, Photo extends ImagePatternModel> extends PatternModel {
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
  double rating;
  int publicationsQuantity;
  int photosQuantity;
  int contractsQuantity;
  int followersQuantity;
  int followingsQuantity;
  bool imFollowing;
  //BigInt photoId;
  Photo photo;

  EntityType getEntityTypeFromJson(dynamic entityType);
  dynamic entityTypeToJson(EntityType entityType);
  
  Photo getPhotoFromJson(dynamic json);
  Photo createPhotoModel();
  Future<StorageUploadTask> uploadPhoto(File file) async {
    try {

      if (this.photo == null) {
        this.photo = createPhotoModel();
      } else {
        this.photo.privateUrl = null;
        this.photo.publicUrl = null;
      }

      String uuid = Uuid().v1();
      String extension = file.path.split('.').last;
      String fileName = '$uuid.$extension';
      return this.photo.uploadPhotoManager.uploadFile(file, fileName, onComplete: (snapshot) {
        this.photo.privateUrl = snapshot.ref.path;
        this.photo.publicUrl = 'teste';
      });

    } catch(error) {
      print('Erro on upload entity photo.');
      print(error.toString());
    }
    return null;
  }

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
    this.rating = getJsonValue<double>('rating');
    this.publicationsQuantity = getJsonValue<int>('publications_quantity');
    this.photosQuantity = getJsonValue<int>('photos_quantity');
    this.contractsQuantity = getJsonValue<int>('contracts_quantity');
    this.followersQuantity = getJsonValue<int>('followers_quantity');
    this.followingsQuantity = getJsonValue<int>('followings_quantity');
    this.imFollowing = getJsonValue<bool>('im_following', convertion: (value) => (value == 1 ? true : false));
    //this.photoId = getJsonValue<BigInt>('photo_id');
    this.photo = getJsonValue<Photo>('photo', convertion: (value) => getPhotoFromJson(value));
  }

  @override
  Map<String, dynamic> toJson({bool exportOnlyJsonFields = false}) {
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
    setJsonValue(map, 'photo', this.photo?.toJson(exportOnlyJsonFields: exportOnlyJsonFields), onlyNotNull: true);
    
    return filterMap(map, (exportOnlyJsonFields ? json.keys : null));
  }

}