import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:basic_structure/basic_structure.dart';
import 'package:user_structure/user_structure.dart';

abstract class EntityModelPattern<EntityType, PhotoModel extends ImageModelPattern, EntityAddressModel extends EntityAddressModelPattern> extends PatternModel {
  String name;
  String displayName;
  String email;
  String phoneNumber;
  EntityType entityType;
  String message;
  DateTime birth;
  String gender;
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
  PhotoModel photo;
  List<EntityAddressModel> addresses;

  EntityType getEntityTypeFromJson(dynamic entityType);
  String getEntityTypeDescription();
  dynamic entityTypeToJson();
  
  PhotoModel getPhotoFromJson(dynamic json);
  PhotoModel createPhotoModel();
  Future<StorageUploadTask> uploadPhoto(File file) async {
    try {

      if (this.photo == null) {
        this.photo = createPhotoModel();
      } else {
        this.photo.privateUrl = null;
        this.photo.publicUrl = null;
      }

      return this.photo.uploadPhotoManager.uploadFile(file, onComplete: (snapshot) {
        this.photo.privateUrl = snapshot.ref.path;
        this.photo.publicUrl = 'teste';
      });

    } catch(error) {
      print('Erro on upload entity photo.');
      print(error.toString());
    }
    return null;
  }

  List<EntityAddressModel> getEntityAddressesFromJson(dynamic json);
  List<Map<String, dynamic>> entityAddressesToJson();

  EntityModelPattern.fromJson(json) : super.fromJson(json) {
    this.name = getJsonValue<String>('name');
    this.displayName = getJsonValue<String>('display_name');
    this.email = getJsonValue<String>('email');
    this.phoneNumber = getJsonValue<String>('phone_number');
    this.entityType = getJsonValue<EntityType>('entity_type', convertion: (value) => getEntityTypeFromJson(value));
    this.message = getJsonValue<String>('message');
    this.birth = getJsonValue<DateTime>('birth');
    this.gender = getJsonValue<String>('gender');
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
    this.photo = getJsonValue<PhotoModel>('photo', convertion: (value) => getPhotoFromJson(value));
    this.addresses = getJsonValue<List<EntityAddressModel>>('entities_addresses_entity', convertion: (value) => getEntityAddressesFromJson(value));
  }

  @override
  Map<String, dynamic> toJson({bool exportOnlyJsonFields = false}) {
    Map<String, dynamic> map = super.toJson();

    setJsonValue(map, 'name', this.name);
    setJsonValue(map, 'display_name', this.displayName);
    setJsonValue(map, 'email', this.email);
    setJsonValue(map, 'phone_number', this.phoneNumber);
    setJsonValue(map, 'entity_type', entityTypeToJson());
    setJsonValue(map, 'message', this.message);
    setJsonValue(map, 'birth', this.birth);
    setJsonValue(map, 'gender', this.gender);
    setJsonValue(map, 'document', this.document);
    setJsonValue(map, 'document2', this.document2);
    setJsonValue(map, 'document3', this.document3);
    setJsonValue(map, 'photo', this.photo?.toJson(exportOnlyJsonFields: exportOnlyJsonFields), onlyNotNull: true);
    setJsonValue(map, 'entities_addresses_entity', entityAddressesToJson());
    
    return filterMap(map, (exportOnlyJsonFields ? json.keys : null));
  }
}