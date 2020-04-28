import 'package:basic_structure/basic_structure.dart';
import 'package:user_structure/user_structure.dart';

abstract class UserAuthModelPattern<UserModel extends UserModelPattern> extends PatternModel {
  String method;
  String identifer;
  UserModel user;

  UserModel getUserModel(dynamic json);

  UserAuthModelPattern.fromJson(json) : super.fromJson(json);
  UserAuthModelPattern.empty() : super.empty();

  @override
  void updateValues(Map<String, dynamic> values) {
    super.updateValues(values);
    method = getJsonValue<String>('method');
    identifer = getJsonValue<String>('identifer');
    user = getJsonValue<UserModel>('user', convertion: (value) => getUserModel(value));
  }

  @override
  Map<String, dynamic> toJson({bool exportOnlyChanged = false, bool ignoreNulls = false}) {
    Map map = super.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls);

    setJsonValue(map, 'method', method);
    setJsonValue(map, 'identifer', identifer, alwaysExport: true);
    setJsonValue(map, 'user', user?.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls), onlyNotNull: true);

    return map;
  }
}