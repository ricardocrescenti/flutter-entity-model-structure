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
        this.photo.publicUrl = null;
      });

    } catch(error) {
      print('Erro on upload entity photo.');
      print(error.toString());
    }
    return null;
  }

  List<EntityAddressModel> getEntityAddressesFromJson(dynamic json);

  EntityModelPattern.fromJson(json) : super.fromJson(json);
  EntityModelPattern.empty() : super.empty();

  @override
  void updateValues(Map<String, dynamic> values) {
    super.updateValues(values);
    name = getJsonValue<String>('name');
    displayName = getJsonValue<String>('display_name');
    email = getJsonValue<String>('email');
    phoneNumber = getJsonValue<String>('phone_number');
    entityType = getJsonValue<EntityType>('entity_type', convertion: (value) => getEntityTypeFromJson(value));
    message = getJsonValue<String>('message');
    birth = getJsonValue<DateTime>('birth');
    gender = getJsonValue<String>('gender');
    document = getJsonValue<String>('document');
    document2 = getJsonValue<String>('document2');
    document3 = getJsonValue<String>('document3');
    rating = getJsonValue<double>('rating');
    publicationsQuantity = getJsonValue<int>('publications_quantity');
    photosQuantity = getJsonValue<int>('photos_quantity');
    contractsQuantity = getJsonValue<int>('contracts_quantity');
    followersQuantity = getJsonValue<int>('followers_quantity');
    followingsQuantity = getJsonValue<int>('followings_quantity');
    imFollowing = getJsonValue<bool>('im_following', convertion: (value) => (value == 1 ? true : false));
    photo = getJsonValue<PhotoModel>('photo', convertion: (value) => getPhotoFromJson(value));
    addresses = getJsonValue<List<EntityAddressModel>>('entities_addresses_entity', convertion: (value) => getEntityAddressesFromJson(value));
  }

  @override
  Map<String, dynamic> toJson({bool exportOnlyChanged = false, bool ignoreNulls = false}) {
    Map<String, dynamic> map = super.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls);

    setJsonValue(map, 'name', name);
    setJsonValue(map, 'display_name', displayName);
    setJsonValue(map, 'email', email);
    setJsonValue(map, 'phone_number', phoneNumber);
    setJsonValue(map, 'entity_type', entityTypeToJson(), onlyNotNull: true);
    setJsonValue(map, 'message', message);
    setJsonValue(map, 'birth', birth);
    setJsonValue(map, 'gender', gender);
    setJsonValue(map, 'document', document);
    setJsonValue(map, 'document2', document2);
    setJsonValue(map, 'document3', document3);
    setJsonValue(map, 'photo', photo?.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls), onlyNotNull: true);
    setJsonValue(map, 'entities_addresses_entity', addresses, onlyNotNull: true, convertion: (address) => address.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls));
    
    return map;
  }
}