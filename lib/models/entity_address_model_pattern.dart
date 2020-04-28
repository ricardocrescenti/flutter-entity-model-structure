import 'package:basic_structure/basic_structure.dart';

abstract class EntityAddressModelPattern extends PatternModel {
  String contact;
  String street;
  String number;
  String neighborhood;
  String complement;
  String cityName;
  String cityCode;
  String zipCode;
  String state;
  String country;

  EntityAddressModelPattern.fromJson(json) : super.fromJson(json);
  EntityAddressModelPattern.empty() : super.empty();

  @override
  void updateValues(Map<String, dynamic> values) {
    super.updateValues(values);
    contact = getJsonValue<String>('contact');
    street = getJsonValue<String>('street');
    number = getJsonValue<String>('number');
    neighborhood = getJsonValue<String>('neighborhood');
    complement = getJsonValue<String>('complement');
    cityName = getJsonValue<String>('city_name');
    cityCode = getJsonValue<String>('city_code');
    zipCode = getJsonValue<String>('zip_code');
    state = getJsonValue<String>('state');
    country = getJsonValue<String>('country');
  }

  @override
  Map<String, dynamic> toJson({bool exportOnlyChanged = false, bool ignoreNulls = false}) {
    Map<String, dynamic> map = super.toJson(exportOnlyChanged: exportOnlyChanged, ignoreNulls: ignoreNulls);

    setJsonValue(map, 'contact', contact);
    setJsonValue(map, 'street', street);
    setJsonValue(map, 'number', number);
    setJsonValue(map, 'neighborhood', neighborhood);
    setJsonValue(map, 'complement', complement);
    setJsonValue(map, 'city_name', cityName);
    setJsonValue(map, 'city_code', cityCode);
    setJsonValue(map, 'zip_code', zipCode);
    setJsonValue(map, 'state', state);
    setJsonValue(map, 'country', country);
    
    return map;
  }
}