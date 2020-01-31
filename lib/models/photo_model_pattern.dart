import 'package:user_structure/models/pattern_model.dart';

abstract class PhotoPatternModel extends PatternModel {
  String content;
  BigInt views;
  String privateUrl;
  String publicUrl;

  PhotoPatternModel.fromJson(json) : super.fromJson(json) {
    this.content = getJsonValue('content');
    this.views = getJsonValue('views');
    this.privateUrl = getJsonValue('private_url');
    this.publicUrl = getJsonValue('public_url');
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();
    
    setJsonValue(map, 'content', this.content);
    setJsonValue(map, 'views', this.views);
    setJsonValue(map, 'private_url', this.privateUrl);
    setJsonValue(map, 'public_url', this.publicUrl);
    
    return map;
  }
}