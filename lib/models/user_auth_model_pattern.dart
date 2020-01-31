import 'package:user_structure/models/pattern_model.dart';
import 'package:user_structure/user_structure.dart';

abstract class UserAuthModelPattern<UserModel extends UserModelPattern> extends PatternModel {
  String method;
  String identifer;
  //BigInt userId;
  UserModel user;

  UserModel getUserModel(dynamic json);

  UserAuthModelPattern.fromJson(json) : super.fromJson(json) {
    this.method = getJsonValue<String>('method');
    this.identifer = getJsonValue<String>('identifer');
    //this.userId = getJsonValue<BigInt>('user_id');
    this.user = getJsonValue<UserModel>('user', convertion: (value) => getUserModel(value));
  }

  @override
  Map<String, dynamic> toJson() {
    Map map = super.toJson();

    setJsonValue(map, 'method', this.method);
    setJsonValue(map, 'identifer', this.identifer);
    //setJsonValue(map, 'user_id', this.userId, onlyNotNull: true);
    setJsonValue(map, 'user', (this.user != null ? this.user.toJson() : null), onlyNotNull: true);

    return map;
  }
}