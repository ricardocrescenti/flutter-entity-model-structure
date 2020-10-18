import 'package:basic_model_structure/basic_model_structure.dart';

abstract class EntityPhoneModelPattern<PhoneType> extends PatternModel {
  PhoneType type;
  String phoneNumber;
  String branchLine;
  String contact;

  EntityPhoneModelPattern() : super();
  EntityPhoneModelPattern.fromJson(json) : super.fromJson(json);

  PhoneType convertTypeFromValue(dynamic json);
  dynamic convertTypeToValue(PhoneType type);

  @override
  void readValues() {
    super.readValues();
    type = readValue<PhoneType>('type', convertion: (json) => convertTypeFromValue(json));
    phoneNumber = readValue<String>('phoneNumber');
    branchLine = readValue<String>('branchLine');
    contact = readValue<String>('contact');
  }

  @override
  void writeValues(bool exportOnlyChanged, bool ignoreNulls) {
    writeValue('type', convertTypeToValue(type));
    writeValue('phoneNumber', phoneNumber);
    writeValue('branchLine', branchLine);
    writeValue('contact', contact);
  }
}