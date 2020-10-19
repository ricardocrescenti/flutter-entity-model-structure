import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:basic_model_structure/basic_model_structure.dart';
import 'package:entity_model_structure/entity_model_structure.dart';

abstract class EntityModelPattern<EntityDocumentModel extends EntityDocumentModelPattern, EntityPhoneModel extends EntityPhoneModelPattern, EntityAddressModel extends EntityAddressModelPattern, PhotoModel extends FileModelPattern> extends PatternModel {
  String name;
  String displayName;
  String email;
  DateTime birthData;
  String gender;
  List<EntityDocumentModel> documents;
  List<EntityPhoneModel> phones;
  List<EntityAddressModel> addresses;
  PhotoModel photo;

  // double rating;
  // int publicationsQuantity;
  // int photosQuantity;
  // int contractsQuantity;
  // int followersQuantity;
  // int followingsQuantity;
  // bool imFollowing;
  
  EntityDocumentModel createEntityDocumentModel(dynamic json);
  EntityPhoneModel createEntityPhoneModel(dynamic json);
  EntityAddressModel createEntityAddressModel(dynamic json);
  PhotoModel createPhotoModel(dynamic json);

  Future<StorageUploadTask> uploadPhoto(File file) async {
    try {

      if (this.photo == null) {
        this.photo = createPhotoModel(null);
      } else {
        this.photo.privateUrl = null;
        this.photo.publicUrl = null;
      }

      return this.photo.uploadPhotoManager.uploadFile(file, onComplete: (snapshot) {
        this.photo.privateUrl = snapshot.ref.path;
        this.photo.type = snapshot.storageMetadata.contentType;
        this.photo.publicUrl = null;
      });

    } catch(error) {
      print('Erro on upload entity photo.');
      print(error.toString());
    }
    return null;
  }


  EntityModelPattern() : super();
  EntityModelPattern.fromJson(json) : super.fromJson(json);

  @override
  void readValues() {
    super.readValues();
    name = readValue<String>('name');
    displayName = readValue<String>('displayName');
    email = readValue<String>('email');
    birthData = readValue<DateTime>('birthData');
    gender = readValue<String>('gender');
    documents = readListValue<EntityDocumentModel>('documents', convertion: (value) => createEntityDocumentModel(value));
    phones = readListValue<EntityPhoneModel>('phones', convertion: (value) => createEntityPhoneModel(value));
    addresses = readListValue<EntityAddressModel>('entities_addresses_entity', convertion: (value) => createEntityAddressModel(value));
    photo = readValue<PhotoModel>('photo', convertion: (value) => createPhotoModel(value));
  }

  @override
  void writeValues(bool exportOnlyChanged, bool ignoreNulls) {
    writeValue('name', name);
    writeValue('displayName', displayName);
    writeValue('email', email);
    writeValue('birthData', birthData);
    writeValue('gender', gender);
    writeValue('documents', documents, ignoreNull: true, convertion: (document) => document.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls));
    writeValue('phones', phones, ignoreNull: true, convertion: (phone) => phone.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls));
    writeValue('addresses', addresses, ignoreNull: true, convertion: (address) => address.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls));
    writeValue('photo', photo?.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls), ignoreNull: true);
  }
}