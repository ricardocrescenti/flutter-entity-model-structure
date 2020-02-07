import 'dart:io';

import 'package:user_structure/classes/storage_uploader_manager.dart';
import 'package:user_structure/models/pattern_model.dart';

abstract class ImagePatternModel extends PatternModel {
  StorageUploaderManager _uploadPhotoManager;
  StorageUploaderManager get uploadPhotoManager {
    if (_uploadPhotoManager == null) {
      _uploadPhotoManager = initializeUploadPhotoManager();
    }
    return _uploadPhotoManager;
  }
  set uploadPhotoManager(StorageUploaderManager value) {
    _uploadPhotoManager = value;
  }
  
  File downloadedPhotoFile;

  String content;
  BigInt views;
  String privateUrl;
  String publicUrl;

  initializeUploadPhotoManager();

  ImagePatternModel.fromJson(json) : super.fromJson(json) {
    this.content = getJsonValue('content');
    this.views = getJsonValue('views');
    this.privateUrl = getJsonValue('private_url');
    this.publicUrl = getJsonValue('public_url');
  }

  @override
  Map<String, dynamic> toJson({bool exportOnlyJsonFields = false}) {
    Map<String, dynamic> map = super.toJson();
    
    setJsonValue(map, 'content', this.content);
    //setJsonValue(map, 'views', this.views);
    setJsonValue(map, 'private_url', this.privateUrl);
    //setJsonValue(map, 'public_url', this.publicUrl);
    
    return filterMap(map, (exportOnlyJsonFields ? json.keys : null));
  }
}