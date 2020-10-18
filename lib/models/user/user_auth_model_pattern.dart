import 'package:basic_model_structure/basic_model_structure.dart';
import 'package:entity_model_structure/entity_model_structure.dart';

abstract class UserAuthModelPattern<UserModel extends UserModelPattern> extends PatternModel {
  UserModel user;
  String identification;
  String method;

  UserModel createUserModel(dynamic json);

  UserAuthModelPattern() : super();
  UserAuthModelPattern.fromJson(json) : super.fromJson(json);

  @override
  void updateValues(Map<String, dynamic> values) {
    super.updateValues(values);
    user = readValue<UserModel>('user', convertion: (value) => createUserModel(value));
    identification = readValue<String>('identification');
    method = readValue<String>('method');
  }

  @override
  void writeValues(bool exportOnlyChanged, bool ignoreNulls) {
    writeValue('user', user?.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls), ignoreNull: true);
    writeValue('identification', identification, ignoreNull: true);
    writeValue('method', method);
  }
}